SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE
select m.pizza_name, pz.name as pizzeria_name
from menu m join pizzeria pz on pz.id = m.pizzeria_id;

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
select m.pizza_name, pz.name
from menu m join pizzeria pz on pz.id = m.pizzeria_id;