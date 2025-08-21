-- 1 Session --
BEGIN;

-- 2 Session --
BEGIN;

-- 1 Session --
UPDATE pizzeria SET rating = 4.8 WHERE id = 1;

-- 2 Session --
UPDATE pizzeria SET rating = 4.4 WHERE id = 2;

-- 1 Session --
UPDATE pizzeria SET rating = 4.3 WHERE id = 2;

-- 2 Session --
UPDATE pizzeria SET rating = 4.7 WHERE id = 1;

-- 1 Session --
COMMIT;

-- 2 Session --
COMMIT;