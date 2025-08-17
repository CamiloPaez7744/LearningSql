--sequence
CREATE SEQUENCE users_seq START 1;

DROP SEQUENCE users_seq;

SELECT
	currval('users_seq'),
    nextval('users_seq'),
    currval('users_seq');