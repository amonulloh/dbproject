# Физическая модель

---

Таблица `football club`:

| Название   | Описание             | Тип данных     | Ограничение   |
|------------|----------------------|----------------|---------------|
| `club_id`  | Идентификатор клуба  | `INTEGER`      | `PRIMARY KEY` |
| `club_nm`  | Название клуба       | `VARCHAR(100)` | `NOT NULL`    |
| `manager`  | Имя тренера          | `VARCHAR(100)` | `NOT NULL`    |
| `founded`  | Год основания        | `INTEGER`      | `NOT NULL`    |
| `stadium`  | Название стадиона    | `VARCHAR(100)` | `NOT NULL`    |
| `region`   | Регион клуба         | `VARCHAR(100)` | `NOT NULL`    |
| `league`   | Название лиги клуба  | `VARCHAR(100)` | `NOT NULL`    |
| `rank`     | Рейтинг клуба (FIFA) | `INTEGER`      | `NOT NULL`    |

Таблица `coach`:

| Название      | Описание               | Тип данных     | Ограничение   |
|---------------|------------------------|----------------|---------------|
| `coach_id`    | Идентификатор тренера  | `INTEGER`      | `PRIMARY KEY` |
| `coach_nm`    | Имя тренера            | `VARCHAR(100)` | `NOT NULL`    |
| `club_id`     | Клуб тренера           | `INTEGER`      | `FOREIGN KEY` |
| `age`         | Возрасть тренера       | `INTEGER`      | `NOT NULL`    |
| `nationality` | Национальность тренера | `VARCHAR(100)` | `NOT NULL`    |

Таблица `player`:

| Название      | Описание                     | Тип данных     | Ограничение   |
|---------------|------------------------------|----------------|---------------|
| `player_id`   | Идентификатор игрока         | `INTEGER`      | `PRIMARY KEY` |
| `player_nom`  | Выступающий номер игрока     | `INTEGER`      | `NOT NULL`    |
| `nationality` | Национальность игрока        | `VARCHAR(100)` | `NOT NULL`    |
| `player_nm`   | Имя игрока                   | `VARCHAR(100)` | `NOT NULL`    |
| `club_id`     | Клуб игрока                  | `INTEGER`      | `FOREIGN KEY` |
| `age`         | Возраст игрока               | `INTEGER`      | `NOT NULL`    |
| `position`    | Играбщая позиция игрока      | `VARCHAR(100)` | `NOT NULL`    |
| `price`       | Цена игрока (transfermarket) | `NUMERIC`      | `NOT NULL`    |

Таблица `training`:

| Название           | Описание                 | Тип данных     | Ограничение   |
|--------------------|--------------------------|----------------|---------------|
| `train_id`         | Идентификатор тренировки | `INTEGER`      | `PRIMARY KEY` |
| `type_of_training` | Тип тренировки           | `VARCHAR(100)` | `NOT NULL`    |
| `date_of_training` | Дата тренировки          | `DATE`         | `NOT NULL`    |
| `coach_id`         | Индентификатор тренера   | `INTEGER`      | `FOREIGN KEY` |
| `player_id`        | Индентификатор игрока    | `INTEGER`      | `FOREIGN KEY` |

Таблица `competition`:

| Название          | Описание                       | Тип данных     | Ограничение   |
|-------------------|--------------------------------|----------------|---------------|
| `competition_id`  | Идентификатор турнира          | `INTEGER`      | `PRIMARY KEY` |
| `competition_nm`  | Название турнира               | `VARCHAR(100)` | `NOT NULL`    |
| `organising_body` | Название организующих лиц      | `VARCHAR(100)` | `NOT NULL`    |
| `founded`         | Год основания турнира          | `INTEGER`      | `NOT NULL`    |
| `number_of_team`  | Количество клубов (участников) | `INTEGER`      | `NOT NULL`    |
| `region`          | Регион проведения турнира      | `VARCHAR(100)` | `NOT NULL`    |

Таблица `honours`:

| Название         | Описание                 | Тип данных     | Ограничение   |
|------------------|--------------------------|----------------|---------------|
| `honours_id`     | Идентификатор достежения | `INTEGER`      | `PRIMARY KEY` |
| `competition_id` | Идентификатор турнира    | `INTEGER`      | `NOT NULL`    |
| `type`           | Тип турнира              | `VARCHAR(100)` | `FOREIGN KEY` |
| `club_id`        | Идентификатор клуба      | `INTEGER`      | `FOREIGN KEY` |

Таблица `matchday`:

| Название         | Описание                       | Тип данных     | Ограничение   |
|------------------|--------------------------------|----------------|---------------|
| `matchday_id`    | Идентификатор матча            | `INTEGER`      | `PRIMARY KEY` |
| `competition_id` | Идентификатор турнира          | `INTEGER`      | `FOREIGN KEY` |
| `round`          | Раунд матча                    | `VARCHAR(100)` | `NOT NULL`    |
| `data`           | Дата матча                     | `DATA`         | `NOT NULL`    |
| `home_club_id`   | Идентификатор клуба (дома)     | `INTEGER`      | `FOREIGN KEY` |
| `away_club_id`   | Идентификатор клуба (в гоятях) | `INTEGER`      | `FOREIGN KEY` |
| `result`         | Результат матча                | `VARCHAR(100)` | `NOT NULL`    |

Таблица `goals`:

| Название           | Описание                 | Тип данных | Ограничение   |
|--------------------|--------------------------|------------|---------------|
| `goal_id`          | Идентификатор гола       | `INTEGER`  | `PRIMARY KEY` |
| `match_id`         | Идентификатор матча      | `INTEGER`  | `FOREIGN KEY` |
| `player_id`        | Идентификатор автор гола | `INTEGER`  | `FOREIGN KEY` |
| `club_id`          | Идентификатор клуба      | `INTEGER`  | `FOREIGN KEY` |
| `assist_player_id` | Идентификатор ассистента | `INTEGER`  | `FOREIGN KEY` |

Таблица `partner`:

| Название     | Описание                        | Тип данных     | Ограничение   |
|--------------|---------------------------------|----------------|---------------|
| `partner_id` | Идентификатор партнёра/спонсора | `INTEGER`      | `PRIMARY KEY` |
| `company_nm` | Название компании               | `VARCHAR(100)` | `NOT NULL`    |


Таблица `contract`:

| Название       | Описание                        | Тип данных | Ограничение   |
|----------------|---------------------------------|------------|---------------|
| `contract_id`  | Идентификатор контракта         | `INTEGER`  | `PRIMARY KEY` |
| `partner_id`   | Идентификатор партнёра/спонсора | `INTEGER`  | `FOREIGN KEY` |
| `club_id`      | Идентификатор клуба             | `INTEGER`  | `FOREIGN KEY` |
| `valid_from`   | Действует с (дата)              | `DATA`     | `NOT NULL`    |
| `valid_to`     | Действует до (дата)             | `DATA`     | `NOT NULL`    |
| `contract_sum` | Сумма контракта                 | `DATA`     | `NOT NULL`    |


---
Таблица `footbal club`:
```postgresql
CREATE TABLE cd.footbal_club(
   club_id   INTEGER                PRIMARY KEY
   club_nm   CHARACTER VARYING(100) NOT NULL
   manager   CHARACTER VARYING(100) NOT NULL
   founded   INTEGER                NOT NULL
   stadium   CHARACTER VARYING(100) NOT NULL
   region    CHARACTER VARYING(100) NOT NULL
   league    CHARACTER VARYING(100) NOT NULL
   rank      INTEGER                NOT NULL
);
```

Таблица `coach`:
```postgresql
CREATE TABLE coach (
  coach_id    INTEGER      PRIMARY KEY,
  coach_nm    VARCHAR(100) NOT NULL,
  club_id     INTEGER,
  age         INTEGER      NOT NULL,
  nationality VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (club_id) REFERENCES football_club(club_id)
);

```
Таблица `player`:
```postgresql
CREATE TABLE player (
  player_id   INTEGER      PRIMARY KEY,
  player_nom  INTEGER      NOT NULL,
  nationality VARCHAR(100) NOT NULL,
  player_nm   VARCHAR(100) NOT NULL,
  club_id     INTEGER,
  age         INTEGER      NOT NULL,
  position    VARCHAR(100) NOT NULL,
  price       NUMERIC      NOT NULL,
  
  FOREIGN KEY (club_id) REFERENCES football_club (club_id)
);
```

Таблица `training`:
```postgresql
CREATE TABLE training (
  train_id         INTEGER      PRIMARY KEY,
  type_of_training VARCHAR(100) NOT NULL,
  date_of_training DATE         NOT NULL,
  coach_id         INTEGER,
  player_id        INTEGER,
  
  FOREIGN KEY (coach_id) REFERENCES coach (coach_id),
  FOREIGN KEY (player_id) REFERENCES player (player_id)
);

```
Таблица `competition`:
```postgresql
CREATE TABLE competition (
  competition_id  INTEGER      PRIMARY KEY,
  competition_nm  VARCHAR(100) NOT NULL,
  organising_body VARCHAR(100) NOT NULL,
  founded         INTEGER      NOT NULL,
  number_of_team  INTEGER      NOT NULL,
  region          VARCHAR(100) NOT NULL
);
```

Таблица `honours`:
```postgresql
CREATE TABLE honours (
  honours_id     INTEGER      PRIMARY KEY,
  club_id        INTEGER,
  competition_id INTEGER,
  year           INTEGER      NOT NULL,
  honours_type   VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (club_id) REFERENCES football_club (club_id),
  FOREIGN KEY (competition_id) REFERENCES competition (competition_id)
);
```

Таблица `matchday`:
```postgresql
CREATE TABLE matchday (
  matchday_id    INTEGER      PRIMARY KEY,
  competition_id INTEGER,
  round          VARCHAR(100) NOT NULL,
  date           DATE         NOT NULL,
  home_club_id   INTEGER,
  away_club_id   INTEGER,
  result         VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (competition_id) REFERENCES competiton (competition_id),
  FOREIGN KEY (home_club_id) REFERENCES football_club (club_id),
  FOREIGN KEY (away_club_id) REFERENCES football_club (club_id)
);
```

Таблица `goals`:
```postgresql
CREATE TABLE goals (
  goal_id          INTEGER PRIMARY KEY,
  match_id         INTEGER,
  player_id        INTEGER,
  club_id          INTEGER,
  assist_player_id INTEGER,
  
  FOREIGN KEY (match_id) REFERENCES matchday (matchday_id),
  FOREIGN KEY (player_id) REFERENCES player (player_id),
  FOREIGN KEY (club_id) REFERENCES football_club (club_id),
  FOREIGN KEY (assist_player_id) REFERENCES player (player_id)
);
```

Таблица `partner`:
```postgresql
CREATE TABLE partner (
  partner_id INTEGER      PRIMARY KEY,
  company_nm VARCHAR(100) NOT NULL
);
```

Таблица `contract`:
```postgresql
CREATE TABLE contract (
  contract_id  INTEGER  PRIMARY KEY,
  partner_id   INTEGER,
  club_id      INTEGER,
  valid_from   DATE     NOT NULL,
  valid_to     DATE     NOT NULL,
  contract_sum DATE     NOT NULL,
  
  FOREIGN KEY (partner_id) REFERENCES partner (partner_id),
  FOREIGN KEY (club_id) REFERENCES football_club (club_id)
);
```