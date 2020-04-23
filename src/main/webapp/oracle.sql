create table AAUCTION (
num int not null primary key,
CATEGORY VARCHAR(100) NOT NULL,
SELLER VARCHAR(100) NOT NULL,
pname VARCHAR(100) NOT NULL,
PDETAIL  LONG ,
IMMEDIATEPRICE INT NOT NULL,
BIDUNIT INT,
BEGINSPRICE INT,
STARTDATE TIMESTAMP NOT NULL,
ENDDATE TIMESTAMP NOT NULL,
WINID VARCHAR(100),
PSTATUS VARCHAR(100),
FILENAME VARCHAR(100),
filesize int
);

create table amember(
id varchar2(100) primary key,
password varchar2(100) not null,
name varchar2(10),
registdate TIMESTAMP,
phone varchar2(20),
postcode varchar2(100),
address varchar2(100),
detailAddress varchar2(100),
extraAddress varchar2(100),
position int,
status int,
account varchar2(20),
bank varchar2(10));



insert into amember values("admin@naver.com",hex(aes_encrypt('1111','password')),"관리자",systimestemp,010,1234,"집주소","자세히","참고",0,0,123,"국민");


create table aCash(
cnum int,
id varchar2(100) ,
cash int,
reason Varchar2(20),
cashdate TIMESTAMP,
cstatus int
);

create table abid
(
num int,
id varchar2(100),
biddate TIMESTAMP,
bidprice int
);


        create table wishseller(
        seller varchar2(50),
        id varchar2(50),
        registtime TIMESTAMP
        );
        
          create table amessage (num int,sender varchar2(50),
        receiver varchar2(50),content varchar2(500),
        sendtime TIMESTAMP,readtime TIMESTAMP,
        readcount int);

CREATE TABLE APENALTY(
        ID VARCHAR2(100),
        PENALTYCOUNT INT,
        PENALTYDATE TIMESTAMP,
        PENALTYREASON VARCHAR2(100),
        penaltyEndDate TIMESTAMP);
        
        create table category(num int,name varchar2(100),refnum int default Null);
        
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
