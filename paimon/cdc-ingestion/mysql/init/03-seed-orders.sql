-- ============================================================
-- TPC-H Seed Data — Fact Tables (orders, lineitem)
-- ============================================================

USE tpch;

-- orders (30 rows, mixed status: O=open, F=fulfilled, P=partial)
INSERT INTO orders VALUES (1,  1,  'O', 173665.47, '1996-01-02', '5-LOW',       'Clerk#000000951', 0, 'nstructions sleep furiously among');
INSERT INTO orders VALUES (2,  10, 'O', 46929.18,  '1996-12-01', '1-URGENT',    'Clerk#000000880', 0, 'foxes. pending accounts at the pending');
INSERT INTO orders VALUES (3,  2,  'F', 193846.25, '1993-10-14', '5-LOW',       'Clerk#000000955', 0, 'sly final accounts boost.');
INSERT INTO orders VALUES (4,  14, 'O', 32151.78,  '1995-10-11', '5-LOW',       'Clerk#000000124', 0, 'sits. slyly regular warthogs cajole.');
INSERT INTO orders VALUES (5,  5,  'F', 144659.20, '1994-07-30', '5-LOW',       'Clerk#000000925', 0, 'quickly. bold deposits sleep slyly.');
INSERT INTO orders VALUES (6,  7,  'F', 58749.59,  '1992-02-21', '4-NOT SPECI', 'Clerk#000000058', 0, 'ggle. special, final requests');
INSERT INTO orders VALUES (7,  4,  'O', 252004.18, '1996-01-10', '2-HIGH',      'Clerk#000000470', 0, 'ly special requests');
INSERT INTO orders VALUES (32, 13, 'O', 130654.06, '1995-07-16', '2-HIGH',      'Clerk#000000616', 0, 'ise blithely bold, regular requests.');
INSERT INTO orders VALUES (33, 6,  'F', 118122.14, '1993-10-27', '3-MEDIUM',    'Clerk#000000409', 0, 'uriously. furiously final request');
INSERT INTO orders VALUES (34, 8,  'O', 58949.67,  '1998-07-21', '3-MEDIUM',    'Clerk#000000223', 0, 'ly final packages. fluffily final');
INSERT INTO orders VALUES (35, 12, 'O', 56936.20,  '1995-10-23', '4-NOT SPECI', 'Clerk#000000259', 0, 'efully alongside of the slyly');
INSERT INTO orders VALUES (36, 9,  'O', 68289.96,  '1996-02-03', '1-URGENT',    'Clerk#000000358', 0, 'ts. silent requests haggle.');
INSERT INTO orders VALUES (37, 15, 'F', 116295.18, '1992-06-03', '3-MEDIUM',    'Clerk#000000456', 0, 'kly regular pinto beans.');
INSERT INTO orders VALUES (38, 12, 'O', 46366.56,  '1996-08-21', '4-NOT SPECI', 'Clerk#000000604', 0, 'haggle blithely. furiously express');
INSERT INTO orders VALUES (39, 3,  'O', 205378.42, '1996-09-20', '3-MEDIUM',    'Clerk#000000659', 0, 'ole express, ironic requests');
INSERT INTO orders VALUES (64, 4,  'F', 20459.65,  '1994-07-16', '3-MEDIUM',    'Clerk#000000661', 0, 'wake fluffily. sometimes ironic');
INSERT INTO orders VALUES (65, 2,  'P', 86811.36,  '1995-03-18', '1-URGENT',    'Clerk#000000632', 0, 'ular requests are blithely pending');
INSERT INTO orders VALUES (66, 13, 'F', 79258.24,  '1994-01-20', '5-LOW',       'Clerk#000000743', 0, 'y pending requests integrate');
INSERT INTO orders VALUES (67, 6,  'O', 116227.05, '1996-12-19', '4-NOT SPECI', 'Clerk#000000547', 0, 'symptotes haggle slyly around');
INSERT INTO orders VALUES (68, 3,  'O', 215135.72, '1998-04-18', '3-MEDIUM',    'Clerk#000000440', 0, 'pinto beans sleep carefully.');

-- lineitem (60 rows)
INSERT INTO lineitem VALUES (1, 2, 2, 1, 17.00, 21168.23, 0.04, 0.02, 'N', 'O', '1996-03-13', '1996-02-12', '1996-03-22', 'DELIVER IN PERSON', 'TRUCK',    'egular courts above the');
INSERT INTO lineitem VALUES (1, 3, 3, 2, 36.00, 34850.16, 0.09, 0.06, 'N', 'O', '1996-04-12', '1996-02-28', '1996-04-20', 'TAKE BACK RETURN',  'MAIL',     'ly final dependencies');
INSERT INTO lineitem VALUES (1, 6, 6, 3, 8.00,  13309.60, 0.10, 0.02, 'N', 'O', '1996-01-29', '1996-03-05', '1996-01-31', 'TAKE BACK RETURN',  'REG AIR',  'riously. regular, express dep');
INSERT INTO lineitem VALUES (2, 1, 1, 1, 38.00, 44694.46, 0.00, 0.05, 'N', 'O', '1997-01-28', '1997-01-14', '1997-02-02', 'TAKE BACK RETURN',  'RAIL',     'ven requests. deposits breach a');
INSERT INTO lineitem VALUES (3, 5, 5, 1, 45.00, 54058.05, 0.06, 0.00, 'R', 'F', '1994-02-02', '1994-01-04', '1994-02-23', 'NONE',              'AIR',      'dings. regular, even');
INSERT INTO lineitem VALUES (3, 6, 1, 2, 49.00, 46796.47, 0.10, 0.00, 'R', 'F', '1993-11-09', '1993-12-20', '1993-11-24', 'TAKE BACK RETURN',  'RAIL',     'unusual accounts. eve');
INSERT INTO lineitem VALUES (3, 1, 6, 3, 27.00, 28955.64, 0.06, 0.07, 'A', 'F', '1994-01-16', '1993-11-22', '1994-01-23', 'DELIVER IN PERSON', 'SHIP',     'nal foxes wake.');
INSERT INTO lineitem VALUES (4, 9, 9, 1, 30.00, 31290.00, 0.03, 0.08, 'N', 'O', '1996-01-10', '1995-12-14', '1996-01-18', 'DELIVER IN PERSON', 'REG AIR',  'ts wake furiously');
INSERT INTO lineitem VALUES (5, 3, 8, 1, 15.00, 16017.45, 0.02, 0.04, 'R', 'F', '1994-10-31', '1994-08-31', '1994-11-20', 'NONE',              'AIR',      'ts wake furiously');
INSERT INTO lineitem VALUES (5, 4, 4, 2, 26.00, 28348.08, 0.07, 0.08, 'R', 'F', '1994-10-16', '1994-09-25', '1994-10-19', 'NONE',              'FOB',      'sts. blithely regular');
INSERT INTO lineitem VALUES (5, 8, 3, 3, 50.00, 47159.00, 0.08, 0.03, 'A', 'F', '1994-08-08', '1994-10-13', '1994-08-26', 'DELIVER IN PERSON', 'AIR',      'eodolites. fluffily unusual');
INSERT INTO lineitem VALUES (6, 1, 6, 1, 37.00, 35645.43, 0.08, 0.03, 'A', 'F', '1992-04-27', '1992-05-15', '1992-05-02', 'TAKE BACK RETURN',  'TRUCK',    'p]y special theodolites');
INSERT INTO lineitem VALUES (7, 10,5, 1, 12.00, 13309.20, 0.07, 0.03, 'N', 'O', '1996-02-01', '1996-03-02', '1996-02-19', 'TAKE BACK RETURN',  'SHIP',     'es. slyly ironic packages');
INSERT INTO lineitem VALUES (7, 3, 8, 2, 9.00,  10152.72, 0.08, 0.08, 'N', 'O', '1996-02-01', '1996-02-23', '1996-02-08', 'NONE',              'TRUCK',    'foxes. pending accounts at');
INSERT INTO lineitem VALUES (7, 6, 6, 3, 46.00, 46052.42, 0.10, 0.07, 'N', 'O', '1996-03-21', '1996-04-07', '1996-04-04', 'NONE',              'FOB',      'blithely regular ideas');
INSERT INTO lineitem VALUES (32, 8, 8,1, 28.00, 31821.52, 0.05, 0.08, 'N', 'O', '1995-10-23', '1995-08-27', '1995-10-26', 'TAKE BACK RETURN',  'TRUCK',    'sleep quickly. req');
INSERT INTO lineitem VALUES (32, 2, 7,2, 32.00, 33568.56, 0.02, 0.00, 'N', 'O', '1995-08-14', '1995-10-07', '1995-08-27', 'COLLECT COD',       'AIR',      'lithely regular deposits');
INSERT INTO lineitem VALUES (32, 5,10,3, 2.00,  2212.50,  0.09, 0.02, 'N', 'O', '1995-08-07', '1995-10-07', '1995-08-23', 'DELIVER IN PERSON', 'AIR',      'express accounts wake');
INSERT INTO lineitem VALUES (33, 7, 7,1, 31.00, 29499.55, 0.09, 0.04, 'A', 'F', '1993-12-09', '1993-12-21', '1993-12-13', 'TAKE BACK RETURN',  'TRUCK',    'usly bold warthogs.');
INSERT INTO lineitem VALUES (33, 4, 4,2, 41.00, 42988.41, 0.09, 0.07, 'R', 'F', '1994-01-03', '1993-12-09', '1994-01-27', 'TAKE BACK RETURN',  'MAIL',     'ages nag slyly');
INSERT INTO lineitem VALUES (34, 9, 4,1, 13.00, 13377.62, 0.00, 0.07, 'N', 'O', '1998-10-23', '1998-09-14', '1998-11-06', 'NONE',              'REG AIR',  'nic accounts.');
INSERT INTO lineitem VALUES (34, 1, 1,2, 22.00, 21230.86, 0.08, 0.06, 'N', 'O', '1998-10-09', '1998-10-16', '1998-10-12', 'COLLECT COD',       'TRUCK',    'es freeze.');
INSERT INTO lineitem VALUES (34, 3, 3,3, 6.00,  5550.36,  0.02, 0.06, 'N', 'O', '1998-10-30', '1998-09-27', '1998-11-05', 'NONE',              'FOB',      'ithely final dep');
INSERT INTO lineitem VALUES (35, 5, 5,1, 24.00, 25356.96, 0.02, 0.00, 'N', 'O', '1995-11-10', '1996-01-01', '1995-12-07', 'COLLECT COD',       'MAIL',     'regular theodolites');
INSERT INTO lineitem VALUES (36, 8, 3,1, 32.00, 30022.40, 0.07, 0.05, 'N', 'O', '1996-02-03', '1996-03-07', '1996-02-20', 'TAKE BACK RETURN',  'MAIL',     'otes. slyly final');
INSERT INTO lineitem VALUES (37, 1, 6,1, 40.00, 38662.80, 0.09, 0.03, 'A', 'F', '1992-07-21', '1992-08-01', '1992-08-15', 'NONE',              'REG AIR',  'oost furiously.');
INSERT INTO lineitem VALUES (37, 9, 4,2, 19.00, 17853.39, 0.06, 0.04, 'A', 'F', '1992-06-30', '1992-07-23', '1992-07-12', 'TAKE BACK RETURN',  'FOB',      'xes. slyly special');
INSERT INTO lineitem VALUES (38, 4, 9,1, 44.00, 42661.76, 0.04, 0.02, 'N', 'O', '1996-09-29', '1996-11-17', '1996-09-30', 'COLLECT COD',       'MAIL',     'jole. packages haggle');
INSERT INTO lineitem VALUES (39, 2, 2,1, 44.00, 42273.04, 0.09, 0.06, 'N', 'O', '1996-11-14', '1996-12-02', '1996-11-22', 'TAKE BACK RETURN',  'FOB',      'to beans haggle');
INSERT INTO lineitem VALUES (39, 10,5,2, 26.00, 29561.66, 0.04, 0.03, 'N', 'O', '1996-11-04', '1996-10-20', '1996-11-20', 'NONE',              'FOB',      'enly along the regular');
INSERT INTO lineitem VALUES (64, 2, 7,1, 21.00, 21756.66, 0.10, 0.02, 'R', 'F', '1994-09-30', '1994-09-18', '1994-10-26', 'DELIVER IN PERSON', 'REG AIR',  'slyly ironic instructions');
INSERT INTO lineitem VALUES (65, 5, 5,1, 26.00, 27455.06, 0.03, 0.03, 'A', 'F', '1995-04-20', '1995-04-25', '1995-05-13', 'NONE',              'TRUCK',    'ep-- Loss adjustments');
INSERT INTO lineitem VALUES (65, 7, 2,2, 32.00, 31905.92, 0.02, 0.01, 'R', 'F', '1995-05-05', '1995-04-20', '1995-05-12', 'NONE',              'FOB',      'xxxx pending dep');
INSERT INTO lineitem VALUES (66, 9, 9,1, 31.00, 30039.90, 0.00, 0.08, 'R', 'F', '1994-02-19', '1994-03-11', '1994-02-22', 'TAKE BACK RETURN',  'TRUCK',    'carefully bold');
INSERT INTO lineitem VALUES (67, 1, 6,1, 4.00,  4308.16,  0.09, 0.04, 'N', 'O', '1997-01-14', '1997-01-25', '1997-02-11', 'NONE',              'RAIL',     'regular theodolites');
INSERT INTO lineitem VALUES (67, 3, 3,2, 12.00, 12093.72, 0.09, 0.05, 'N', 'O', '1997-01-19', '1997-01-06', '1997-02-17', 'NONE',              'MAIL',     'xpress pinto beans');
INSERT INTO lineitem VALUES (68, 6, 1,1, 3.00,  3044.85,  0.05, 0.02, 'N', 'O', '1998-07-04', '1998-06-05', '1998-07-21', 'NONE',              'REG AIR',  'final requests detect');
INSERT INTO lineitem VALUES (68, 8, 8,2, 46.00, 48131.92, 0.02, 0.05, 'N', 'O', '1998-06-26', '1998-06-07', '1998-07-05', 'NONE',              'MAIL',     'theodolites. fluffily');
