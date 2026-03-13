-- ============================================================
-- TPC-H Seed Data — Dimension Tables (region, nation, part, supplier, partsupp, customer)
-- ============================================================

USE tpch;

-- region (5 rows - TPC-H standard)
INSERT INTO region VALUES (0, 'AFRICA',      'lar deposits. blithely final packages cajole.');
INSERT INTO region VALUES (1, 'AMERICA',     'hs use ironic, even requests.');
INSERT INTO region VALUES (2, 'ASIA',        'ges. thinly even pinto beans ca');
INSERT INTO region VALUES (3, 'EUROPE',      'ly final courts cajole furiously final excuse');
INSERT INTO region VALUES (4, 'MIDDLE EAST', 'uickly special accounts cajole carefully blithely close');

-- nation (25 rows - TPC-H standard)
INSERT INTO nation VALUES (0,  'ALGERIA',       0, 'furiously regular deposits haggle.');
INSERT INTO nation VALUES (1,  'ARGENTINA',     1, 'al foxes promise slyly.');
INSERT INTO nation VALUES (2,  'BRAZIL',        1, 'y alongside of the pending deposits.');
INSERT INTO nation VALUES (3,  'CANADA',        1, 'eas hang ironic, silent packages.');
INSERT INTO nation VALUES (4,  'EGYPT',         4, 'y above the carefully unusual theodolites.');
INSERT INTO nation VALUES (5,  'ETHIOPIA',      0, 'ven packages wake quickly.');
INSERT INTO nation VALUES (6,  'FRANCE',        3, 'refully final requests.');
INSERT INTO nation VALUES (7,  'GERMANY',       3, 'l platelets. regular accounts x-ray.');
INSERT INTO nation VALUES (8,  'INDIA',         2, 'ss excuses cajole slyly across the packages.');
INSERT INTO nation VALUES (9,  'INDONESIA',     2, 'slyly express asymptotes.');
INSERT INTO nation VALUES (10, 'IRAN',          4, 'efully alongside of the slyly final dependencies.');
INSERT INTO nation VALUES (11, 'IRAQ',          4, 'nic deposits boost atop the quickly final requests.');
INSERT INTO nation VALUES (12, 'JAPAN',         2, 'ously. final, express gifts cajole a');
INSERT INTO nation VALUES (13, 'JORDAN',        4, 'ic deposits are blithely about the carefully regular');
INSERT INTO nation VALUES (14, 'KENYA',         0, 'pending excuses haggle furiously deposits.');
INSERT INTO nation VALUES (15, 'MOROCCO',       0, 'rns. blithely bold courts among the closely regular');
INSERT INTO nation VALUES (16, 'MOZAMBIQUE',    0, 's. ironic, unusual asymptotes wake blithely r');
INSERT INTO nation VALUES (17, 'PERU',          1, 'platelets. blithely pending dependencies use fluffily');
INSERT INTO nation VALUES (18, 'CHINA',         2, 'c dependencies. furiously express notornis sleep slyly');
INSERT INTO nation VALUES (19, 'ROMANIA',       3, 'ular asymptotes are about the furious multipliers.');
INSERT INTO nation VALUES (20, 'SAUDI ARABIA',  4, 'ts. silent requests haggle. closely express packages');
INSERT INTO nation VALUES (21, 'VIETNAM',       2, 'hely enticingly express accounts.');
INSERT INTO nation VALUES (22, 'RUSSIA',        3, 'requests against the platelets use never according');
INSERT INTO nation VALUES (23, 'UNITED KINGDOM',3, 'eans boost carefully special requests.');
INSERT INTO nation VALUES (24, 'UNITED STATES', 1, 'y final packages. slow foxes cajole quickly.');

-- supplier (10 rows)
INSERT INTO supplier VALUES (1,  'Supplier#000000001', 'N kD4on9OM Ipw3,gf0JBoQDd7tgrzrddZ',  17, '27-918-335-1736',  5755.94, 'each slyly above the careful');
INSERT INTO supplier VALUES (2,  'Supplier#000000002', '89eJ5ksX3ImxJQBvxObC,',                  5, '15-679-861-2259',  4032.68, 'slyly bold instructions.');
INSERT INTO supplier VALUES (3,  'Supplier#000000003', 'q1,G3Pj6OjIuUYfUoH18BFTKP5aU9bEV3',     1, '11-383-516-1199',  4192.40, 'blithely silent requests after the express');
INSERT INTO supplier VALUES (4,  'Supplier#000000004', 'Bk7ah4CK8SYQTepEmvMkkgMwg',              15, '25-843-787-7479',  4641.08, 'riously even requests above the exp');
INSERT INTO supplier VALUES (5,  'Supplier#000000005', 'Gcdm2rJRzl5QLTVzc09qIBYE5uj3h1',         18, '28-228-527-1038',  238.65,  'efully unusual tithes among the quickly');
INSERT INTO supplier VALUES (6,  'Supplier#000000006', 'tQxuVm7s7CnK',                            8, '18-482-551-4927',  8038.64, 'bold, ironic deposits integrate carefully');
INSERT INTO supplier VALUES (7,  'Supplier#000000007', 's,4TicNGB4uO6PaSqNBUq',                  24, '34-578-652-3963',  6820.35, 'pinto beans x-ray furiously.');
INSERT INTO supplier VALUES (8,  'Supplier#000000008', '9Sq4bBH2FQEmaFOocY45sRTxo6WQ',            0, '10-462-187-8014',  7627.85, 'deposits across the slyly bold');
INSERT INTO supplier VALUES (9,  'Supplier#000000009', '1KhUgZegwM3ua7dsYmekYBsK',               10, '20-253-590-6132',  8541.55, 'ons. ironic pinto beans nag');
INSERT INTO supplier VALUES (10, 'Supplier#000000010', 'Saez5gCHNFj5S4RYIUNfVnouIi5e',            3, '13-971-860-3288',  5765.33, 'bove the slyly silent');

-- part (20 rows)
INSERT INTO part VALUES (1,  'goldenrod lavender spring chocolate lace', 'Manufacturer#1', 'Brand#13', 'PROMO BURNISHED COPPER',  7, 'JUMBO PKG',  901.00, 'ly. slyly ironi');
INSERT INTO part VALUES (2,  'blush thistle blue yellow saddle',        'Manufacturer#1', 'Brand#13', 'LARGE BRUSHED BRASS',     1, 'LG CASE',    902.00, 'lar accounts amo');
INSERT INTO part VALUES (3,  'spring green yellow purple cornsilk',     'Manufacturer#4', 'Brand#42', 'STANDARD POLISHED BRASS', 21, 'WRAP CASE',  903.00, 'egular deposits');
INSERT INTO part VALUES (4,  'cornflower chocolate smoke green pink',   'Manufacturer#3', 'Brand#34', 'SMALL PLATED BRASS',      14, 'MED DRUM',   904.00, 'p]y blithely above');
INSERT INTO part VALUES (5,  'forest brown coral puff cream',           'Manufacturer#3', 'Brand#32', 'STANDARD POLISHED TIN',   15, 'SM PKG',     905.00, 'wake carefully');
INSERT INTO part VALUES (6,  'bisque cornflower lawn forest magenta',   'Manufacturer#2', 'Brand#24', 'PROMO PLATED STEEL',      4, 'MED BAG',    906.00, 'slyly regular ti');
INSERT INTO part VALUES (7,  'moccasin green thistle khaki floral',     'Manufacturer#1', 'Brand#11', 'SMALL PLATED COPPER',     45, 'SM BAG',     907.00, 'ly regular courts');
INSERT INTO part VALUES (8,  'misty lace thistle midnight coral',       'Manufacturer#4', 'Brand#44', 'PROMO BURNISHED TIN',     41, 'LG DRUM',    908.00, 'e carefully bold');
INSERT INTO part VALUES (9,  'thistle dim navajo dark gainsboro',       'Manufacturer#4', 'Brand#43', 'SMALL BURNISHED STEEL',   12, 'WRAP CASE',  909.00, 'ironic foxes. dep');
INSERT INTO part VALUES (10, 'linen pink saddle puff powder',           'Manufacturer#5', 'Brand#54', 'LARGE BURNISHED STEEL',   44, 'LG CAN',     910.00, 'ithely final dep');
INSERT INTO part VALUES (11, 'spring maroon seashell almond orchid',    'Manufacturer#2', 'Brand#25', 'STANDARD BURNISHED NICKEL',43,'WRAP BOX',   911.00, 'ng the regular');
INSERT INTO part VALUES (12, 'cornsilk tan smoke lavender floral',      'Manufacturer#3', 'Brand#33', 'MEDIUM ANODIZED STEEL',   25, 'JUMBO CASE', 912.00, 'blithely pinto b');
INSERT INTO part VALUES (13, 'ghost olive orange rosy thistle',         'Manufacturer#5', 'Brand#55', 'MEDIUM BURNISHED NICKEL', 1, 'JUMBO PKG',  913.00, 'efully express id');
INSERT INTO part VALUES (14, 'navy lemon forest blue honeydew',         'Manufacturer#1', 'Brand#13', 'SMALL POLISHED STEEL',    28, 'MED DRUM',   914.00, 'e fluffily around');
INSERT INTO part VALUES (15, 'blanched tomato lemon honeydew salmon',   'Manufacturer#1', 'Brand#15', 'LARGE ANODIZED BRASS',    45, 'LG CASE',    915.00, 'ole. carefully');
INSERT INTO part VALUES (16, 'deep puff snow moccasin ivory',           'Manufacturer#3', 'Brand#32', 'PROMO PLATED TIN',        19, 'SM BOX',     916.00, 'ickly above the c');
INSERT INTO part VALUES (17, 'wheat sienna puff midnight cornsilk',     'Manufacturer#1', 'Brand#14', 'SMALL BURNISHED STEEL',   9, 'MED BAG',    917.00, 'ular deposit');
INSERT INTO part VALUES (18, 'olive hot lavender grey cornsilk',        'Manufacturer#2', 'Brand#21', 'LARGE BURNISHED COPPER',  34, 'JUMBO PKG',  918.00, 'ets sleep careful');
INSERT INTO part VALUES (19, 'sandy midnight coral chocolate orchid',   'Manufacturer#2', 'Brand#22', 'STANDARD BURNISHED COPPER',33,'SM PKG',     919.00, 'ithely ironic de');
INSERT INTO part VALUES (20, 'blush thistle blue yellow green',         'Manufacturer#4', 'Brand#41', 'ECONOMY PLATED STEEL',    18, 'LG BOX',     920.00, 'ests. regular');

-- partsupp (40 rows - 2 suppliers per part for first 20 parts)
INSERT INTO partsupp VALUES (1,  1, 8076, 993.49, 'carefully ironic requests. fluffily');
INSERT INTO partsupp VALUES (1,  6, 3956, 337.09, 'after the regular foxes.');
INSERT INTO partsupp VALUES (2,  2, 8895, 378.49, 'carefully slyly special');
INSERT INTO partsupp VALUES (2,  7, 4969, 915.27, 'c pinto beans nag');
INSERT INTO partsupp VALUES (3,  3, 4651, 920.92, 'riously bold accounts.');
INSERT INTO partsupp VALUES (3,  8, 7757, 438.37, 'ly final pinto bean accounts.');
INSERT INTO partsupp VALUES (4,  4, 1339, 113.97, 'blithely even pinto beans cajole along.');
INSERT INTO partsupp VALUES (4,  9, 6377, 591.18, 'careful requests. furiously');
INSERT INTO partsupp VALUES (5,  5, 4935, 627.56, 'efully unusual requests.');
INSERT INTO partsupp VALUES (5, 10, 9653, 951.79, 'fluffily pending accounts are');
INSERT INTO partsupp VALUES (6,  1, 1627, 681.69, 'efully bold pinto beans.');
INSERT INTO partsupp VALUES (6,  6, 6451, 109.64, 'usly express accounts.');
INSERT INTO partsupp VALUES (7,  2, 7454, 350.18, 'slow accounts x-ray.');
INSERT INTO partsupp VALUES (7,  7, 2770, 149.27, 'regular foxes. carefully');
INSERT INTO partsupp VALUES (8,  3, 3336, 870.65, 'quickly regular pinto beans.');
INSERT INTO partsupp VALUES (8,  8, 8851, 412.84, 'requests cajole across the');
INSERT INTO partsupp VALUES (9,  4, 6652, 337.44, 'bold accounts. regular deposits');
INSERT INTO partsupp VALUES (9,  9, 4757, 640.15, 'fully special deposits with the');
INSERT INTO partsupp VALUES (10, 5, 2961, 469.02, 'boldly pending requests.');
INSERT INTO partsupp VALUES (10,10, 5799, 723.50, 'carefully above the silent');

-- customer (15 rows)
INSERT INTO customer VALUES (1,  'Customer#000000001', 'IVhzIApeRb',               15, '25-989-741-2988', 711.56,  'BUILDING',  'to the even, regular platelets.');
INSERT INTO customer VALUES (2,  'Customer#000000002', 'XSTf4,NCwDVaWNe6tEgvwfmRchLXak', 13, '23-768-687-3665', 121.65,  'AUTOMOBILE','l accounts. blithely ironic theodolites');
INSERT INTO customer VALUES (3,  'Customer#000000003', 'MG9kdTD2WBHm',              1, '11-719-748-3364', 7498.12, 'AUTOMOBILE','deposits eat slyly ironic, even instruc');
INSERT INTO customer VALUES (4,  'Customer#000000004', 'XxVSJsLAGtn',               4, '14-128-190-5944', 2866.83, 'MACHINERY', 'requests. final, regular ideas sleep final');
INSERT INTO customer VALUES (5,  'Customer#000000005', 'KvpyuHCplrB84WgAiGV6sYpZq7Tj', 3, '13-750-942-6364', 794.47,  'HOUSEHOLD', 'n accounts will have to unwind.');
INSERT INTO customer VALUES (6,  'Customer#000000006', 'sKZz0CsnMD7mp4Xd0YrBvx',    20, '30-114-968-4951', 7638.57, 'AUTOMOBILE','tions. even deposits boost according to');
INSERT INTO customer VALUES (7,  'Customer#000000007', 'TcGe5gaZNgVePxU5kRrvXBfkasDTea', 18, '28-190-982-9759', 9561.95, 'AUTOMOBILE','ainst the ironic, express theodolites.');
INSERT INTO customer VALUES (8,  'Customer#000000008', 'I9Q2dLn5hJeV',              17, '27-147-574-9335', 6819.74, 'BUILDING',  'among the slyly regular theodolites');
INSERT INTO customer VALUES (9,  'Customer#000000009', 'xKiAFTjUsCuxfeleNqefumTrjS', 8, '18-338-906-3675', 8324.07, 'FURNITURE', 'r theodolites according to the requests');
INSERT INTO customer VALUES (10, 'Customer#000000010', '6LrEaV6KR6PLVcgl2ArL',       5, '15-741-346-9870', 2753.54, 'HOUSEHOLD', 'es regular deposits haggle.');
INSERT INTO customer VALUES (11, 'Customer#000000011', 'PkWS 3HlXqwTuzrKg633BEi',    7, '17-266-861-7090', -272.60, 'BUILDING',  'ounts. regular, express');
INSERT INTO customer VALUES (12, 'Customer#000000012', '9PWKSgiMnOnWHrOB84EE',       13, '23-791-276-1263', 3396.49, 'HOUSEHOLD', 'to the carefully final braids.');
INSERT INTO customer VALUES (13, 'Customer#000000013', 'nsXQu0oVjD7PM659uC3SRSp',    3, '13-761-547-5974', 3857.34, 'BUILDING',  'ounts sleep carefully after the close');
INSERT INTO customer VALUES (14, 'Customer#000000014', 'KXkletMlL2JQEA',             1, '11-845-129-3851', 5266.30, 'FURNITURE', 'ironic packages. slyly final');
INSERT INTO customer VALUES (15, 'Customer#000000015', 'YtWggXoOLdwdo7b0y,BZaGUQMLJMX1Y', 23, '33-687-542-7601', 2788.52, 'HOUSEHOLD', 'platelets. regular deposits detect');
