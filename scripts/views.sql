set search_path = 'football_club';

-- I) Сводная таблица игроков с их командами и тренерами
CREATE VIEW player_info AS
SELECT player.player_id,
       player.player_nom,
       player.nationality,
       player.player_nm,
       player.age,
       player.position,
       player.price,
       club.club_nm,
       coach.coach_nm
FROM player
         JOIN club ON club.club_id = player.club_id
         JOIN coach ON coach.club_id = player.club_id;

-- Результат:
SELECT *
FROM player_info;

-- II) Сводная таблица с информацией о тренировках игроков и тренеров
CREATE VIEW training_info AS
SELECT training.train_id,
       training.type_of_training,
       training.date_of_training,
       player.player_nm AS player_name,
       coach.coach_nm   AS coach_name
FROM training
         LEFT JOIN player ON player.player_id = training.player_id
         LEFT JOIN coach ON coach.coach_id = training.coach_id;

-- Результат:
SELECT *
FROM training_info;

-- III) Сводная таблица с информацией о выигранных клубами турнирах
CREATE VIEW club_honours AS
SELECT club.club_nm, competition.competition_nm, honours.year
FROM club
         JOIN honours ON honours.club_id = club.club_id
         JOIN competition ON honours.competition_id = competition.competition_id;

-- Результат:
SELECT *
FROM club_honours;

-- IV) Сводная таблица с информацией о количестве забитых голов и их авторах в каждом матче
CREATE VIEW goal_stats AS
SELECT g.match_id,
       p.player_nm,
       c1.club_nm AS player_club,
       c2.club_nm AS scored_against,
       COUNT(*)   AS goals_scored,
       m.result
FROM goal g
         JOIN player p ON g.player_id = p.player_id
         JOIN club c1 ON p.club_id = c1.club_id
         JOIN matchday m ON g.match_id = m.matchday_id
         JOIN club c2 ON CASE
                             WHEN p.club_id = m.home_club_id THEN c2.club_id = m.away_club_id
                             ELSE c2.club_id = m.home_club_id END
GROUP BY g.match_id, p.player_nm, c1.club_nm, c2.club_nm, m.result;


-- Результат:
SELECT *
FROM goal_stats;

-- V) Сводная таблица с информацией о контрактах, которые заключены клубом с партнером
CREATE VIEW club_partner_contracts AS
SELECT club.club_nm, partner.company_nm, contract.valid_from, contract.valid_to, contract.contract_sum
FROM contract
         JOIN club ON contract.club_id = club.club_id
         JOIN partner ON contract.partner_id = partner.partner_id;

-- Результат:
SELECT *
FROM club_partner_contracts;

-- VI) Сводная таблица с информацией о количестве тренировок, которые провел каждый тренер
CREATE VIEW coach_training_count AS
SELECT coach.coach_id, coach.coach_nm, COUNT(*) AS training_count
FROM training
         JOIN coach ON training.coach_id = coach.coach_id
GROUP BY coach.coach_id, coach.coach_nm;

-- Результат:
SELECT *
FROM coach_training_count;