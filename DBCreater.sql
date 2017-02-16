

/*** windows command line使用時、CHCP　９３２（SHIFT-JIS）確認　***/

CREATE DATABASE wr
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
  
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

INSERT INTO info_memberT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (
	DEFAULT,
	'exp@me.com',
	'1234',
	'NickNameExample',
	1,
	0,
	DEFAULT,
	NULL
);

INSERT INTO info_memberT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (
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
	rankingReward INT NOT NULL, /* Domain: 1~3, decided rank cost by this point */
	creatorId INT NOT NULL,
	postDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_PerOrders FOREIGN KEY (creatorID)
	REFERENCES info_memberT(id)
);


INSERT INTO rankingT (rankingNo, rankingQuestion, rankingReward, creatorId, postDate) VALUES (
	DEFAULT,
	'ラーメンを一週間一回以上食べる人！',
	1,
	1,
	DEFAULT
);

INSERT INTO rankingT (rankingNo, rankingQuestion, rankingReward, creatorId, postDate) VALUES (
	DEFAULT,
	'自分は一日一回以上、SNSの確認をする。',
	3,
	1,
	DEFAULT
);



/* ランキングに答えたユーザーやその答えの値 */
CREATE TABLE answerT(
	targetRankNo INT NOT NULL PRIMARY KEY REFERENCES rankingT.rankingNo,
	responderID int NOT NULL REFERENCES info_memberT.id,
	answer TINYINT NOT NULL
);
