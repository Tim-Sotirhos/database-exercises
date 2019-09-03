/*
Basic Statements

use `albums_db`;
show TABLES;
show create table `albums`;
describe `albums`;
select * from `albums`;

select * from `albums` where artist='pink floyd';

select release_date from `albums` where name="sgt. pepper's lonely hearts club band";

select genre from albums where name='nevermind';

select * from albums
where `release_date`>=1990 and `release_date`< 2000;

select * from albums where sales<20;

select * from albums where genre = "rock";
-- because only 'rock' was inputed in my condition instead of 'hard rock' or 'progressive rock'

select * from albums where genre like '%rock%';*/