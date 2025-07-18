CREATE SEQUENCE seq_statistiche MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 INCREMENT BY 1 CACHE 2 NOCYCLE;

ALTER TABLE statistiche ADD id NUMBER;
UPDATE statistiche SET id = seq_statistiche.NEXTVAL;
ALTER TABLE statistiche MODIFY id NUMBER NOT NULL;
ALTER TABLE statistiche ADD CONSTRAINT pk_statistiche PRIMARY KEY (id);

CREATE TRIGGER trg_statistiche
BEFORE
insert on statistiche
for each row
begin
   IF (:new.id IS NULL) THEN
      SELECT seq_statistiche.nextval INTO :new.id
                FROM DUAL;
   END IF;
end;
/

