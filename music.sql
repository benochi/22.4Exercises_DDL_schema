-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL
  FOREIGN KEY (song_id) REFERENCES albums_songs(id)
);
INSERT INTO albums
  (title)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY, 
  artists TEXT NOT NULL
);
INSERT INTO artists
  (title)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child'),
  ('Alicia Keys');

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY, 
  producers TEXT NOT NULL
);
INSERT INTO producers
  (title)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums_songs(id),
  FOREIGN KEY (artist_id) REFERENCES artists_songs(id),
  FOREIGN KEY (producer_id) REFERENCES producers_songs(id)
);

INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
  ('MMMBop', 238, '04-15-1997'),
  ('Bohemian Rhapsody', 355, '10-31-1975'),
  ('One Sweet Day', 282, '11-14-1995'),
  ('Shallow', 216, '09-27-2018'),
  ('How You Remind Me', 223, '08-21-2001'),
  ('New York State of Mind', 276, '10-20-2009'),
  ('Dark Horse', 215, '12-17-2013'),
  ('Moves Like Jagger', 201, '06-21-2011'),
  ('Complicated', 244, '05-14-2002'),
  ('Say My Name', 240, '11-07-1999');
CREATE TABLE artists_songs
  (
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (song_id) REFERENCES song(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id)
  );

CREATE TABLE producers_songs
  (
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (song_id) REFERENCES song(id),
  FOREIGN KEY (producer_id) REFERENCES producers(id)
  );

CREATE TABLE albums_songs
  (
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (song_id) REFERENCES song(id),
  FOREIGN KEY (album_id) REFERENCES albums(id)
  );