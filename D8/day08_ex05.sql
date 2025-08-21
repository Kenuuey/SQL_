-- 1 Session --
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 2 Session --
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;

-- 2 Session --
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5);
COMMIT;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;
COMMIT;

-- 1 Session --
SELECT sum(rating) FROM pizzeria;

-- 2 Session --
SELECT sum(rating) FROM pizzeria;