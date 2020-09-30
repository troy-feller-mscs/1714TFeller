USE [master]
GO
/****** Object:  Database [1714Project]    Script Date: 9/30/2020 3:35:20 PM ******/
CREATE DATABASE [1714Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'1714Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\1714Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'1714Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\1714Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [1714Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [1714Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [1714Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1714Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1714Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1714Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1714Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [1714Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [1714Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1714Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1714Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1714Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [1714Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1714Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1714Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1714Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1714Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [1714Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1714Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [1714Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [1714Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [1714Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1714Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [1714Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [1714Project] SET RECOVERY FULL 
GO
ALTER DATABASE [1714Project] SET  MULTI_USER 
GO
ALTER DATABASE [1714Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [1714Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [1714Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [1714Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [1714Project] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'1714Project', N'ON'
GO
ALTER DATABASE [1714Project] SET QUERY_STORE = OFF
GO
USE [1714Project]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ApptId] [int] IDENTITY(1,1) NOT NULL,
	[ApptDate] [smalldatetime] NOT NULL,
	[EmpNum] [int] NOT NULL,
	[CustNum] [int] NOT NULL,
	[SutdioId] [int] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ApptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NOT NULL,
	[LName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[EmpRole] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[ApptId] [int] NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Portrait]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portrait](
	[PortraitId] [int] IDENTITY(1,1) NOT NULL,
	[PortraitRatio] [nvarchar](50) NOT NULL,
	[PortraitCost] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Portrait] PRIMARY KEY CLUSTERED 
(
	[PortraitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reciept]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reciept](
	[RecieptId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[InvocieDate] [smalldatetime] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
	[Total] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Reciept] PRIMARY KEY CLUSTERED 
(
	[RecieptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studio]    Script Date: 9/30/2020 3:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio](
	[StudioId] [int] IDENTITY(1,1) NOT NULL,
	[SqrFt] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Studio] PRIMARY KEY CLUSTERED 
(
	[StudioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([ApptId], [ApptDate], [EmpNum], [CustNum], [SutdioId]) VALUES (1, CAST(N'2020-09-22T00:00:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[Appointment] ([ApptId], [ApptDate], [EmpNum], [CustNum], [SutdioId]) VALUES (2, CAST(N'2020-11-03T00:00:00' AS SmallDateTime), 6, 3, 2)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustId], [FName], [LName], [Phone], [Email], [Address], [City], [State], [Zip]) VALUES (1, N'Gale', N'Winder', N'(111)-111-1121', N'GWinder@email.com', N'654 Some St', N'Windy', N'OK', N'54798')
INSERT [dbo].[Customer] ([CustId], [FName], [LName], [Phone], [Email], [Address], [City], [State], [Zip]) VALUES (2, N'Berry', N'Nill', N'(111)-111-1122', N'BNill@email.com', N'9871 Road St', N'Windy', N'OK', N'54798')
INSERT [dbo].[Customer] ([CustId], [FName], [LName], [Phone], [Email], [Address], [City], [State], [Zip]) VALUES (3, N'Jenny', N'Giby', N'(111)-111-1123', N'JGiby@email.com', N'9484', N'Sail', N'KS', N'98112')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [Phone], [Email], [EmpRole]) VALUES (1, N'Chris', N'Manlin', N'(111)-111-1111', N'CManlin@email.com', N'Manager')
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [Phone], [Email], [EmpRole]) VALUES (4, N'Tammy', N'Hu', N'(111)-111-1112', N'THu@email.com', N'Photographer')
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [Phone], [Email], [EmpRole]) VALUES (5, N'Corey', N'Bend', N'(111)-111-1113', N'CBend@email.com', N'Photographer')
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [Phone], [Email], [EmpRole]) VALUES (6, N'Mitchell', N'Grey', N'(111)-111-1114', N'MGrey@email.com', N'Photographer')
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [Phone], [Email], [EmpRole]) VALUES (7, N'Sam', N'Neir', N'(111)-111-1115', N'SNeir@email.com', N'Photographer')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [ApptId], [InvoiceDate], [DueDate]) VALUES (1, 1, CAST(N'2020-09-23T00:00:00' AS SmallDateTime), CAST(N'2020-09-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApptId], [InvoiceDate], [DueDate]) VALUES (2, 2, CAST(N'2020-11-04T00:00:00' AS SmallDateTime), CAST(N'2020-11-11T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[Portrait] ON 

INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (1, N'One-One', 10.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (2, N'Five-Four', 12.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (3, N'Four-Three', 14.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (5, N'Three-Two', 16.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (6, N'Five-Three', 18.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (7, N'Sixteen-Nine', 20.0000)
INSERT [dbo].[Portrait] ([PortraitId], [PortraitRatio], [PortraitCost]) VALUES (8, N'Three-One', 22.0000)
SET IDENTITY_INSERT [dbo].[Portrait] OFF
GO
SET IDENTITY_INSERT [dbo].[Reciept] ON 

INSERT [dbo].[Reciept] ([RecieptId], [InvoiceId], [InvocieDate], [DueDate], [Total]) VALUES (1, 1, CAST(N'2020-09-23T00:00:00' AS SmallDateTime), CAST(N'2020-09-30T00:00:00' AS SmallDateTime), 24.0000)
INSERT [dbo].[Reciept] ([RecieptId], [InvoiceId], [InvocieDate], [DueDate], [Total]) VALUES (2, 2, CAST(N'2020-11-04T00:00:00' AS SmallDateTime), CAST(N'2020-11-11T00:00:00' AS SmallDateTime), 38.0000)
SET IDENTITY_INSERT [dbo].[Reciept] OFF
GO
SET IDENTITY_INSERT [dbo].[Studio] ON 

INSERT [dbo].[Studio] ([StudioId], [SqrFt], [Address], [City], [State], [Zip]) VALUES (1, 1000, N'6546 Studio Lane', N'Windy', N'OK', N'54798')
INSERT [dbo].[Studio] ([StudioId], [SqrFt], [Address], [City], [State], [Zip]) VALUES (2, 2000, N'121 Record Ave', N'Sail', N'KS', N'98112')
SET IDENTITY_INSERT [dbo].[Studio] OFF
GO
USE [master]
GO
ALTER DATABASE [1714Project] SET  READ_WRITE 
GO
