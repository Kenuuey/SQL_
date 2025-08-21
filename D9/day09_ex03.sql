DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();
TRUNCATE TABLE person_audit;

create or replace function fnc_trg_person_audit()
returns trigger
language plpgsql as $$
begin
	if (TG_OP = 'INSERT') then
		insert into person_audit
		values(current_timestamp, 'I', NEW.*);
	elseif (TG_OP = 'UPDATE') then
		insert into person_audit
		values (current_timestamp, 'U', OLD.*);
	elseif (TG_OP = 'DELETE') then
		insert into person_audit
		values (current_timestamp, 'D', OLD.*);
	end if;
	return null;
end;
$$;

create or replace trigger trg_person_audit
	after insert or update or delete on person 
	for each row
	execute function fnc_trg_person_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', '22', 'male', 'Irkutsk');

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;

delete from person where id = 10;

select * from person_audit;