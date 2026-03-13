-- ============================================================
-- Step 2: CDC Database Sync — Define CDC source and Paimon target tables
--
-- Note: For production use, prefer paimon-flink-action's mysql-sync-database
-- command (see README). This file demonstrates the SQL approach for learning.
-- ============================================================

-- Use default catalog to define MySQL CDC source tables
USE CATALOG default_catalog;
USE default_database;

-- ----------------------------------------
-- MySQL CDC source table: orders
-- ----------------------------------------
CREATE TABLE mysql_orders (
    o_orderkey      INT NOT NULL,
    o_custkey       INT NOT NULL,
    o_orderstatus   STRING NOT NULL,
    o_totalprice    DECIMAL(15,2) NOT NULL,
    o_orderdate     DATE NOT NULL,
    o_orderpriority STRING NOT NULL,
    o_clerk         STRING NOT NULL,
    o_shippriority  INT NOT NULL,
    o_comment       STRING,
    PRIMARY KEY (o_orderkey) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname'  = 'mysql',
    'port'      = '3306',
    'username'  = 'root',
    'password'  = '123456',
    'database-name' = 'tpch',
    'table-name'    = 'orders'
);

-- ----------------------------------------
-- MySQL CDC source table: lineitem
-- ----------------------------------------
CREATE TABLE mysql_lineitem (
    l_orderkey      INT NOT NULL,
    l_partkey       INT NOT NULL,
    l_suppkey       INT NOT NULL,
    l_linenumber    INT NOT NULL,
    l_quantity      DECIMAL(15,2) NOT NULL,
    l_extendedprice DECIMAL(15,2) NOT NULL,
    l_discount      DECIMAL(15,2) NOT NULL,
    l_tax           DECIMAL(15,2) NOT NULL,
    l_returnflag    STRING NOT NULL,
    l_linestatus    STRING NOT NULL,
    l_shipdate      DATE NOT NULL,
    l_commitdate    DATE NOT NULL,
    l_receiptdate   DATE NOT NULL,
    l_shipinstruct  STRING NOT NULL,
    l_shipmode      STRING NOT NULL,
    l_comment       STRING,
    PRIMARY KEY (l_orderkey, l_linenumber) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'hostname'  = 'mysql',
    'port'      = '3306',
    'username'  = 'root',
    'password'  = '123456',
    'database-name' = 'tpch',
    'table-name'    = 'lineitem'
);

-- ----------------------------------------
-- Switch to Paimon Catalog for target tables
-- ----------------------------------------
USE CATALOG paimon_catalog;
USE tpch;

-- Create Paimon target table: orders
CREATE TABLE IF NOT EXISTS orders (
    o_orderkey      INT NOT NULL,
    o_custkey       INT,
    o_orderstatus   STRING,
    o_totalprice    DECIMAL(15,2),
    o_orderdate     DATE,
    o_orderpriority STRING,
    o_clerk         STRING,
    o_shippriority  INT,
    o_comment       STRING,
    PRIMARY KEY (o_orderkey) NOT ENFORCED
);

-- Create Paimon target table: lineitem
CREATE TABLE IF NOT EXISTS lineitem (
    l_orderkey      INT NOT NULL,
    l_linenumber    INT NOT NULL,
    l_partkey       INT,
    l_suppkey       INT,
    l_quantity      DECIMAL(15,2),
    l_extendedprice DECIMAL(15,2),
    l_discount      DECIMAL(15,2),
    l_tax           DECIMAL(15,2),
    l_returnflag    STRING,
    l_linestatus    STRING,
    l_shipdate      DATE,
    l_commitdate    DATE,
    l_receiptdate   DATE,
    l_shipinstruct  STRING,
    l_shipmode      STRING,
    l_comment       STRING,
    PRIMARY KEY (l_orderkey, l_linenumber) NOT ENFORCED
);

-- ----------------------------------------
-- Submit CDC sync jobs
-- Note: Each INSERT INTO must be submitted as a separate Flink job
-- ----------------------------------------

-- Sync orders
INSERT INTO paimon_catalog.tpch.orders
SELECT * FROM default_catalog.default_database.mysql_orders;

-- Sync lineitem (requires a new SQL Client session or STATEMENT SET)
-- INSERT INTO paimon_catalog.tpch.lineitem
-- SELECT * FROM default_catalog.default_database.mysql_lineitem;
