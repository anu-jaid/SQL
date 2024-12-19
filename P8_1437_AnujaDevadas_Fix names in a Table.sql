-- Project 8  Fix names in a Table
CREATE TABLE NAMES (
    NAME VARCHAR(255)
);


INSERT INTO NAMES (NAME) 
VALUES 
('rAVI kUMAR'),
('priya sharma'),
('amit PATEL'),
('NEHA gupta');

UPDATE NAMES
SET NAME = CONCAT(UPPER(SUBSTRING(NAME, 1, 1)), LOWER(SUBSTRING(NAME, 2)))
WHERE NAME LIKE '% %';

SELECT * FROM NAMES;
