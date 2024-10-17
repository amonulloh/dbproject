-- Функция: get_club_info(club_id INTEGER)
-- Описание: Эта функция возвращает информацию о конкретном клубе по его ID.
-- Возвращается название клуба, город/регион, стадион, тренер и текущее место в лиге.

CREATE OR REPLACE FUNCTION get_club_info(club INTEGER)
RETURNS TABLE (
    club_nm CHARACTER VARYING(100),
    region CHARACTER VARYING(100),
    stadium CHARACTER VARYING(100),
    manager CHARACTER VARYING(100),
    rank INTEGER
) AS $$
BEGIN
  RETURN QUERY SELECT c.club_nm, c.region, c.stadium, co.coach_nm, c.rank
               FROM football_club.club c
               LEFT JOIN football_club.coach co ON c.club_id = co.club_id
               WHERE c.club_id = club;
END;
$$ LANGUAGE plpgsql;

select *
from get_club_info(1);

-- Функция: get_competition_info(competition_id INTEGER)
-- Описание: Эта функция возвращает информацию о конкретном турнире по его ID.
-- Возвращается название турнира, страна/континент, количество команд и основное организующее тело.

CREATE OR REPLACE FUNCTION get_competition_info(competition INTEGER)
RETURNS TABLE (
    competition_nm VARCHAR(100),
    region VARCHAR(100),
    number_of_team INTEGER,
    organising_body VARCHAR(100)
) AS $$
BEGIN
  RETURN QUERY SELECT c.competition_nm, c.region, c.number_of_team, c.organising_body
               FROM competition c
               WHERE c.competition_id = competition;
END;
$$ LANGUAGE plpgsql;

-- Функция: get_total_transfer_fees(club_id INTEGER)
-- Описание: Эта функция возвращает сумму денег, заплаченных клубом за подпись всех его игроков.

CREATE OR REPLACE FUNCTION get_total_transfer_fees(club INTEGER)
RETURNS NUMERIC AS $$
BEGIN
  RETURN COALESCE((SELECT SUM(c.contract_sum)
                   FROM contract c
                   WHERE c.club_id = club), 0);
END;
$$ LANGUAGE plpgsql;
