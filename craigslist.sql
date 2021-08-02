DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  state VARCHAR(2) NOT NULL,
  country TEXT NOT NULL,
);

--INSERT INTO locations --
--VALUES  ()

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY user_id REFERENCES users(id),
  FOREIGN KEY location_id REFERENCES locations(id),
  FOREIGN KEY category_id REFERENCES categories(id),
  title VARCHAR(50) NOT NULL,
  text_body VARCHAR(500) NOT NULL,
  contact_info TEXT
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  FOREIGN KEY location_id REFERENCES locations(id)
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

