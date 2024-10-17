create schema football_club;
set search_path = 'football_club';
CREATE TABLE IF NOT EXISTS club
(
    club_id INTEGER PRIMARY KEY,
    club_nm CHARACTER VARYING(100) NOT NULL,
    manager CHARACTER VARYING(100) NOT NULL,
    founded INTEGER                NOT NULL,
    stadium CHARACTER VARYING(100) NOT NULL,
    region  CHARACTER VARYING(100) NOT NULL,
    league  CHARACTER VARYING(100) NOT NULL,
    rank    INTEGER                NOT NULL
);

CREATE TABLE coach
(
    coach_id    INTEGER PRIMARY KEY,
    coach_nm    VARCHAR(100) NOT NULL,
    club_id     INTEGER,
    age         INTEGER      NOT NULL,
    nationality VARCHAR(100) NOT NULL,

    FOREIGN KEY (club_id) REFERENCES club (club_id)
);

CREATE TABLE player
(
    player_id   INTEGER PRIMARY KEY,
    player_nom  INTEGER      NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    player_nm   VARCHAR(100) NOT NULL,
    club_id     INTEGER,
    age         INTEGER      NOT NULL,
    position    VARCHAR(100) NOT NULL,
    price       NUMERIC      NOT NULL,

    FOREIGN KEY (club_id) REFERENCES club (club_id)
);

CREATE TABLE training
(
    train_id         INTEGER PRIMARY KEY,
    type_of_training VARCHAR(100) NOT NULL,
    date_of_training DATE         NOT NULL,
    coach_id         INTEGER,
    player_id        INTEGER,

    FOREIGN KEY (coach_id) REFERENCES coach (coach_id),
    FOREIGN KEY (player_id) REFERENCES player (player_id)
);

CREATE TABLE competition
(
    competition_id  INTEGER PRIMARY KEY,
    competition_nm  VARCHAR(100) NOT NULL,
    organising_body VARCHAR(100) NOT NULL,
    founded         INTEGER      NOT NULL,
    number_of_team  INTEGER      NOT NULL,
    region          VARCHAR(100) NOT NULL
);

CREATE TABLE honours
(
    honours_id     INTEGER PRIMARY KEY,
    club_id        INTEGER,
    competition_id INTEGER,
    year           INTEGER NOT NULL,

    FOREIGN KEY (club_id) REFERENCES club (club_id),
    FOREIGN KEY (competition_id) REFERENCES competition (competition_id)
);

CREATE TABLE matchday
(
    matchday_id    INTEGER PRIMARY KEY,
    competition_id INTEGER,
    round          VARCHAR(100) NOT NULL,
    date           DATE         NOT NULL,
    home_club_id   INTEGER,
    away_club_id   INTEGER,
    result         VARCHAR(100) NOT NULL,

    FOREIGN KEY (competition_id) REFERENCES competition (competition_id),
    FOREIGN KEY (home_club_id) REFERENCES club (club_id),
    FOREIGN KEY (away_club_id) REFERENCES club (club_id)
);

CREATE TABLE goal
(
    goal_id          INTEGER PRIMARY KEY,
    match_id         INTEGER,
    player_id        INTEGER,
    club_id          INTEGER,
    assist_player_id INTEGER,

    FOREIGN KEY (match_id) REFERENCES matchday (matchday_id),
    FOREIGN KEY (player_id) REFERENCES player (player_id),
    FOREIGN KEY (club_id) REFERENCES club (club_id),
    FOREIGN KEY (assist_player_id) REFERENCES player (player_id)
);

CREATE TABLE partner
(
    partner_id INTEGER PRIMARY KEY,
    company_nm VARCHAR(100) NOT NULL
);

CREATE TABLE contract
(
    contract_id  INTEGER PRIMARY KEY,
    partner_id   INTEGER,
    club_id      INTEGER,
    valid_from   DATE NOT NULL,
    valid_to     DATE NOT NULL,
    contract_sum INTEGER NULL,

    FOREIGN KEY (partner_id) REFERENCES partner (partner_id),
    FOREIGN KEY (club_id) REFERENCES club (club_id)
);