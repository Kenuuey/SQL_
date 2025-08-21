SET enable_seqscan TO ON;
EXPLAIN ANALYZE
select * from person_order
where order_date = '2022-01-01';

SET enable_seqscan TO OFF;
DROP INDEX IF EXISTS idx_person_order_order_date ;
CREATE UNIQUE INDEX idx_person_order_order_date
ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';
EXPLAIN ANALYZE
select * from person_order
where order_date = '2022-01-01';