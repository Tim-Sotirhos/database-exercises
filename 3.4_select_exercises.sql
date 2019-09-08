/*

Basic Statements

USE `albums_db`;
SHOW TABLES;
SHOW CREATE TABLE albums;
DESCRIBE albums;
SELECT * FROM albums;

SELECT * FROM albums where artist = 'pink floyd';

SELECT release_date FROM albums where name = 'sgt. pepper's lonely hearts club band';

SELECT genre FROM albums WHERE name = 'nevermind';

SELECT * FROM albums
WHERE release_date >= 1990 and release_date < 2000;

SELECT * FROM albums WHERE sales < 20;

SELECT * FROM albums where genre = 'rock';
-- because only 'rock' was inputed in my condition instead of 'hard rock' or 'progressive rock'

SELECT * FROM albums where genre like '%rock%';

*/