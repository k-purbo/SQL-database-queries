CREATE FUNCTION nationkey_upd() RETURNS TRIGGER AS
$nationkey_upd$

DECLARE
	old_rkey INTEGER;
	new_rkey INTEGER;

BEGIN

	old_rkey := (SELECT n_regionkey
					FROM nation
					WHERE n_nationkey = OLD.s_nationkey);

	new_rkey := (SELECT n_regionkey
					FROM nation
					WHERE n_nationkey = NEW.s_nationkey);

	IF (old_rkey <> new_rkey) THEN
		IF (old_rkey = 1) THEN
			IF (new_rkey = 2) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 0.8
				WHERE ps_suppkey = OLD.s_suppkey;

												
			ELSIF (new_rkey = 3) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 1.05
				WHERE ps_suppkey = OLD.s_suppkey;

			END IF;

		ELSIF (old_rkey = 2) THEN
			IF (new_rkey = 1) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 1.2
				WHERE ps_suppkey = OLD.s_suppkey;	

			ELSIF (new_rkey = 3) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 1.1
				WHERE ps_suppkey = OLD.s_suppkey;									
			END IF;

		ELSIF (old_rkey = 3) THEN
			IF (new_rkey = 1) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 0.95
				WHERE ps_suppkey = OLD.s_suppkey;

			ELSIF (new_rkey = 2) THEN
				UPDATE partsupp
				SET ps_supplycost = ps_supplycost * 0.9
				WHERE ps_suppkey = OLD.s_suppkey;
			END IF;

		END IF;

	END IF;

RETURN NEW;
END;
$nationkey_upd$ LANGUAGE plpgsql;

CREATE TRIGGER nationkey_upd
AFTER UPDATE ON supplier
FOR EACH ROW
EXECUTE PROCEDURE nationkey_upd();