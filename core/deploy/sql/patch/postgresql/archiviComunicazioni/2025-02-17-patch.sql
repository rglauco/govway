CREATE SEQUENCE seq_transazioni_info start 1 increment 1 maxvalue 9223372036854775807 minvalue 1 cache 1 CYCLE;

ALTER TABLE transazioni_info ADD COLUMN id BIGINT;
UPDATE transazioni_info SET id = nextval('seq_transazioni_info');
ALTER TABLE transazioni_info ALTER COLUMN id SET NOT NULL;
ALTER TABLE transazioni_info ALTER COLUMN id SET DEFAULT nextval('seq_transazioni_info');
ALTER TABLE transazioni_info ADD CONSTRAINT pk_transazioni_info PRIMARY KEY (id);
