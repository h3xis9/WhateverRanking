
CREATE DATABASE WR;
USE WR;

CREATE TABLE info_memberT(
	id int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pw char(128) NOT NULL,
	gender int(1) NOT NULL,
	age int(3) NOT NULL,
	subsc int(1) NOT NULL,
	email char(30) NOT NULL UNIQUE
);
