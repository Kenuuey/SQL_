-- 1 Session
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;

-- 2 Session
select * from pizzeria where name = 'Pizza Hut';

-- 1 Session
commit;

-- 2 Session
select * from pizzeria where name = 'Pizza Hut';