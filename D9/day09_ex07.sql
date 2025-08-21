create or replace function func_minimum(VARIADIC arr NUMERIC[])
returns NUMERIC as $$
	select min(val)
	from unnest(arr) as val;
$$ language SQL;

select func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);