SET enable_seqscan TO ON;
EXPLAIN ANALYZE
select * from menu
WHERE pizzeria_id = 5 and pizza_name = 'cheese pizza';

SET enable_seqscan TO OFF;
DROP INDEX IF EXISTS idx_menu_unique;
CREATE INDEX idx_menu_unique  ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYZE
select * from menu
WHERE pizzeria_id = 5 and pizza_name = 'cheese pizza';