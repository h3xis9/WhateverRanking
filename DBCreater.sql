/* TODO
 * インデックスの追加
 * 
 */

/*** windows command line使用時、CHCP　９３２（SHIFT-JIS）確認　***/

CREATE DATABASE wr
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;

USE WR;



/* 会員T */
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

/* male dummies by ages */
INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m1@10.com','m110',"10代男dummy1",1,0,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m1@20.com','m120',"20代男dummy1",2,0,DEFAULT,NULL);
INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m2@20.com','m220',"20代男dummy2",2,0,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m1@30.com','m130',"30代男dummy1",3,0,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m1@40.com','m140',"40代男dummy1",4,0,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'m1@50.com','m150',"50代男dummy1",5,0,DEFAULT,NULL);


/* female dummies by ages */
INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'f1@10.com','f110',"10代女dummy1",1,1,DEFAULT,NULL);
INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'f2@10.com','f210',"10代女dummy2",1,1,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'f1@20.com','f120',"20代女dummy1",2,1,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'f1@30.com','f130',"30代女dummy1",3,1,DEFAULT,NULL);

INSERT INTO userT (id, email, pw, nickname, age, gender, point, profileImg) VALUES (DEFAULT,'f1@40.com','f140',"40代女dummy1",4,1,DEFAULT,NULL);



/* ランキングT */
CREATE TABLE rankingT(
	rankingNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rankingQuestion CHAR(70) NOT NULL,
	rankingReward INT NOT NULL, /* Domain: 1~3, decided rank cost by this point */
	creatorID INT NOT NULL,
	postDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT fk_whoMadeThis FOREIGN KEY (creatorID)
	REFERENCES userT(id)
);


INSERT INTO rankingT (rankingNo, rankingQuestion, rankingReward, creatorID, postDate) VALUES (
	DEFAULT,
	'ラーメンを一週間一回以上食べる人！',
	1,
	1,
	DEFAULT
);

INSERT INTO rankingT (rankingNo, rankingQuestion, rankingReward, creatorID, postDate) VALUES (
	DEFAULT,
	'自分は一日一回以上、SNSの確認をする。',
	3,
	1,
	DEFAULT
);



/* ランキングに答えたユーザーやその答え */
CREATE TABLE answerT(
	answerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	targetRankNo INT NOT NULL,
	responderID INT NOT NULL,
	answer TINYINT NOT NULL,	/* 0=NO, 1=YES */
	CONSTRAINT fk_whichRankUserAnswer FOREIGN KEY (targetRankNo)
	REFERENCES rankingT(rankingNo),
	CONSTRAINT fk_whoAnswerThis FOREIGN KEY (responderID)
	REFERENCES userT(id)
);


INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 3, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 4, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 5, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 6, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 7, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 9, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 10, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 11, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (1, 12, 0);

INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 3, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 4, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 5, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 6, 0);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 7, 0);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 8, 0);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 9, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 10, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 11, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 12, 1);
INSERT INTO answerT (targetRankNo, responderID, answer) VALUES (2, 13, 0);
