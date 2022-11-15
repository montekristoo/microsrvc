CREATE TABLE databases
(
    id       SERIAL  NOT NULL,
    name     VARCHAR NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    jdbc_url VARCHAR NOT NULL
);

SELECT * FROM databases;

ALTER TABLE databases
    ADD CONSTRAINT unique_name UNIQUE (name);

ALTER TABLE databases
    ALTER COLUMN password SET DEFAULT encode(gen_random_bytes(32), 'hex');

ALTER SEQUENCE databases_id_seq
    RESTART WITH 1;

TRUNCATE TABLE databases;

INSERT INTO databases (name, username, password, jdbc_url)
VALUES ('db_1', 'postgres', 'internship', 'jdbc:postgresql://localhost:5432/db_1'),
       ('db_2', 'postgres', 'internship', 'jdbc:postgresql://localhost:5432/db_2'),
       ('db_3', 'postgres', 'internship', 'jdbc:postgresql://localhost:5432/db_3');

INSERT INTO databases (name, username, password, jdbc_url)
VALUES ('db_4', 'postgres', 'internship', 'jdbc:postgresql://localhost:5432/db_4');

DELETE FROM databases
    WHERE name = 'db_4';

UPDATE databases
SET password = crypt(password, gen_salt('bf'));

SELECT name, username, password, jdbc_url FROM databases;

SELECT *
FROM databases;

SELECT * FROM pg_stat_activity;

DELETE FROM databases
WHERE name = 'db_4';

SELECT * FROM databases;

SELECT COUNT(*) FROM pg_stat_activity;

CREATE DATABASE db_4;

SELECT COUNT(*) FROM pg_stat_activity
WHERE datname = 'db_3';
