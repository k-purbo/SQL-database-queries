CREATE FUNCTION open_orders() RETURNS TRIGGER AS
$open_orders$
BEGIN
	IF ((SELECT COUNT(o_custkey)
		FROM orders
		WHERE (NEW.o_custkey = o_custkey) AND (o_orderstatus = 'O')) < 14) THEN
	RETURN NEW;
	END IF;
END;
$open_orders$ LANGUAGE plpgsql;

CREATE TRIGGER open_orders
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE PROCEDURE open_orders();