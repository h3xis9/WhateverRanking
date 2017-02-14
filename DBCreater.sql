CREATE DATABASE WR;
USE WR;

/* 会員リスト */
CREATE TABLE info_memberT(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email char(30) NOT NULL UNIQUE,
	pw char(128) NOT NULL,
	nickname char(20) NOT NULL,
	age TINYINT NOT NULL,
	gender TINYINT NOT NULL
);

/* ランキング */
CREATE TABLE rankingT(
	rankingNo int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rankingQuestion char(70) NOT NULL,
	creatorId int NOT NULL REFERENCES info_memberT.id,
	postDate timestamp DEFAULT CURRENT_TIMESTAMP
);

/* ランキングに答えたユーザーやその答えの値 */
CREATE TABLE answerT(

);
