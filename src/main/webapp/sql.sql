create table AAUCTION (
num int not null primary key,
CATEGORY VARCHAR(100) NOT NULL,
SELLER VARCHAR(100) NOT NULL,
pname VARCHAR(100) NOT NULL,
PDETAIL VARCHAR(3000),
IMMEDIATEPRICE INT NOT NULL,
BIDUNIT INT,
BEGINSPRICE INT,
STARTDATE DATETIME NOT NULL,
ENDDATE DATETIME NOT NULL,
WINID VARCHAR(100),
PSTATUS VARCHAR(100),
FILENAME VARCHAR(100),
filesize int
);

--position 관리자:0/판매자:1/구매자:2/구매자가 판매지 신청중:3/거절당한 구매자:4
--status 가능:0/불가:1
--info 설문조사 하지않음:0/함:1
create table amember(
id varchar(100) primary key,
password varchar(100) not null,
name varchar(10),
registdate datetime,
phone varchar(20),
postcode varchar(100),
address varchar(100),
detailAddress varchar(100),
extraAddress varchar(100),
position int,
status int,
account varchar(20),
bank varchar(10),
info int);
--관리자 아이디 admin 비밀번호 1111 등록
insert into amember values("admin@naver.com",hex(aes_encrypt('1111','password')),"관리자",now(),010,1234,"집주소","자세히","참고",0,0,123,"국민",1);

create table aCash(
cnum int,
id varchar(100) ,
cash int,
reason Varchar(20),
cashdate DATETIME,
cstatus int
);

create table abid
(
num int,
id varchar(100),
biddate dateTime,
bidprice int
);



SHOW VARiables LIKE 'event%';
SET GLOBAL event_scheduler = ON;

CREATE EVENT IF NOT EXISTS AAUCTION_CHECK
    ON SCHEDULE
        EVERY 10 SECOND
        STARTS CURRENT_TIMESTAMP
    DO
        UPDATE  AAUCTION SET pstatus = "END" WHERE enddate <= NOW();



        create table wishseller(
        seller varchar(50),
        id varchar(50),
        registtime DATETIME
        );

        create table amessage (num int,sender varchar(50),
        receiver varchar(50),content varchar(500),
        sendtime DATETIME,readtime DATETIME,
        readcount int);

        create table aReview
        (
        num int,
        seller varchar(100),
        id varchar(100),
        productStar int ,
        deliveryStar int ,
        serviceStar int
        );


CREATE TABLE APENALTY(
        ID VARCHAR(100),
        PENALTYCOUNT INT,
        PENALTYDATE DATETIME,
        PENALTYREASON VARCHAR(100),
        penaltyEndDate datetime);


        create table category(num int,name varchar(100),refnum int default Null);
insert into category(num,name) values(100,'의류');
insert into category(num,name) values(200,'잡화');
insert into category(num,name) values(300,'뷰티');
insert into category(num,name) values(400,'식품');
insert into category(num,name) values(500,'가전');

insert into category values(101,'남성의류',100);
insert into category values(102,'여성의류',100);
insert into category values(103,'아동의류',100);

insert into category values(201,'신발',200);
insert into category values(202,'가방',200);
insert into category values(203,'시계',200);
insert into category values(204,'기타악세사리',200);

insert into category values(301,'화장품',300);
insert into category values(302,'향수',300);
insert into category values(303,'바디',300);
insert into category values(304,'헤어',300);

insert into category values(501,'전자기기',500);
insert into category values(502,'생활가전',500);

insert into category values(401,'가공품',400);
insert into category values(402,'신선식품',400);
insert into category values(403,'생필품',400);
  
  create table aInfo(
  	id varchar(100) primary key,
  	gender varchar(10) not null,
  	howToKnow varchar(20) not null);
