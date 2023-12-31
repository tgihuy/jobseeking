USE [master]
GO
/****** Object:  Database [recruitWeb]    Script Date: 11/18/2023 3:41:30 AM ******/
CREATE DATABASE [recruitWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'recruitWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\recruitWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'recruitWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\recruitWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [recruitWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [recruitWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [recruitWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [recruitWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [recruitWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [recruitWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [recruitWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [recruitWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [recruitWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [recruitWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [recruitWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [recruitWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [recruitWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [recruitWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [recruitWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [recruitWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [recruitWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [recruitWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [recruitWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [recruitWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [recruitWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [recruitWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [recruitWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [recruitWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [recruitWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [recruitWeb] SET  MULTI_USER 
GO
ALTER DATABASE [recruitWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [recruitWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [recruitWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [recruitWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [recruitWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [recruitWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [recruitWeb] SET QUERY_STORE = OFF
GO
USE [recruitWeb]
GO
/****** Object:  Table [dbo].[account]    Script Date: 11/18/2023 3:41:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[display_name] [varchar](50) NOT NULL,
	[contact] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[role] [varchar](20) NOT NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 11/18/2023 3:41:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[owner] [varchar](50) NOT NULL,
	[contact] [nvarchar](50) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 11/18/2023 3:41:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner] [varchar](50) NOT NULL,
	[company_id] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[content] [text] NOT NULL,
	[salary] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[submission]    Script Date: 11/18/2023 3:41:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[owner] [varchar](50) NOT NULL,
	[post_id] [int] NOT NULL,
	[detail] [text] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'admin', N'admin', N'admin', N'xxxxxxxxxx', N'admin@gmail.com', N'admin', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'hr1', N'hr1', N'HR 1', N'09123456789', N'hr1@gmail.com', N'user', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'hr2', N'hr2', N'HR 2', N'09123456788', N'hr2@gmail.com', N'user', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'hr3', N'123', N'hr3', N'0123456789', N'xxxgmail.com', N'user', N'Available')
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'hr4', N'123', N'banana', N'0912345678', N'hr4@gmail.com', N'user', N'Available')
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'hr5', N'123', N'hr5', N'012345678', N'xxxgmail.com', N'user', N'Available')
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'nhanvien1', N'nhanvien1', N'Nhan Vien 1', N'09123456787', N'nhanvien1@gmail.com', N'user', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'nhanvien2', N'nhanvien2', N'Nhan Vien 2', N'09123456786', N'nhanvien2@gmail.com', N'user', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'nhanvien3', N'nhanvien3', N'Nhan Vien 3', N'09123456785', N'nhanvien3@gmail.com', N'user', NULL)
INSERT [dbo].[account] ([username], [password], [display_name], [contact], [mail], [role], [status]) VALUES (N'sa', N'123', N'SA', N'xxxxxxxxxx', N'admin@gmail.com', N'admin', NULL)
GO
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (1, N'FPT Software', N'sa', N'0123456789', N'image/hotelbacgiang.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (2, N'Software', N'sa', N'0123456789', N'image/hotelhadong.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (3, N'Hola Bana', N'sa', N'0123456789', N'image/hotelhanoi.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (4, N'Banana Ha', N'sa', N'0123456789', N'image/hotelhola.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (5, N'Nam Pro Max', N'admin', N'0123456789', N'image/hotelsonla.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (6, N'Manasd', N'sa', N'0123456789', N'image/hotelthachhoa.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (7, N'Test Companay', N'admin', N'0123456789', N'image/hoteldongnai.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (8, N'OHNONONO', N'admin', N'0123456789', N'image/hotelhcm.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (9, N'Ba Na Hiu', N'admin', N'0123456789', N'image/hotelsaigon.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (10, N'MB Bank', N'hr2', N'0123456789', N'image/hotelbinhthuan.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (11, N'Zing Me', N'hr2', N'0123456789', N'image/hotelninhthuan.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (12, N'Dragon CIty', N'hr2', N'0123456789', N'image/hotelthanhhoa.png', N'nam@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (13, N'VNG GAME', N'hr1', N'0123456789', N'image/hotelquangninh.png', N'asdf@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (15, N'Chess LoL', N'hr1', N'0123456789', N'image/hotelphuquoc.png', N'qưeq@gmail.com', N'Hola, Thach That, Ha Noi')
INSERT [dbo].[company] ([id], [name], [owner], [contact], [img], [mail], [location]) VALUES (18, N'banana', N'hr5', N'0123456789', N'image/ba.jpg', N'xxxgmail.com', N'Hola, Thach That, Ha Noi')
SET IDENTITY_INSERT [dbo].[company] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (6, N'sa', 1, N'Tuyển Backend', N'We are looking for an experienced Back-end Technical Senior to join our product team to build: a “Top 1 in the world ” Smart city and smart home solution

Be part of an agile team designing and developing high-performance components/micro-services for a wide range of smart city and smart home project ( Access Control, Camera AI, Smart Parking, Waste Management...)', 10000, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (7, N'hr1', 15, N'Tuyển Tester', N'L?p trình pha´t triê?n ca´c phâ`n mê`m mo´i, nghiên c?u áp d?ng ca´c gia?i pha´p công nghê? da´p u´ng nhu câ`u nghiê?p vu? pha´t sinh
Ch?nh s?a, ca?i tiê´n, hoa`n thiê?n ca´c phâ`n mê`m co´ sa~n, phô´i ho?p vo´i dô´i ta´c cung câ´p phâ`n mê`m nê´u câ`n thiê´t.
Tham gia nghiên cu´u, du`ng thu? va` da´nh gia´ ca´c gia?i pha´p ma` dô´i ta´c dê` xuâ´t trong du? a´n nâng câ´p hê? thô´ng CNTT cu?a công ty
Tham gia d?ng, nâng c?p, v?n hành môi tru?ng ki?m th? ph?n m?m ?ng d?ng tru?c khi dua vào tri?n khai chính th?c.', 10, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (8, N'hr2', 10, N'Tuyển Frontend', N'You want to see your code making work easier for others? You want to see a project through, being involved in all steps? Then apply to us now! As a software company operating within the laser scanning industry, we are looking for a freelancer based in Hanoi, Vietnam to help us improve and transform our products starting now.', 30, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (9, N'hr2', 10, N'Tuyển Senior', N'Analyzing requirements for website and applications.
Writing and building efficient PHP or NodeJs modules.
Developing back-end modules with an optimized database.
Troubleshooting application and code issues.
Conducting test for development cycle from unit test to system test.
Updating and altering application features to enhance performance.', 20000, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (10, N'sa', 3, N'Tuyển Sercurity', N'Work closely with product owners, QA team, DevOps team and fellow product engineers to be able to provide right feedback to the team for V-Key products to be successfully integrated into the target mobile application
Provide guidance to customers in terms of how the integration of the mobile SDK needs to be carried out such as documenting the right sequence of APIs, with right parameters for customers to refer to.
Work closely with pre-sales engineers in technically assisting potential customers to be able to complete integration with their mobile apps successfully
Actively work with technical writing team in order to produce well documented steps for achieving successful integration on a specific mobile app development platform', 999, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (11, N'hr2', 10, N'Tuyển Senior', N'Phát tri?n các h? th?ng LMS (PHP Developer)
Programming Language: PHP (Zend Framework, CakePHP), LAMP,...
Database: MySQL, PostgreSQL,...
Others: LMS, SCORM, Smarty...
Phát tri?n ?ng d?ng mobile
Programming Language: Python (Django), Dart (Flutter)
Database: PostgreSQL
Others: Logictics, Map, Routing', 20000, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (12, N'hr1', 10, N'Tuyển Senior', N'Develop, maintain, and launch new mobile products and extend platform functionality.
Work collaboratively with product management, governance and your scrum team to design and deliver new and innovative customer solutions.
Bring to bear your experience leveraging best in class tools and technologies (CI/CD, cloud computing, web service development) to refine and improve software development practices.
Engage in innovative problem-solving activities, requiring conceptual thinking creating out of the box solutions with prototypes and pilots.
Utilize TDD practices to ensure delivery of high-quality code with low rates of production defects.
Instrument services and solutions to ensure deployed software is scalable and reliable.', 20000, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (14, N'sa', 1, N'Tuyển Backend', N'The research applied data science problems in our ads systems to improve prediction accuracy, auction strategies, and drive advertiser value;
Work closely with engineering and product teams to develop hypotheses, run experiments and prototype new product ideas;
Collaborate with data engineering teams to build/maintain reports, dashboards, and metrics to monitor the performance of our products, provide insights, and identify new opportunities.;
Apply technical expertise with quantitative analysis, experimentation, data mining, and the presentation of data to develop an understanding of the ads targeting/auction/delivery system
', 20000, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (15, N'sa', 3, N'Tuyển Senior', N'To develop software applications with limited support from senior engineers.
To write program from design specifications in compliance with established coding quality standard of the company.
To write unit tests and run through all the test cases for assigned tasks and ensure all cases tested and passed before release for testing.
To perform code review, code refactor if required.
To document detailed designs as part of technical leaders (lead by Technical Architect or Solution Architect).
To self-train on new technologies.
To follow strictly all the customer’s process if being requested, company’s', 999, NULL)
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (16, N'sa', 1, N'help me from tu ban FPT Hic hic hic', N'Require 100 years experiencesa', 100000, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (17, N'sa', 1, N'help me from tu banFPTHUHU', N'Require 100 years experiencesa', 100000, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (18, N'sa', 1, N'asd', N'asd', 100000, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (19, N'hr5', 18, N'tuyen fresher frond-end', N'143124', 200, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (20, N'hr5', 18, N'123', N'123', 1234, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (21, N'hr1', 13, N'sdf', N'ádf', 9999, N'Available')
INSERT [dbo].[post] ([id], [owner], [company_id], [title], [content], [salary], [status]) VALUES (23, N'hr1', 13, N'4124', N'124124', 9999, N'Available')
SET IDENTITY_INSERT [dbo].[post] OFF
GO
SET IDENTITY_INSERT [dbo].[submission] ON 

INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (6, N'sa', 7, N'a. a', N'Approved')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (7, N'sa', 7, N'1. 1', N'Approved')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (8, N'sa', 8, N'1. 1', N'Pending')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (10, N'sa', 12, N'1. 1', N'Pending')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (11, N'sa', 10, N'1. 1', N'Pending')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (12, N'sa', 12, N'1. 1', N'Pending')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (13, N'hr3', 7, N'2 year working at kms. frond-end developer', N'Approved')
INSERT [dbo].[submission] ([id], [owner], [post_id], [detail], [status]) VALUES (14, N'hr5', 7, N'2 year working at kms. frond-end developer', N'Rejected')
SET IDENTITY_INSERT [dbo].[submission] OFF
GO
ALTER TABLE [dbo].[company]  WITH CHECK ADD FOREIGN KEY([owner])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([company_id])
REFERENCES [dbo].[company] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([owner])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[submission]  WITH CHECK ADD FOREIGN KEY([owner])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[submission]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [recruitWeb] SET  READ_WRITE 
GO
