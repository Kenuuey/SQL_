delete from menu
where pizza_name = 'greek pizza' and pizzeria_id = 2;

insert into menu(id, pizzeria_id, pizza_name, price)
values (19, 2, 'greek pizza', 800);

select * from menu