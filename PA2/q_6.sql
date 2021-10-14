ALTER TABLE nation
DROP CONSTRAINT fk_nation;

ALTER TABLE nation
ADD CONSTRAINT fk_nation FOREIGN KEY (n_regionkey) REFERENCES region
ON DELETE CASCADE;

ALTER TABLE customer
DROP CONSTRAINT fk_cust;

ALTER TABLE customer
ADD CONSTRAINT fk_cust FOREIGN KEY (c_nationkey) REFERENCES nation
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE supplier
DROP CONSTRAINT fk_supp;

ALTER TABLE supplier
ADD CONSTRAINT fk_supp FOREIGN KEY (s_nationkey) REFERENCES nation
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE partsupp
DROP CONSTRAINT fk_partsupp_supp;

ALTER TABLE partsupp
ADD CONSTRAINT fk_partsupp_supp FOREIGN KEY (ps_suppkey) REFERENCES supplier
ON DELETE CASCADE;

ALTER TABLE lineitem
DROP CONSTRAINT fk_line_partsupp;

ALTER TABLE lineitem
ADD CONSTRAINT fk_line_partsupp FOREIGN KEY (l_partkey, l_suppkey) REFERENCES partsupp
ON DELETE SET NULL;