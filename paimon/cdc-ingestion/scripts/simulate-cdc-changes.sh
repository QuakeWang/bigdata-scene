#!/bin/bash
# ============================================================
# 模拟 TPC-H 订单生命周期 CDC 变更
# 在 MySQL 容器中执行，产生 binlog 变更供 Flink CDC 捕获
#
# 用法:
#   bash simulate-cdc-changes.sh              # 一次性运行 6 个阶段
#   bash simulate-cdc-changes.sh --duration 120  # 持续运行 120 秒
# ============================================================

set -e

MYSQL_CMD="mysql -uroot -p123456 -N tpch"

# ========================================
# 参数解析
# ========================================
MODE="once"
DURATION=0

while [[ $# -gt 0 ]]; do
    case $1 in
        --duration|-d)
            MODE="continuous"
            DURATION=$2
            shift 2
            ;;
        --help|-h)
            echo "Usage: $0 [--duration <seconds>]"
            echo ""
            echo "Options:"
            echo "  --duration, -d  持续运行模式，指定运行时长（秒）"
            echo "  --help, -h      显示帮助信息"
            echo ""
            echo "Examples:"
            echo "  $0              # 一次性运行 6 个阶段"
            echo "  $0 -d 120       # 持续产生 CDC 变更 120 秒"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# ========================================
# 一次性模式：6 阶段固定变更
# ========================================
run_once() {
    echo "============================================================"
    echo "  Paimon CDC 变更模拟 [一次性模式]"
    echo "============================================================"

    # Phase 1: INSERT
    echo ""
    echo "[Phase 1] 新建订单 — INSERT orders + lineitem"
    $MYSQL_CMD -e "
    INSERT INTO orders VALUES
        (100, 1, 'O', 125000.50, '2024-01-15', '1-URGENT', 'Clerk#000000100', 0, 'new urgent order from customer 1'),
        (101, 3, 'O', 88500.00,  '2024-01-16', '2-HIGH',   'Clerk#000000101', 0, 'high priority order'),
        (102, 5, 'O', 42300.75,  '2024-01-17', '3-MEDIUM', 'Clerk#000000102', 0, 'medium priority order'),
        (103, 7, 'O', 196000.00, '2024-01-18', '1-URGENT', 'Clerk#000000103', 0, 'bulk order from customer 7'),
        (104, 9, 'O', 15600.25,  '2024-01-19', '5-LOW',    'Clerk#000000104', 0, 'small routine order');
    "
    $MYSQL_CMD -e "
    INSERT INTO lineitem VALUES
        (100, 1, 1, 1, 25.00, 24375.00, 0.05, 0.08, 'N', 'O', '2024-02-15', '2024-02-01', '2024-02-20', 'DELIVER IN PERSON', 'TRUCK', 'urgent delivery'),
        (100, 3, 3, 2, 10.00, 9530.00,  0.02, 0.04, 'N', 'O', '2024-02-10', '2024-01-28', '2024-02-15', 'NONE',              'AIR',   'express shipment'),
        (101, 5, 5, 1, 50.00, 47250.00, 0.08, 0.06, 'N', 'O', '2024-02-20', '2024-02-05', '2024-02-25', 'COLLECT COD',       'SHIP',  'bulk shipment'),
        (102, 2, 2, 1, 15.00, 15735.00, 0.03, 0.02, 'N', 'O', '2024-02-12', '2024-01-30', '2024-02-18', 'TAKE BACK RETURN',  'MAIL',  'standard delivery'),
        (103, 8, 8, 1, 80.00, 72640.00, 0.10, 0.07, 'N', 'O', '2024-03-01', '2024-02-15', '2024-03-10', 'NONE',              'RAIL',  'large quantity'),
        (103, 4, 4, 2, 35.00, 31535.00, 0.04, 0.05, 'N', 'O', '2024-02-28', '2024-02-10', '2024-03-05', 'DELIVER IN PERSON', 'FOB',   'second line item'),
        (104, 9, 9, 1, 5.00,  4955.00,  0.01, 0.03, 'N', 'O', '2024-02-05', '2024-01-25', '2024-02-10', 'NONE',              'TRUCK', 'small order item');
    "
    echo "  -> 新增 5 笔订单, 7 条订单明细"
    sleep 5

    # Phase 2: UPDATE orders
    echo "[Phase 2] 订单状态变更 — UPDATE"
    $MYSQL_CMD -e "
    UPDATE orders SET o_orderstatus = 'F', o_comment = 'order fulfilled on 2024-02-20' WHERE o_orderkey = 100;
    UPDATE orders SET o_orderstatus = 'P', o_comment = 'partially shipped' WHERE o_orderkey = 101;
    UPDATE orders SET o_totalprice = 180000.00 WHERE o_orderkey = 1;
    "
    echo "  -> 更新 3 笔订单状态/价格"
    sleep 5

    # Phase 3: UPDATE lineitem
    echo "[Phase 3] 订单明细发货状态 — UPDATE"
    $MYSQL_CMD -e "
    UPDATE lineitem SET l_returnflag = 'R', l_linestatus = 'F' WHERE l_orderkey = 100 AND l_linenumber = 1;
    UPDATE lineitem SET l_returnflag = 'A', l_linestatus = 'F' WHERE l_orderkey = 100 AND l_linenumber = 2;
    UPDATE lineitem SET l_shipdate = '2024-02-25', l_receiptdate = '2024-03-05' WHERE l_orderkey = 103 AND l_linenumber = 1;
    "
    echo "  -> 更新 3 条订单明细"
    sleep 5

    # Phase 4: UPDATE customer
    echo "[Phase 4] 客户信息变更 — UPDATE"
    $MYSQL_CMD -e "
    UPDATE customer SET c_address = 'New Address 123, Building A', c_phone = '25-999-888-7777' WHERE c_custkey = 1;
    UPDATE customer SET c_mktsegment = 'AUTOMOBILE' WHERE c_custkey = 5;
    "
    echo "  -> 更新 2 位客户信息"
    sleep 5

    # Phase 5: DELETE
    echo "[Phase 5] 取消订单 — DELETE"
    $MYSQL_CMD -e "
    DELETE FROM lineitem WHERE l_orderkey = 104;
    DELETE FROM orders WHERE o_orderkey = 104;
    "
    echo "  -> 删除 1 笔订单及其明细"
    sleep 5

    # Phase 6: INSERT supplier/part
    echo "[Phase 6] 新增供应商和商品 — INSERT"
    $MYSQL_CMD -e "
    INSERT INTO supplier VALUES
        (11, 'Supplier#000000011', 'New Supplier Address 1', 18, '28-111-222-3333', 9999.99, 'newly registered supplier');
    INSERT INTO part VALUES
        (21, 'midnight blue steel premium widget', 'Manufacturer#5', 'Brand#55', 'ECONOMY BURNISHED STEEL', 30, 'LG PKG', 921.00, 'new premium part');
    INSERT INTO partsupp VALUES
        (21, 11, 5000, 450.00, 'new supplier for new part');
    "
    echo "  -> 新增 1 个供应商, 1 个商品, 1 条供应关系"

    echo ""
    echo "============================================================"
    echo "  一次性模式完成！"
    echo "  INSERT: 5 orders + 7 lineitem + 1 supplier + 1 part + 1 partsupp"
    echo "  UPDATE: 3 orders + 3 lineitem + 2 customer"
    echo "  DELETE: 1 order + 1 lineitem"
    echo "============================================================"
}

# ========================================
# 持续模式：在指定时间内循环产生随机 CDC 变更
# ========================================

# 随机数辅助函数
rand_between() {
    local min=$1 max=$2
    echo $(( RANDOM % (max - min + 1) + min ))
}

rand_element() {
    local arr=("$@")
    echo "${arr[$(( RANDOM % ${#arr[@]} ))]}"
}

# 获取当前最大 orderkey，用于生成不冲突的新订单
get_next_orderkey() {
    local max_key
    max_key=$($MYSQL_CMD -e "SELECT COALESCE(MAX(o_orderkey), 200) FROM orders;" 2>/dev/null | tail -1)
    echo $(( max_key + 1 ))
}

run_continuous() {
    local duration=$1
    local end_time=$(( $(date +%s) + duration ))
    local op_count=0

    echo "============================================================"
    echo "  Paimon CDC 变更模拟 [持续模式]"
    echo "  运行时长: ${duration} 秒"
    echo "  Ctrl+C 可随时终止"
    echo "============================================================"

    local PRIORITIES=("1-URGENT" "2-HIGH" "3-MEDIUM" "4-NOT SPECI" "5-LOW")
    local STATUSES=("O" "F" "P")
    local SHIPMODES=("TRUCK" "MAIL" "SHIP" "AIR" "RAIL" "REG AIR" "FOB")
    local INSTRUCTIONS=("DELIVER IN PERSON" "COLLECT COD" "NONE" "TAKE BACK RETURN")
    local CUSTOMER_IDS=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)

    while [ $(date +%s) -lt $end_time ]; do
        local remaining=$(( end_time - $(date +%s) ))
        local action=$(( RANDOM % 10 ))

        if [ $action -le 4 ]; then
            # ------ 50% 概率：新建订单 ------
            local okey=$(get_next_orderkey)
            local cust=$(rand_element "${CUSTOMER_IDS[@]}")
            local price=$(rand_between 1000 500000).$(rand_between 10 99)
            local prio=$(rand_element "${PRIORITIES[@]}")
            local today=$(date +%Y-%m-%d)

            $MYSQL_CMD -e "
            INSERT INTO orders VALUES
                ($okey, $cust, 'O', $price, '$today', '$prio', 'Clerk#000000$(rand_between 100 999)', 0, 'auto generated order');
            " 2>/dev/null

            # 为新订单插入 1-3 条 lineitem
            local num_lines=$(rand_between 1 3)
            for (( li=1; li<=num_lines; li++ )); do
                local partkey=$(rand_between 1 20)
                local suppkey
                suppkey=$($MYSQL_CMD -e "SELECT ps_suppkey FROM partsupp WHERE ps_partkey=$partkey LIMIT 1;" 2>/dev/null | tail -1)
                if [ -z "$suppkey" ]; then suppkey=1; fi
                local qty=$(rand_between 1 50).00
                local extprice=$(rand_between 500 50000).$(rand_between 10 99)
                local disc=0.0$(rand_between 0 9)
                local tax=0.0$(rand_between 1 8)
                local shipmode=$(rand_element "${SHIPMODES[@]}")
                local instruct=$(rand_element "${INSTRUCTIONS[@]}")
                local shipdate=$(date -d "+$(rand_between 7 60) days" +%Y-%m-%d 2>/dev/null || date -v+$(rand_between 7 60)d +%Y-%m-%d)
                local commitdate=$(date -d "+$(rand_between 3 30) days" +%Y-%m-%d 2>/dev/null || date -v+$(rand_between 3 30)d +%Y-%m-%d)
                local receiptdate=$(date -d "+$(rand_between 10 90) days" +%Y-%m-%d 2>/dev/null || date -v+$(rand_between 10 90)d +%Y-%m-%d)

                $MYSQL_CMD -e "
                INSERT IGNORE INTO lineitem VALUES
                    ($okey, $partkey, $suppkey, $li, $qty, $extprice, $disc, $tax,
                     'N', 'O', '$shipdate', '$commitdate', '$receiptdate',
                     '$instruct', '$shipmode', 'auto generated');
                " 2>/dev/null
            done

            op_count=$((op_count + 1))
            echo "[$(date +%H:%M:%S)] INSERT order #$okey ($num_lines items) | 剩余 ${remaining}s | 累计 ${op_count} 次操作"

        elif [ $action -le 7 ]; then
            # ------ 30% 概率：更新订单状态/价格 ------
            local target_key
            target_key=$($MYSQL_CMD -e "SELECT o_orderkey FROM orders WHERE o_orderstatus='O' ORDER BY RAND() LIMIT 1;" 2>/dev/null | tail -1)
            if [ -n "$target_key" ] && [ "$target_key" != "NULL" ]; then
                local new_status=$(rand_element "${STATUSES[@]}")
                local price_delta=$(rand_between -5000 10000)
                $MYSQL_CMD -e "
                UPDATE orders SET o_orderstatus='$new_status',
                    o_totalprice = o_totalprice + $price_delta,
                    o_comment = 'status updated at $(date +%H:%M:%S)'
                WHERE o_orderkey = $target_key;
                " 2>/dev/null
                op_count=$((op_count + 1))
                echo "[$(date +%H:%M:%S)] UPDATE order #$target_key -> status=$new_status | 剩余 ${remaining}s | 累计 ${op_count} 次操作"
            fi

        elif [ $action -le 8 ]; then
            # ------ 10% 概率：更新 lineitem 发货状态 ------
            local li_key
            li_key=$($MYSQL_CMD -e "SELECT l_orderkey FROM lineitem WHERE l_linestatus='O' ORDER BY RAND() LIMIT 1;" 2>/dev/null | tail -1)
            if [ -n "$li_key" ] && [ "$li_key" != "NULL" ]; then
                $MYSQL_CMD -e "
                UPDATE lineitem SET l_linestatus='F', l_returnflag='A'
                WHERE l_orderkey=$li_key AND l_linestatus='O' LIMIT 1;
                " 2>/dev/null
                op_count=$((op_count + 1))
                echo "[$(date +%H:%M:%S)] UPDATE lineitem (order #$li_key) -> shipped | 剩余 ${remaining}s | 累计 ${op_count} 次操作"
            fi

        else
            # ------ 10% 概率：删除一笔已完成的订单 ------
            local del_key
            del_key=$($MYSQL_CMD -e "SELECT o_orderkey FROM orders WHERE o_orderstatus='F' AND o_orderkey > 100 ORDER BY RAND() LIMIT 1;" 2>/dev/null | tail -1)
            if [ -n "$del_key" ] && [ "$del_key" != "NULL" ]; then
                $MYSQL_CMD -e "
                DELETE FROM lineitem WHERE l_orderkey=$del_key;
                DELETE FROM orders WHERE o_orderkey=$del_key;
                " 2>/dev/null
                op_count=$((op_count + 1))
                echo "[$(date +%H:%M:%S)] DELETE order #$del_key (fulfilled) | 剩余 ${remaining}s | 累计 ${op_count} 次操作"
            fi
        fi

        # 随机间隔 1-5 秒
        sleep $(rand_between 1 5)
    done

    echo ""
    echo "============================================================"
    echo "  持续模式完成！"
    echo "  运行时长: ${duration} 秒"
    echo "  总操作次数: ${op_count}"
    echo "============================================================"
}

# ========================================
# 主入口
# ========================================
if [ "$MODE" = "continuous" ]; then
    run_continuous "$DURATION"
else
    run_once
fi
