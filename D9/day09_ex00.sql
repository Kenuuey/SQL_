drop table if exists person_audit cascade;

create table person_audit (
	created 	TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
	type_event 	CHAR(1) DEFAULT 'I' NOT NULL,
	row_id		BIGINT NOT NULL,
	name 		VARCHAR,
	age 		INTEGER,
	gender 		VARCHAR,
	address 	VARCHAR,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

create or replace function fnc_trg_person_insert_audit()
returns trigger
language plpgsql as $$
begin
	insert into person_audit (created, type_event, row_id, name, age, gender, address)
	values (current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
	return null;
end;
$$;

create or replace trigger trg_person_insert_audit
after insert on person
for each row
execute function fnc_trg_person_insert_audit();

delete from person where name = 'Damir';
insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');

select * from person;
select * from person_audit;