DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

create or replace function fnc_persons(pgender VARCHAR DEFAULT 'female')
returns table (id bigint, name varchar, age integer, gender varchar, address varchar) AS
$$ 
	select * from person where gender = pgender;
$$
language SQL;

select * from fnc_persons(pgender := 'male');
select * from fnc_persons();