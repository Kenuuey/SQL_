create or replace function fnc_trg_person_delete_audit()
returns trigger
language plpgsql as $$
begin
	insert into person_audit (created, type_event, row_id, name, age, gender, address)
	values (current_timestamp, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
	return null;
end;
$$;

create or replace trigger trg_person_delete_audit
after delete on person for each row
execute function fnc_trg_person_delete_audit();

delete from person where id = 10;

select * from person_audit;