-- ============================================================
-- Step 3: Query Verification — Run queries on Paimon tables
-- Execute in Flink SQL Client (catalog must be created first)
-- ============================================================

-- Create/use Paimon Catalog
CREATE CATALOG IF NOT EXISTS paimon_catalog WITH (
    'type' = 'paimon',
    'warehouse' = 's3://paimon/warehouse',
    's3.endpoint' = 'http://minio:9000',
    's3.access-key' = 'admin',
    's3.secret-key' = 'admin123456',
    's3.path.style.access' = 'true'
);

USE CATALOG paimon_catalog;
USE tpch;

-- ============================================================
-- 1. Basic verification: row counts per table
-- ============================================================
SELECT 'region' AS table_name, COUNT(*) AS cnt FROM region
UNION ALL
SELECT 'nation', COUNT(*) FROM nation
UNION ALL
SELECT 'supplier', COUNT(*) FROM supplier
UNION ALL
SELECT 'part', COUNT(*) FROM part
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'lineitem', COUNT(*) FROM lineitem;

-- ============================================================
-- 2. Paimon snapshot history (system table)
-- ============================================================
SELECT * FROM orders$snapshots ORDER BY snapshot_id DESC LIMIT 10;

-- ============================================================
-- 3. Paimon audit log / changelog (system table)
-- ============================================================
-- Note: audit_log shows change type per record (+I, -U, +U, -D)
SELECT * FROM orders$audit_log LIMIT 20;

-- ============================================================
-- 4. TPC-H Q1 (simplified) — Pricing Summary Report
--    Group by returnflag and linestatus
-- ============================================================
SELECT
    l_returnflag,
    l_linestatus,
    SUM(l_quantity) AS sum_qty,
    SUM(l_extendedprice) AS sum_base_price,
    SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
    SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
    AVG(l_quantity) AS avg_qty,
    AVG(l_extendedprice) AS avg_price,
    AVG(l_discount) AS avg_disc,
    COUNT(*) AS count_order
FROM lineitem
WHERE l_shipdate <= DATE '1998-12-01'
GROUP BY l_returnflag, l_linestatus
ORDER BY l_returnflag, l_linestatus;

-- ============================================================
-- 5. TPC-H Q3 (simplified) — Shipping Priority
--    Query high-value unshipped orders
-- ============================================================
SELECT
    o.o_orderkey,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS revenue,
    o.o_orderdate,
    o.o_shippriority
FROM customer c
JOIN orders o ON c.c_custkey = o.o_custkey
JOIN lineitem l ON o.o_orderkey = l.l_orderkey
WHERE c.c_mktsegment = 'BUILDING'
  AND o.o_orderdate < DATE '1995-03-15'
  AND l.l_shipdate > DATE '1995-03-15'
GROUP BY o.o_orderkey, o.o_orderdate, o.o_shippriority
ORDER BY revenue DESC, o.o_orderdate
LIMIT 10;

-- ============================================================
-- 6. Order status distribution (verify CDC changes)
-- ============================================================
SELECT o_orderstatus, COUNT(*) AS cnt
FROM orders
GROUP BY o_orderstatus;
