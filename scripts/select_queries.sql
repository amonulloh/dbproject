set search_path = 'football_club';

-- 1. group by + having
-- вывести имена футболистов, которые забили больше гола в одном матче:
SELECT p.player_nm, g.match_id, COUNT(*) as goals
FROM football_club.player p
         JOIN football_club.goal g
              ON p.player_id = g.player_id
GROUP BY p.player_nm, g.match_id
HAVING count(*) > 1;

-- Вывести имена игроков, которые стоят больше 100 млн евро

SELECT player_id, player_nm, price
FROM football_club.player
WHERE price >= 100;

-- 2. order by
-- вывести список футболистов, отсортированных по игровому:
SELECT player_nom, player_nm, position
FROM player
WHERE club_id = 4
ORDER BY player_nom;


-- 3. <func>...over(...)
-- 3.1 partition by
-- вывести суммарное стоимость игроков каждого клуба
SELECT DISTINCT football_club.club.club_nm,
                sum(football_club.player.price) OVER (PARTITION BY football_club.player.club_id) AS total_price
FROM football_club.player
         JOIN football_club.club
              ON football_club.player.club_id = football_club.club.club_id;

-- 3. <func>...over(...)
-- 3.2 - 3.3 partition ny + order by
SELECT DISTINCT c.club_id,
                c.club_nm,
                sum(p.price) OVER (PARTITION BY p.club_id) AS total_price
FROM player AS p
         JOIN club AS c
              ON p.club_id = c.club_id
ORDER BY total_price;
