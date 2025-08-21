create table nodes (
point1 varchar not null,
point2 varchar not null,
cost int not null
);

insert into nodes
values 
    ('a','b',10), 
    ('b','a',10),
    ('a','c',15),
    ('c','a',15),
    ('a','d',20), 
    ('d','a',20), 
    ('b','c',35), 
    ('c','b',35),
    ('b','d',25), 
    ('d','b',25),
    ('c','d',30), 
    ('d','c',30);

--select * from nodes

with recursive tours_cost as (
    with all_point as (
    select distinct point1 from nodes order by point1
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
where tour[5] = 'a' and total_cost in (select min(total_cost) from tours_cost where tour[5] = 'a')
order by total_cost, tour