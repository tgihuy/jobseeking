--drop database recruitWeb

create database recruitWeb
go

use recruitWeb
go

create table account (
	username VARCHAR(50) NOT NULL PRIMARY KEY,
	password VARCHAR(50) NOT NULL,
	display_name VARCHAR(50) NOT NULL,
	contact VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL,
	role VARCHAR(20) NOT NULL,
	status VARCHAR(20)
)


create table company (
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(50) NOT NULL,
    owner VARCHAR(50) NOT NULL references account(username)  on delete CASCADE,
	contact NVARCHAR(50) NOT NULL,
	img NVARCHAR(MAX) NOT NULL,
	mail NVARCHAR(50) NOT NULL,
	location NVARCHAR(50) NOT NULL,
)

create table post (
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	owner VARCHAR(50) NOT NULL references account(username) on delete CASCADE,
	company_id INT NOT NULL references company(id) on delete CASCADE,
    title NVARCHAR(50) NOT NULL,
	content text NOT NULL,
	salary INT NOT NULL,

	status NVARCHAR(50),
)

create table submission (
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	owner VARCHAR(50) NOT NULL references account(username) on delete CASCADE,
	post_id INT NOT NULL references post(id) on delete CASCADE,
	detail text NOT NULL,
	status NVARCHAR(50) NOT NULL
)

insert into account values('admin','admin','admin','xxxxxxxxxx','admin@gmail.com','admin',NULL)
insert into account values('sa','123','SA','xxxxxxxxxx','admin@gmail.com','admin',NULL)
insert into account values('hr1','hr1','HR 1','09123456789','hr1@gmail.com','user',NULL)
insert into account values('hr2','hr2','HR 2','09123456788','hr2@gmail.com','user',NULL)

insert into account values('nhanvien1','nhanvien1','Nhan Vien 1','09123456787','nhanvien1@gmail.com','user',NULL)
insert into account values('nhanvien2','nhanvien2','Nhan Vien 2','09123456786','nhanvien2@gmail.com','user',NULL)
insert into account values('nhanvien3','nhanvien3','Nhan Vien 3','09123456785','nhanvien3@gmail.com','user',NULL)


INSERT INTO [company] 
  VALUES 
	('FPT Software', 'sa', '0123456789', 'image/hotelbacgiang.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Software', 'sa', '0123456789','image/hotelhadong.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Hola Bana', 'sa', '0123456789','image/hotelhanoi.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Banana Ha', 'sa', '0123456789','image/hotelhola.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Nam Pro Max', 'admin', '0123456789','image/hotelsonla.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Manasd', 'sa', '0123456789','image/hotelthachhoa.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Test Companay', 'admin', '0123456789','image/hoteldongnai.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('OHNONONO', 'admin', '0123456789','image/hotelhcm.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Ba Na Hiu', 'admin', '0123456789','image/hotelsaigon.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('MB Bank', 'hr2', '0123456789','image/hotelbinhthuan.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Zing Me', 'hr2', '0123456789','image/hotelninhthuan.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Dragon CIty', 'hr2', '0123456789','image/hotelthanhhoa.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('VNG GAME', 'hr1', '0123456789','image/hotelquangninh.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('RIot Client', 'hr1', '0123456789','image/hotelnamdinh.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi'),
	('Chess LoL', 'hr1', '0123456789','image/hotelphuquoc.png', 'nam@gmail.com', 'Hola, Thach That, Ha Noi')

insert into post values('sa','1',N'Tuyển Backend','Require 100 years experience. Skill require NodeJs, MySQL',10000,NULL)
insert into post values('hr1','15',N'Tuyển Tester','Require play game 25 hours per day, Graduated in College or University, Experience working in distributed Agile model (Scrum)',10,NULL)
insert into post values('hr2','10',N'Tuyển Frontend','Require 1 years experience, Energetic / Pro-active, Comfortable working in an Agile environment',30,NULL)
insert into post values('hr2','10',N'Tuyển Senior','Require 5 to 7 years experience. Skill require AngularJS, .NET, elasticsearch, CI/CD',20000,NULL)
insert into post values('sa','3',N'Tuyển Sercurity','Require 3 to 5 years of relevant working experience, Diploma or Degree in Sercurity and Computer Science, Professional certification of Coursera',999,NULL)

insert into submission values('nhanvien1',4,'i am pro', 'rejected')
insert into submission values('nhanvien2',3,'i am not weak','approve')
insert into submission values('nhanvien2',2,'i am enough for your require','pending')
insert into submission values('nhanvien2',1,'i am strong','rejected')
insert into submission values('nhanvien2',5,'do you need me?', 'approve')