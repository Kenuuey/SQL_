set enable_seqscan to off; 

drop index if exists idx_person_discounts_unique;
create unique index idx_person_discounts_unique 
on person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYZE
select * from person_discounts
where person_id = 4 and pizzeria_id = 5;