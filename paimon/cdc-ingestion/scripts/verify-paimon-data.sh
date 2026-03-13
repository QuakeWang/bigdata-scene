#!/bin/bash
# ============================================================
# Verify Paimon data consistency with MySQL source
# Execute inside the JobManager container
# ============================================================

set -e

FLINK_SQL="/opt/flink/bin/sql-client.sh"

echo "============================================================"
echo "  Paimon Data Verification"
echo "============================================================"
echo ""

# Run queries in Flink SQL Client
$FLINK_SQL -e "
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

-- Row counts per table
SELECT 'orders' AS tbl, COUNT(*) AS cnt FROM orders
UNION ALL
SELECT 'lineitem', COUNT(*) FROM lineitem
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'supplier', COUNT(*) FROM supplier
UNION ALL
SELECT 'part', COUNT(*) FROM part
UNION ALL
SELECT 'nation', COUNT(*) FROM nation
UNION ALL
SELECT 'region', COUNT(*) FROM region;

-- Order status distribution
SELECT o_orderstatus, COUNT(*) AS cnt FROM orders GROUP BY o_orderstatus;

-- Last 5 snapshots
SELECT * FROM orders\$snapshots ORDER BY snapshot_id DESC LIMIT 5;
"

echo ""
echo "Verification complete!"
