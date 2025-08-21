create or replace view v_generated_dates as
select generate_series::date as generated_date
from generate_series('2022-01-01'::date , '2022-01-31'::date, '1 day'::interval)
order by generated_date;

select * from v_generated_dates