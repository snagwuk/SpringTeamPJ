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
DELIVERYPAY int,   
WINID VARCHAR(100),
PSTATUS VARCHAR(100), 
FILENAME VARCHAR(100),
filesize int
);

create table amember(
id varchar(100) primary key,
password varchar(10) not null,
name varchar(10),
registdate datetime,
phone varchar(20),
postcode varchar(100),
address varchar(100),
detailAddress varchar(100),
extraAddress varchar(100),
position varchar(10),
status varchar(10),
account varchar(20),
bank varchar(10));
관리자 아이디 admin 비밀번호 1111 등록
insert into amember values("admin",1111,"관리자",now(),010,1234,"집주소","자세히","참고","관리자","가능",123,"국민");

create table aCash(
id varchar(100) ,
cash int,
reason Varchar(20),
cashdate datetime
);

create table abid
(
num int,
id varchar(100),
biddate dateTime,
bidprice int 
);

create table aReview
(
num int,
seller varchar(100),
id varchar(100),
productStar int ,
deliveryStar int ,
serviceStar int 
);



