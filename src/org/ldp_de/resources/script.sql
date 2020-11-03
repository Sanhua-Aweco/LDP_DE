USE [master]
GO
/****** Object:  Database [LDP_DE]    Script Date: 03.11.2020 14:29:34 ******/
CREATE DATABASE [LDP_DE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LDP_DE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LDP_DE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LDP_DE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LDP_DE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LDP_DE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LDP_DE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LDP_DE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LDP_DE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LDP_DE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LDP_DE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LDP_DE] SET ARITHABORT OFF 
GO
ALTER DATABASE [LDP_DE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LDP_DE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LDP_DE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LDP_DE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LDP_DE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LDP_DE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LDP_DE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LDP_DE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LDP_DE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LDP_DE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LDP_DE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LDP_DE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LDP_DE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LDP_DE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LDP_DE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LDP_DE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LDP_DE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LDP_DE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LDP_DE] SET  MULTI_USER 
GO
ALTER DATABASE [LDP_DE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LDP_DE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LDP_DE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LDP_DE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LDP_DE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LDP_DE] SET QUERY_STORE = OFF
GO
USE [LDP_DE]
GO
/****** Object:  Table [dbo].[Table_Temperatury]    Script Date: 03.11.2020 14:29:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Temperatury](
	[TemperaturyID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NOT NULL,
	[TemperaturaKanal_00] [float] NOT NULL,
	[TemperaturaKanal_01] [float] NOT NULL,
	[TemperaturaKanal_02] [float] NOT NULL,
	[TemperaturaKanal_03] [float] NOT NULL,
	[TemperaturaKanal_04] [float] NOT NULL,
	[TemperaturaKanal_05] [float] NOT NULL,
	[TemperaturaKanal_06] [float] NOT NULL,
	[TemperaturaKanal_07] [float] NOT NULL,
	[CzasZapisu] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_Temperatury] PRIMARY KEY CLUSTERED 
(
	[TemperaturyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Test]    Script Date: 03.11.2020 14:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Test](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[NumerTestera] [int] NOT NULL,
	[ModelGrzalki] [nvarchar](50) NOT NULL,
	[CzasRozpoczecia] [datetime] NOT NULL,
	[CzasZakonczenia] [datetime] NULL,
 CONSTRAINT [PK_Table_Test] PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_Temperatury]  WITH CHECK ADD  CONSTRAINT [FK_Table_Temperatury_Table_Test] FOREIGN KEY([TestID])
REFERENCES [dbo].[Table_Test] ([TestID])
GO
ALTER TABLE [dbo].[Table_Temperatury] CHECK CONSTRAINT [FK_Table_Temperatury_Table_Test]
GO
/****** Object:  StoredProcedure [dbo].[sp_testStart]    Script Date: 03.11.2020 14:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 03-11-2020
-- Description:	Nowy pomiar
-- =============================================
CREATE PROCEDURE [dbo].[sp_testStart] 
	-- Add the parameters for the stored procedure here
	@numerTestera int, 
	@modelGrzalki nvarchar(50),
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;

INSERT INTO Table_Test
                         (NumerTestera, ModelGrzalki, CzasRozpoczecia)
VALUES        (@numerTestera,@modelGrzalki,GETDATE())
COMMIT TRANSACTION
SELECT @result=SCOPE_IDENTITY()
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK
IF ERROR_NUMBER() = 2601 SET @result= -2
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_testTemperatury]    Script Date: 03.11.2020 14:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 03-11-2020
-- Description:	Zapis temperatur
-- =============================================
CREATE PROCEDURE [dbo].[sp_testTemperatury] 
	-- Add the parameters for the stored procedure here
	@testID int, 
	@TemperaturaKanal_00 float,
	@TemperaturaKanal_01 float,
	@TemperaturaKanal_02 float,
	@TemperaturaKanal_03 float,
	@TemperaturaKanal_04 float,
	@TemperaturaKanal_05 float,
	@TemperaturaKanal_06 float,
	@TemperaturaKanal_07 float,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;

INSERT INTO Table_Temperatury
                         (Table_Temperatury.TestID, 
						 Table_Temperatury.TemperaturaKanal_00,
						 Table_Temperatury.TemperaturaKanal_01,
						 Table_Temperatury.TemperaturaKanal_02,
						 Table_Temperatury.TemperaturaKanal_03,
						 Table_Temperatury.TemperaturaKanal_04,
						 Table_Temperatury.TemperaturaKanal_05,
						 Table_Temperatury.TemperaturaKanal_06,
						 Table_Temperatury.TemperaturaKanal_07,
						 Table_Temperatury.CzasZapisu)
VALUES        (@testID,@TemperaturaKanal_00,@TemperaturaKanal_01,@TemperaturaKanal_02,@TemperaturaKanal_03,@TemperaturaKanal_04,@TemperaturaKanal_05,@TemperaturaKanal_06,@TemperaturaKanal_07,GETDATE())
COMMIT TRANSACTION
SELECT @result=SCOPE_IDENTITY()
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK
IF ERROR_NUMBER() = 2601 SET @result= -2
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END
END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [LDP_DE] SET  READ_WRITE 
GO
