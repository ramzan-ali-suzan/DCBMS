USE [master]
GO
/****** Object:  Database [DiagnosticCBMSV2.29]    Script Date: 09-Jan-17 2:51:30 PM ******/
CREATE DATABASE [DiagnosticCBMSV2.29]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticCBMSV2.29', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DiagnosticCBMSV2.29.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticCBMSV2.29_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DiagnosticCBMSV2.29_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticCBMSV2.29].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DiagnosticCBMSV2.29]
GO
/****** Object:  Table [dbo].[PatientInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PatientInfo](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[MobileNo] [varchar](11) NOT NULL,
	[BillAmount] [decimal](18, 0) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
 CONSTRAINT [PK_PatientInfo] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestInfo](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](50) NOT NULL,
	[Fee] [decimal](18, 0) NOT NULL,
	[TestTypeId] [int] NOT NULL,
 CONSTRAINT [PK_TestInfo] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestRequest]    Script Date: 09-Jan-17 2:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestRequest](
	[PatientId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
 CONSTRAINT [PK_TestRequest] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestTypeInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestTypeInfo](
	[TestTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TestType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestTypeInfo] PRIMARY KEY CLUSTERED 
(
	[TestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PatientInfo] ON 

INSERT [dbo].[PatientInfo] ([PatientId], [Name], [DateOfBirth], [MobileNo], [BillAmount], [PaymentStatus]) VALUES (103, N'Muhammad', CAST(N'1991-12-12' AS Date), N'01678000000', CAST(750 AS Decimal(18, 0)), 1)
INSERT [dbo].[PatientInfo] ([PatientId], [Name], [DateOfBirth], [MobileNo], [BillAmount], [PaymentStatus]) VALUES (104, N'Riad', CAST(N'1991-12-12' AS Date), N'01678000001', CAST(350 AS Decimal(18, 0)), 0)
INSERT [dbo].[PatientInfo] ([PatientId], [Name], [DateOfBirth], [MobileNo], [BillAmount], [PaymentStatus]) VALUES (105, N'Sabri', CAST(N'1991-12-12' AS Date), N'01678000002', CAST(900 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[PatientInfo] OFF
SET IDENTITY_INSERT [dbo].[TestInfo] ON 

INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1019, N'CBC', CAST(400 AS Decimal(18, 0)), 15)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1020, N'RBS', CAST(150 AS Decimal(18, 0)), 15)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1021, N'S. Creatinine', CAST(350 AS Decimal(18, 0)), 15)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1022, N'Lipid profile', CAST(450 AS Decimal(18, 0)), 15)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1023, N'Hand X-ray', CAST(200 AS Decimal(18, 0)), 16)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1024, N'Feet X-ray', CAST(300 AS Decimal(18, 0)), 16)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1025, N'Lower Abdomen', CAST(550 AS Decimal(18, 0)), 17)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1026, N'ECG', CAST(150 AS Decimal(18, 0)), 18)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1027, N'Echo', CAST(1000 AS Decimal(18, 0)), 19)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [Fee], [TestTypeId]) VALUES (1028, N'Whole Abdomen', CAST(800 AS Decimal(18, 0)), 17)
SET IDENTITY_INSERT [dbo].[TestInfo] OFF
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (103, 1019, CAST(N'2017-01-09' AS Date))
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (103, 1021, CAST(N'2017-01-09' AS Date))
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (104, 1020, CAST(N'2017-01-09' AS Date))
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (104, 1023, CAST(N'2017-01-09' AS Date))
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (105, 1021, CAST(N'2017-01-09' AS Date))
INSERT [dbo].[TestRequest] ([PatientId], [TestId], [EntryDate]) VALUES (105, 1025, CAST(N'2017-01-09' AS Date))
SET IDENTITY_INSERT [dbo].[TestTypeInfo] ON 

INSERT [dbo].[TestTypeInfo] ([TestTypeId], [TestType]) VALUES (15, N'Blood')
INSERT [dbo].[TestTypeInfo] ([TestTypeId], [TestType]) VALUES (18, N'ECG')
INSERT [dbo].[TestTypeInfo] ([TestTypeId], [TestType]) VALUES (19, N'Echo')
INSERT [dbo].[TestTypeInfo] ([TestTypeId], [TestType]) VALUES (17, N'USG')
INSERT [dbo].[TestTypeInfo] ([TestTypeId], [TestType]) VALUES (16, N'X-Ray')
SET IDENTITY_INSERT [dbo].[TestTypeInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_PatientInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PatientInfo] ON [dbo].[PatientInfo]
(
	[MobileNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestInfo] ON [dbo].[TestInfo]
(
	[TestName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestTypeInfo]    Script Date: 09-Jan-17 2:51:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestTypeInfo] ON [dbo].[TestTypeInfo]
(
	[TestType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestInfo]  WITH CHECK ADD  CONSTRAINT [FK_TestInfo_TestTypeInfo] FOREIGN KEY([TestTypeId])
REFERENCES [dbo].[TestTypeInfo] ([TestTypeId])
GO
ALTER TABLE [dbo].[TestInfo] CHECK CONSTRAINT [FK_TestInfo_TestTypeInfo]
GO
ALTER TABLE [dbo].[TestRequest]  WITH CHECK ADD  CONSTRAINT [FK_TestRequest_PatientInfo] FOREIGN KEY([PatientId])
REFERENCES [dbo].[PatientInfo] ([PatientId])
GO
ALTER TABLE [dbo].[TestRequest] CHECK CONSTRAINT [FK_TestRequest_PatientInfo]
GO
ALTER TABLE [dbo].[TestRequest]  WITH CHECK ADD  CONSTRAINT [FK_TestRequest_TestInfo] FOREIGN KEY([TestId])
REFERENCES [dbo].[TestInfo] ([TestId])
GO
ALTER TABLE [dbo].[TestRequest] CHECK CONSTRAINT [FK_TestRequest_TestInfo]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticCBMSV2.29] SET  READ_WRITE 
GO
