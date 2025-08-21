select 
    p.address,
    round(max(p.age) - (min(p.age) * 1.0 / max(p.age)), 2) as formula,
    round(avg(p.age), 2) as average,
    case 
        when (max(p.age) - (MIN(p.age) * 1.0 / max(p.age))) > avg(p.age) then 'true'
        else 'false'
    end as comparison
from person p
group by p.address
order by p.address;