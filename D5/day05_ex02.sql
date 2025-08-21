SET ENABLE_SEQSCAN TO ON;
EXPLAIN ANALYZE
select * from person p where upper(p.name) = 'ANDREY';

SET ENABLE_SEQSCAN TO OFF;
DROP INDEX IF EXISTS idx_person_name;
CREATE INDEX idx_person_name ON person (UPPER(name));
EXPLAIN ANALYZE
select * from person p where upper(p.name) = 'ANDREY';