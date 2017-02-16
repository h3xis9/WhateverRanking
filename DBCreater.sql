

/*** windows command line使用時、CHCP　９３２（SHIFT-JIS）確認　***/

CREATE DATABASE wr
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
  
USE WR;



/* 会員リスト */
CREATE TABLE userT(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email CHAR(30) NOT NULL UNIQUE,
	pw CHAR(128) NOT NULL,
	nickname CHAR(20) NOT NULL UNIQUE,
	age TINYINT NOT NULL,	/* 1=10代, 2=20代, 3=30代, 4=40代, 5=50代以上*/
	gender TINYINT NOT NULL,	/* 0=男　1=女 */
	point INT NOT NULL DEFAULT 10,
	profileImg BLOB
);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (
	DEFAULT,
	'exp@me.com',
	'1234',
	'NickNameExample',
	1,
	0,
	DEFAULT,
	NULL
);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (
	DEFAULT,
	'root@root.com',
	'root',
	'rootHere',
	2,
	1,
	DEFAULT,
	NULL
);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (
	DEFAULT,
	'user@user.com',
	'user',
	"I'm dummy",
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
	CONSTRAINT fk_PerUser FOREIGN KEY (creatorID)
	REFERENCES userT(id)
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
	responderID INT NOT NULL,
	answer TINYINT NOT NULL,
	CONSTRAINT fk_PerRanking FOREIGN KEY (responderID)
	REFERENCES userT(id)
);
