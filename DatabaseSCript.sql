USE [master]
GO

/****** Object:  Database [HealthCareDatabase]    Script Date: 09/03/2020 11:09:07 ******/
CREATE DATABASE [HealthCareDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealthCareDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HealthCareDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealthCareDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HealthCareDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [HealthCareDatabase] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthCareDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [HealthCareDatabase] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET ARITHABORT OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [HealthCareDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [HealthCareDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET  DISABLE_BROKER 
GO

ALTER DATABASE [HealthCareDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [HealthCareDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [HealthCareDatabase] SET  MULTI_USER 
GO

ALTER DATABASE [HealthCareDatabase] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [HealthCareDatabase] SET DB_CHAINING OFF 
GO

ALTER DATABASE [HealthCareDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [HealthCareDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [HealthCareDatabase] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [HealthCareDatabase] SET QUERY_STORE = OFF
GO

ALTER DATABASE [HealthCareDatabase] SET  READ_WRITE 
GO


USE [HealthCareDatabase]
GO

/****** Object:  Table [dbo].[Patient]    Script Date: 09/03/2020 11:09:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [nvarchar](250) NOT NULL,
	[Address1] [nvarchar](250) NOT NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[Postcode] [nvarchar](250) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HealthCareDatabase]
GO

/****** Object:  Table [dbo].[PatientConsultation]    Script Date: 09/03/2020 11:09:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PatientConsultation](
	[ConsulatationId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[ConsultationDate] [datetime] NOT NULL,
	[PresentSymtoms] [nvarchar](1000) NULL,
	[AdviceGiven] [nvarchar](1000) NULL,
	[Medication] [nvarchar](250) NULL,
	[Comments] [nvarchar](1000) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_PatientConsultation] PRIMARY KEY CLUSTERED 
(
	[ConsulatationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PatientConsultation]  WITH CHECK ADD  CONSTRAINT [FK_PatientConsultation_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO

ALTER TABLE [dbo].[PatientConsultation] CHECK CONSTRAINT [FK_PatientConsultation_Patient]
GO


