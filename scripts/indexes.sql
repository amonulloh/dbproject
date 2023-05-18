set search_path = 'football_club';

-- 1) Создание индексов:

-- Индекс на поле club_nm таблицы club, так как оно будет использоваться в поиске и сортировке по названию клуба
CREATE INDEX idx_club_nm ON club (club_nm);

-- Индекс на поле player_id таблицы goal, так как это внешний ключ и поиск по этому полю будет осуществляться часто
CREATE INDEX idx_goal_player_id ON goal (player_id);

-- Индекс на поле valid_to таблицы contract, так как это поле будет использоваться в частых запросах на выборку контрактов, действующих на определенную дату
CREATE INDEX idx_contract_valid_to ON contract (valid_to);