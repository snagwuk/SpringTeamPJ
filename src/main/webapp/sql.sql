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
PSTATUS VARCHAR(100), //�ŷ�����(�Ա���,�����...)
FILENAME VARCHAR(100),
filesize int
);

create table amember(
id varchar(200) not null,
password int not null,
name varchar(200),
birthday datetime,
phone varchar(20),
mstatus varchar(20),
address varchar(200),
account int,
bank varchar(100)
);
