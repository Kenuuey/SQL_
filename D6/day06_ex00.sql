DROP TABLE IF EXISTS person_discounts;

CREATE TABLE person_discounts (
	id SERIAL PRIMARY KEY,
	person_id INT NOT NULL,
	pizzeria_id INT NOT NULL,
	discount NUMERIC NOT NULL,
	CONSTRAINT fk_per5son_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
	CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);

select * from person_discounts