ALTER TABLE customer
ADD CONSTRAINT fk_cust FOREIGN KEY (c_nationkey) REFERENCES nation;

ALTER TABLE lineitem
ADD CONSTRAINT fk_line_partsupp FOREIGN KEY (l_partkey, l_suppkey) REFERENCES partsupp;

ALTER TABLE lineitem
ADD CONSTRAINT fk_line_orders FOREIGN KEY (l_orderkey) REFERENCES orders;

ALTER TABLE nation
ADD CONSTRAINT fk_nation FOREIGN KEY (n_regionkey) REFERENCES region;

ALTER TABLE orders
ADD CONSTRAINT fk_orders FOREIGN KEY (o_custkey) REFERENCES customer;

ALTER TABLE partsupp
ADD CONSTRAINT fk_partsupp_supp FOREIGN KEY (ps_suppkey) REFERENCES supplier;

ALTER TABLE partsupp
ADD CONSTRAINT fk_partsupp_part FOREIGN KEY (ps_partkey) REFERENCES part;

ALTER TABLE supplier
ADD CONSTRAINT fk_supp FOREIGN KEY (s_nationkey) REFERENCES nation;