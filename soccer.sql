DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (player_id) REFERENCES players(id),
  FOREIGN KEY (match_id) REFERENCES matches(id),
  FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (match_id) REFERENCES matches(id),
  FOREIGN KEY (team_id) REFERENCES teams(id),
  result VARCHAR(1) NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (match_id) REFERENCES matches(id),
  FOREIGN KEY (team_id) REFERENCES teams(id),
  name TEXT NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (home_team_id) REFERENCES teams(id),
  FOREIGN KEY (away_team_id) REFERENCES teams(id),
  location VARCHAR(50),
  game_date_time TIMESTAMP,
  FOREIGN KEY (head_referee_id) REFERENCES referees(id),
  FOREIGN KEY (alternate_referee_id) REFERENCES referees(id),
  FOREIGN KEY (season_id) REFERENCES seasonss(id),
  FOREIGN KEY (home_coach_id) REFERENCES coaches(id),
  FOREIGN KEY (away_coach_id) REFERENCES coaches(id),
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  start_date DATE,
  qualifier? BOOLEAN
);

CREATE TABLE lineups
(
  id SERIAL PRIMARY KEY,
  FOREIGN KEY (player_id) REFERENCES players(id),
  FOREIGN KEY (match_id) REFERENCES matches(id),
  FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE coaches
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  FOREIGN KEY team_id REFERENCES teams(id)
);
