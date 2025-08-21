create or replace function fnc_fibonacci(pstop int = 10)
returns table (fib INT) as $$
with recursive r(a, b) as (
	select 0, 1
	union all
	select b, a + b
	from r
	where b < pstop
)
select a from r;
$$ language SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();