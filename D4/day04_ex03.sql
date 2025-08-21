select generated_date as missing_date
from v_generated_dates v
left join person_visits pv on v.generated_date = pv.visit_date
where pv.visit_date is null
order by 1;