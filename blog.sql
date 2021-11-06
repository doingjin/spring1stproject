SELECT * FROM ALL_TABLES;
DROP TABLE POST;
DROP TABLE MAP;
DROP TABLE MEMBER;

SELECT * FROM MEMBER;
SELECT * FROM POST;
SELECT * FROM MAP;

CREATE TABLE POST(
	PNO INT PRIMARY KEY,
	MID VARCHAR(10) NOT NULL,
	TITLE VARCHAR(20) NOT NULL,
	CONTENT VARCHAR(1000) NOT NULL,
	IMGNAME VARCHAR(100) NOT NULL,
	LOCATION VARCHAR(50) NOT NULL,
	PDATE DATE DEFAULT SYSDATE
);

CREATE TABLE MEMBER(
	MID VARCHAR(10) PRIMARY KEY,
	MPW VARCHAR(12) NOT NULL,
	MNAME VARCHAR(20),
	EMAIL VARCHAR(20),
	PROFILE VARCHAR(100) DEFAULT 'images\pro.jpg'
	-- BG VARCHAR(100) DEFAULT 'BG.JPG'
);

CREATE TABLE MAP(
	PNO INT PRIMARY KEY,
	LAT VARCHAR(20) NOT NULL,
	LNG VARCHAR(20) NOT NULL,
	LOCATION VARCHAR(50),
	MID VARCHAR(10),
	IMGNAME VARCHAR(100),
	CONSTRAINT mpno FOREIGN KEY (PNO) REFERENCES POST(PNO) ON DELETE CASCADE
);

insert into member values ('qwe','1212','경진','doingjinn@gmail.com',DEFAULT);
insert into member values ('qwqw','1212','에이','jogjin@hanmail.net',DEFAULT);
insert into member values ('asd','1212','hey','jgj1029@gmail.com',DEFAULT);
insert into post values (1, 'qwe', '11', 'dfsdfsd','\img\gj.jpg','LA',sysdate);
select count(*) from post where mid='qwe';
update member set mpw='1212' where mid='qwe';
delete from member where mid='qwqw';
