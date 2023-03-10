CREATE TABLE IF NOT EXISTS department(
	id SERIAL PRIMARY KEY,
	dep_name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	department_id INTEGER NOT NULL REFERENCES department(id),
	chef_id INTEGER REFERENCES employee(id)
);

