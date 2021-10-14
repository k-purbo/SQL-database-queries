ALTER TABLE orders 
DROP CONSTRAINT fk_orders;

ALTER TABLE orders
ADD CONSTRAINT fk_orders FOREIGN KEY (o_custkey) REFERENCES customer
ON DELETE CASCADE;

ALTER TABLE lineitem
DROP CONSTRAINT fk_line_orders;

ALTER TABLE lineitem
ADD CONSTRAINT fk_line_orders FOREIGN KEY (l_orderkey) REFERENCES orders
ON DELETE CASCADE;