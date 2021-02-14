DROP TABLE IF EXISTS raters; 
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS ratings;

CREATE TABLE raters(
raterID int NOT NULL PRIMARY KEY,
raterName VARCHAR(30) NOT NULL UNIQUE
  );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/raters.csv'
INTO TABLE raters
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(raterID, raterName);

CREATE TABLE movies
(
movieID int NOT NULL PRIMARY KEY,
movieTitle varchar(30) NOT NULL UNIQUE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies.csv'
INTO TABLE movies
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(movieID, movieTitle);

CREATE TABLE ratings(
movieID int NOT NULL REFERENCES movies(movieID),
raterId int NOT NULL REFERENCES raters(raterID),
rating int NULL
  );
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ratings.csv'
INTO TABLE ratings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(movieID, raterID, @rating)
SET rating = nullif(@rating, -1);

select * from movies;
select * from raters;
select * from ratings;