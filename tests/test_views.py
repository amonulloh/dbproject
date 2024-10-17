import psycopg2

def test_player_info():
    conn = psycopg2.connect(database="football_club", user="username", password="password", host="localhost", port="5432")
    cur = conn.cursor()

    # Проверяем, что view содержит ожидаемое количество столбцов
    cur.execute("SELECT * FROM player_info LIMIT 1;")
    assert len(cur.fetchone()) == 8

    # Проверяем, что view содержит ожидаемое количество строк
    cur.execute("SELECT COUNT(*) FROM player_info;")
    assert cur.fetchone()[0] == 100 # Например, предполагаем, что в таблице 100 строк

    # Проверяем, что view возвращает ожидаемые значения
    cur.execute("SELECT club_nm, coach_nm FROM player_info WHERE player_id = 1;")
    assert cur.fetchone() == ('Manchester United', 'Ole Gunnar Solskjaer')

    conn.close()
