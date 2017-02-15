CREATE DATABASE WR;
USE WR;

/* 会員リスト */
CREATE TABLE info_memberT(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email CHAR(30) NOT NULL UNIQUE,
	pw CHAR(128) NOT NULL,
	nickname CHAR(20) NOT NULL UNIQUE,
	age TINYINT NOT NULL,
	gender TINYINT NOT NULL,
	point INT NOT NULL DEFAULT 10,
	profileImg BLOB
);

INSERT INTO info_memberT VALUES (
	DEFAULT,
	'exp@me.com',
	'1234',
	'NickNameExample',
	1,
	0,
	DEFAULT,
	NULL
);

INSERT INTO info_memberT VALUES (
	DEFAULT,
	'root@root.com',
	'root',
	'rootHere',
	2,
	1,
	DEFAULT,
	NULL
);

/* ランキング */
CREATE TABLE rankingT(
	rankingNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rankingQuestion CHAR(70) NOT NULL,
	creatorId INT NOT NULL REFERENCES info_memberT.id,
	postDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* ランキングに答えたユーザーやその答えの値 */
CREATE TABLE answerT(
	targetRankNo INT NOT NULL PRIMARY KEY REFERENCES rankingT.rankingNo,
	responderID int NOT NULL REFERENCES info_memberT.id,
	answer TINYINT NOT NULL
);
