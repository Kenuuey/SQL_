-- initial price = 800
update menu 
set price = 800
where pizza_name = 'greek pizza';

-- -10% of initial price = 720
update menu
set price = price * 0.9
where pizza_name = 'greek pizza';

select * from menu
where pizza_name = 'greek pizza'
