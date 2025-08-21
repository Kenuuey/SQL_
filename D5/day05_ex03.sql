SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE
select person_id, menu_id,order_date
from person_order
where person_id = 8 and menu_id = 19;

SET ENABLE_SEQSCAN TO OFF;
DROP INDEX IF EXISTS idx_person_order_multi;
CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);
EXPLAIN ANALYZE
select person_id, menu_id,order_date
from person_order
where person_id = 8 and menu_id = 19;