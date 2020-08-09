--Create Base tables
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	amount NUMERIC(5,2),
	movie_id INTEGER
);
CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	rating VARCHAR(15),
	ticket_id INTEGER
);
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(150),
	ticket_id INTEGER NOT NULL,
	concession_id INTEGER
);
CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(100),
	amount NUMERIC(5,2),
	customer_id INTEGER
);


--add Foreign Keys
ALTER TABLE ticket
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);
--
ALTER TABLE movie
ADD FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id);
--
ALTER TABLE customer
ADD FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
ADD FOREIGN KEY(concession_id) REFERENCES concession(concession_id);
--
ALTER TABLE concession
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);


--Adding data
INSERT INTO movie(
	movie_id,
	title,
	rating,
	ticket_id
)
VALUES(
	1,
	'The Princess Bride',
	'PG',
	NULL
);
INSERT INTO movie(
	movie_id,
	title,
	rating,
	ticket_id
)
VALUES(
	2,
	'The Goonies',
	'PG',
	NULL
);
--
INSERT INTO ticket(
	ticket_id,
	amount,
	movie_id
)
VALUES(
	1,
	5,
	1
);

INSERT INTO ticket(
	ticket_id,
	amount,
	movie_id
)
VALUES(
	2,
	5,
	2
);
--

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	email,
	ticket_id
)
VALUES(
	1,
	'Leland',
	'Crawford',
	'nunya@business.com',
	1	
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	email,
	ticket_id
)
VALUES(
	2,
	'Finnegan',
	'Crawford',
	'littleguy@business.com',
	2	
);
--

INSERT INTO concession(
	concession_id,
	prod_name,
	amount,
	customer_id
)
VALUES(
	1,
	'Popcorn',
	5,
	1
);
--



INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	email,
	ticket_id
)
VALUES(
	2,
	'Finnegan',
	'Crawford',
	'littleguy@business.com',
	2	
);

--Updating
UPDATE movie
SET ticket_id = 1
WHERE movie_id = 1;

UPDATE customer
SET ticket_id = 1
WHERE customer_id = 1;

UPDATE customer
SET concession_id = 1
WHERE customer_id = 1;

UPDATE concession
SET customer_id = 1
WHERE concession_id = 1;
--

UPDATE movie
SET ticket_id = 2
WHERE movie_id = 2;

UPDATE customer
SET ticket_id = 2
WHERE customer_id = 2;



SELECT *
FROM customer;

SELECT *
FROM ticket;

SELECT *
FROM movie;

SELECT *
FROM concession;



