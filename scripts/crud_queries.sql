-- добавляем нового клуба в таблицу club
INSERT INTO football_club.club (club_id, club_nm, manager, founded, stadium, region, league, rank)
VALUES (11, 'Интернационале', 'Симоне Индзаги', 1908, 'Сан-Сиро', 'Милан, Италия', 'Серия А', 10);

-- добавляем для этого клуба тренера
-- в таблицу coach
INSERT INTO football_club.coach(coach_id, coach_nm, club_id, age, nationality)
VALUES (11, 'Симоне Индзаги', 11, 47, 'Италия');

-- выводим все данные из таблицы club
SELECT *
FROM football_club.club;

--выводим все данные из таблицы coach
SELECT *
FROM football_club.coach;

-- меняем название клуба с id = 11
UPDATE football_club.club
SET club_nm = 'Интер'
WHERE club_id = 11;
select *
from football_club.club;

-- меняем тренера Барселона (под id = 1)
UPDATE football_club.club
SET manager = 'Хави Эранандес'
WHERE club_id = 1;

SELECT *
FROM football_club.club;

-- удаляем последние добавленные данные из обоих таблиц
DELETE
FROM football_club.coach
WHERE coach_id = 11;

DELETE
FROM football_club.club
WHERE club_id = 11;