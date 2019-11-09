DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  continent VARCHAR(255),
  visited NUMERIC,
  total_rate NUMERIC
);

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited NUMERIC,
  country_id INT8 REFERENCES countries(id),
  rate NUMERIC
);
