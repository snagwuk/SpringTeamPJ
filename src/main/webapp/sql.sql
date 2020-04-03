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
FILENAME VARCHAR(100),
filesize int
);


create table Amessage (toid varchar(50), fromid varchar(50),content varchar(300),sendtime DATETIME ,readcount int);
