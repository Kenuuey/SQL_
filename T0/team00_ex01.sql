with recursive tours_cost as (
    with all_point as (
    select distinct point1 
    from nodes 
    order by point1
    )
    select
        array[point1] as tour,
        0 as total_cost,
        1 as lvl,
        false as duplication
    from nodes n
    where point1 = 'a'
    union
    select 
        t.tour || a.point1 as tour,
        t.total_cost + n.cost as total_cost,
        t.lvl + 1 as lvl,
        a.point1 = any(t.tour) as duplication
    from tours_cost t
    left join all_point a on true
    join nodes n on n.point1 = t.tour[t.lvl] and n.point2 = a.point1 and not duplication
)
select total_cost, tour 
from tours_cost 
where tour[5] = 'a' 
    and (total_cost in (select min(total_cost) from tours_cost where tour[5] = 'a') 
    or total_cost in (select max(total_cost) from tours_cost where tour[5] = 'a'))
order by total_cost, tour