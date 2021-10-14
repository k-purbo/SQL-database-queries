CREATE FUNCTION lineitem_status() RETURNS TRIGGER AS
$lineitem_status$
BEGIN

	IF (EXISTS (SELECT *
				FROM lineitem
				WHERE (l_orderkey = NEW.l_orderkey AND l_linestatus <> NEW.l_linestatus))) THEN

		UPDATE orders
		SET o_orderstatus = 'P'
		WHERE o_orderkey = NEW.l_orderkey;

	ELSE

		UPDATE orders
		SET o_orderstatus = NEW.l_linestatus
		WHERE o_orderkey = NEW.l_orderkey;

	END IF;
	
	RETURN NEW;

END;
$lineitem_status$ LANGUAGE plpgsql;

CREATE TRIGGER lineitem_status
AFTER INSERT ON lineitem
FOR EACH ROW
EXECUTE PROCEDURE lineitem_status();