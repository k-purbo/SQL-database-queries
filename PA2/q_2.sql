CREATE FUNCTION part_price() RETURNS TRIGGER AS 
$part_price$
BEGIN
	IF NEW.p_retailprice<>OLD.p_retailprice THEN
	UPDATE partsupp
	SET ps_supplycost = (ps_supplycost + (NEW.p_retailprice - OLD.p_retailprice))
	WHERE ps_partkey = OLD.p_partkey;
	END IF;

	RETURN NEW;
END;
$part_price$ LANGUAGE plpgsql;

CREATE TRIGGER part_price
BEFORE UPDATE ON part
FOR EACH ROW
EXECUTE PROCEDURE part_price();