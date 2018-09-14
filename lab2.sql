CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INT,
  population INT
);

INSERT INTO countries VALUES (default , 'Kazakhstan', 5, 999999);

SELECT * FROM countries;

UPDATE countries SET region_id = null;

INSERT INTO countries (country_id, country_name) VALUES (default, 'USA');
INSERT INTO countries (country_id, country_name, population) VALUES (default, 'UK', 999);
INSERT INTO countries VALUES (default, 'USA', 9, 99999);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (default, default, 11, 8888);

INSERT INTO countries VALUES (default, default, default , default );

CREATE TABLE countries_new(
  LIKE countries
);

SELECT * FROM countries_new;

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries_new SET population = population * 1.1 RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS cn USING countries AS c WHERE cn.country_id = c.country_id RETURNING *;

DELETE FROM countries RETURNING *;