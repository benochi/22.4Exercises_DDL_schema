-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic



CREATE TABLE passenger 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passenger
  (first_name, last_name)
VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley'),
    ('Jennifer', 'Finch'),
    ('Waneta', 'Skeleton'),
    ('Berkie', 'Wycliff'),
    ('Alvin', 'Leathes');

--CREATE INDEX passenger_index
--ON passenger (first_name, last_name);
CREATE TABLE airline 
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

INSERT INTO airline
  (airline)
VALUES
  ('Southwest'),
  ('Delta'),
  ('United'),
  ('Frontier'), 
  ('British Airways'), 
  ('TUI Fly Belgium'), 
  ('Air China'), 
  ('Avianca Brasil'), 
  ('American Airlines')

CREATE TABLE departure
(
  id SERIAL PRIMARY KEY,
  flight_time TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  seat TEXT NOT NULL,
  FOREIGN KEY (passenger_id) REFERENCES passengers(id),
  FOREIGN KEY (airline_id) REFERENCES airline(id)
);
INSERT INTO departure
  (seat, flight_time, from_city, from_country, passenger_id, airline_id)
VALUES 
  ('33B', '2018-04-08 09:00:00','Washington DC', 'United States'),
  ('8A','2018-12-19 12:45:00', 'Tokyo', 'Japan'),
  ('12F', '2018-01-02 07:00:00','Los Angeles', 'United States'),
  ('20A', '2018-04-15 16:50:00', 'Seattle', 'United States'),
  ('23D', '2018-08-01 18:30:00', 'Paris', 'France'),
  ('18C', '2018-10-31 01:15:00', 'Dubai', 'UAE'),
  ('9E', '2019-02-06 06:00:00', 'New York', 'United States'),
  ('1A', '2018-12-22 14:42:00', 'Cedar Rapids', 'United States'),
  ('32B', '2019-02-06 16:28:00', 'Charlotte', 'United States'),
  ('10D', '2019-01-20 19:30:00','Sao Paolo', 'Brazil');

CREATE TABLE arrival 
(
  id SERIAL PRIMARY KEY,
  arrival TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  seat TEXT NOT NULL,
  FOREIGN KEY (passenger_id) REFERENCES passengers(id),
  FOREIGN KEY (airline_id) REFERENCES airline(id)
);
INSERT INTO arrival
  (seat, flight_time, to_city, to_country, passenger_id, airline_id)
VALUES (
  '33B','2018-04-08 12:00:00', 'Seattle', 'United States'),
  ('8A','2018-12-19 16:15:00', 'London', 'United Kingdom'),
  ('12F','2018-01-02 08:03:00', 'Las Vegas', 'United States'),
  ('20A','2018-04-15 21:00:00','Mexico City', 'Mexico'),
  ('23D','2018-08-01 21:50:00','Casablanca', 'Morocco'),
  ('18C','2018-10-31 12:55:00','Beijing', 'China'),
  ('9E','2019-02-06 07:47:00', 'Charlotte', 'United States'),
  ('1A','2018-12-22 15:56:00', 'Chicago', 'United States'),
  ('32B','2019-02-06 19:18:00','New Orleans', 'United States'),
  ('10D','2019-01-20 22:45:00', 'Santiago', 'Chile'
);
CREATE TABLE ticket
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (passenger_id) REFERENCES passengers(id),
  FOREIGN KEY (airline_id) REFERENCES airline(id),
  FOREIGN KEY (departure_id) REFERENCES departure(id),
  FOREIGN KEY (arrival_id) REFERENCES arrival(id)
);
--INSERT INTO tickets
  --(first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
--VALUES
  --('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  --('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  --('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  --('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  --('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  --('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  --('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  --('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  --('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  --('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');
