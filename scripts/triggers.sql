set search_path = 'football_club';

-- Триггер для автоматического обновления даты изменения записи:
CREATE OR REPLACE FUNCTION update_modified_date()
RETURNS TRIGGER AS $$
BEGIN
  NEW.modified_date = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_modified_date
BEFORE INSERT OR UPDATE ON goal
FOR EACH ROW
EXECUTE FUNCTION update_modified_date();

SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public';


-- Триггер для логирования изменений записей в таблице:
CREATE OR REPLACE FUNCTION log_changes()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'INSERT') THEN
    INSERT INTO club (id, column_name, old_value, new_value, changed_at)
    VALUES (NEW.id, 'column_name', NULL, NEW.column_name, NOW());
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO club (id, column_name, old_value, new_value, changed_at)
    VALUES (NEW.id, 'column_name', OLD.column_name, NEW.column_name, NOW());
  ELSIF (TG_OP = 'DELETE') THEN
    INSERT INTO club(id, column_name, old_value, new_value, changed_at)
    VALUES (OLD.id, 'column_name', OLD.column_name, NULL, NOW());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_table_name_changes
AFTER INSERT OR UPDATE OR DELETE ON club
FOR EACH ROW
EXECUTE FUNCTION log_changes();

SELECT tgname, tgrelid::regclass, tgdeferrable, tginitdeferred, tgnargs, tgargs, tgtype
FROM pg_trigger
WHERE tgrelid::regclass::text LIKE '%table_name%';

