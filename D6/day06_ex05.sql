COMMENT ON TABLE person_discounts IS 
'This table stores the personal discount information for each 
person in relation to specific pizzerias based on their orders.';

COMMENT ON COLUMN person_discounts.id IS 
'Primary key, unique identifier for each record.';

COMMENT ON COLUMN person_discounts.person_id IS 
'Foreign key referencing the person table.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 
'Foreign key referencing the pizzeria table.';

COMMENT ON COLUMN person_discounts.discount IS 
'Discount percentage. The value ranges from 0 to 100.';

SELECT obj_description('person_discounts'::regclass);
SELECT a.attname AS column_name, d.description AS column_comment
FROM pg_attribute a
JOIN pg_class c ON a.attrelid = c.oid
LEFT JOIN pg_description d ON c.oid = d.objoid AND a.attnum = d.objsubid
WHERE c.relname = 'person_discounts' AND d.description IS NOT NULL;