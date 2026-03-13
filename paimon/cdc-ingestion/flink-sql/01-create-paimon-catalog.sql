-- ============================================================
-- Step 1: Create Paimon Catalog (backed by MinIO S3 storage)
-- Execute in Flink SQL Client
-- ============================================================

CREATE CATALOG paimon_catalog WITH (
    'type' = 'paimon',
    'warehouse' = 's3://paimon/warehouse',
    's3.endpoint' = 'http://minio:9000',
    's3.access-key' = 'admin',
    's3.secret-key' = 'admin123456',
    's3.path.style.access' = 'true'
);

USE CATALOG paimon_catalog;

-- Create database (used when manually creating tables)
CREATE DATABASE IF NOT EXISTS tpch;
