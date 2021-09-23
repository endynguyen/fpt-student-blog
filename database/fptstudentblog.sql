﻿USE [master]
GO
/****** Object:  Database [FPTStudentBlog]    Script Date: 9/23/2021 8:19:35 PM ******/
CREATE DATABASE [FPTStudentBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTStudentBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTStudentBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTStudentBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTStudentBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTStudentBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET  MULTI_USER 
GO
ALTER DATABASE [FPTStudentBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTStudentBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTStudentBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTStudentBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTStudentBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTStudentBlog] SET QUERY_STORE = OFF
GO
USE [FPTStudentBlog]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[userID] [varchar](10) NULL,
	[date] [datetime] NULL,
	[commentContent] [nvarchar](max) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPosts]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosts](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](10) NOT NULL,
	[statusPID] [varchar](10) NOT NULL,
	[categoryID] [int] NULL,
	[title] [nvarchar](max) NULL,
	[postContent] [ntext] NULL,
	[date] [datetime] NULL,
	[vote] [int] NULL,
	[approveComment] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblPosts] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRank]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRank](
	[rankID] [int] NOT NULL,
	[rankName] [nvarchar](100) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_tblRank] PRIMARY KEY CLUSTERED 
(
	[rankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReports]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReports](
	[reportID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[reportContent] [varchar](max) NULL,
	[date] [datetime] NULL,
	[userID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblReports] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusPosts]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusPosts](
	[statusPID] [varchar](10) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatusPosts] PRIMARY KEY CLUSTERED 
(
	[statusPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusUser]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusUser](
	[statusUID] [varchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatusUser] PRIMARY KEY CLUSTERED 
(
	[statusUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTagBlog]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTagBlog](
	[postID] [int] NOT NULL,
	[tagID] [int] NOT NULL,
 CONSTRAINT [PK_tblTagBlog] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTags]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTags](
	[tagID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[tagName] [varchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblTags] PRIMARY KEY CLUSTERED 
(
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 9/23/2021 8:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](10) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[statusUID] [varchar](10) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[totalVote] [int] NULL,
	[rankID] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (1, N'BUSINESS ADMINISTRATION')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (2, N'SOFTWARE ENGINEERING')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (3, N'INTERNATIONAL BUSSINESS')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (4, N'INFORMATION ASSURANCE')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (5, N'MULTIMEDIA COMMUNICATIONS')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (6, N'GRAPHIC DESIGN')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (7, N'HOTEL MANAGEMENT')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (8, N'ENGLISH LANGUAGE')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (9, N'JAPANESE LANGUAGE')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPosts] ON 

INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment]) VALUES (1, N'khoala', N'1', 1, N'[Case Study] Bí quyết kinh doanh trong mùa dịch của chuỗi thời trang Real Clothes', N'Thời trang vốn là sản phẩm không thiết yếu, đặc biệt khi sức khoẻ và cái chết cận kề. Tuy nhiên khá may mắn, trong danh mục không cần thiết của thời trang, thì các sản phẩm của Real vẫn mang tính rất là cơ bản và đời sống : quần tây đi làm / sơ mi công sở/ aó vest đi nắng ngồi máy lạnh. Nên thời gian qua doanh thu dù có giảm so với cùng kỳ các năm trước, vẫn ở mức chấp nhận được.', CAST(N'2021-09-22T00:00:00.000' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[tblPosts] OFF
GO
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (0, N'None', 50)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (1, N'Bronze', 150)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (2, N'Silver', 250)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (3, N'Gold', 350)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (4, N'Platinum', 500)
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote]) VALUES (5, N'Diamond', 1000)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'0', N'Denied')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'1', N'Approved')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'2', N'Waiting')
GO
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'0', N'Banned')
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'1', N'Active')
GO
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'admin', N'AD', N'1', N'Khoa Admin', N'12345678', N'admin@gmail.com', N'113', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'khoala', N'US', N'1', N'Khoa Hacker', N'12345678', N'khoala@gmail.com', N'114', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date]) VALUES (N'mentor', N'MT', N'1', N'Khoa Mentor', N'12345678', N'mentor@gmail.com', N'115', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblPosts]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUsers]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblCategories]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblStatusPosts] FOREIGN KEY([statusPID])
REFERENCES [dbo].[tblStatusPosts] ([statusPID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblStatusPosts]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblUsers]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReports_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReports_tblPosts]
GO
ALTER TABLE [dbo].[tblReports]  WITH CHECK ADD  CONSTRAINT [FK_tblReports_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblReports] CHECK CONSTRAINT [FK_tblReports_tblUsers]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblPosts]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblTags] FOREIGN KEY([tagID])
REFERENCES [dbo].[tblTags] ([tagID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblTags]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRank] FOREIGN KEY([rankID])
REFERENCES [dbo].[tblRank] ([rankID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRank]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatusUser] FOREIGN KEY([statusUID])
REFERENCES [dbo].[tblStatusUser] ([statusUID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatusUser]
GO
USE [master]
GO
ALTER DATABASE [FPTStudentBlog] SET  READ_WRITE 
GO