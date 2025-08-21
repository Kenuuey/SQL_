-- 1 Session --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 2 Session --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;

-- 2 Session --
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;
COMMIT;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;

-- 2 Session --
SELECT sum(rating) FROM pizzeria;