USE [MAGAZYN_MINI]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_pozycjaMagazynowa'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_pozycjaMagazynowa'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_linia'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_linia'
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieTrans]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieTrans]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemsRollback]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieItemsRollback]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemRemove]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieItemRemove]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieItemDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemAdd]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieItemAdd]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieHistory]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanieDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanie]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydanie]
GO
/****** Object:  StoredProcedure [dbo].[sp_wydania]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_wydania]
GO
/****** Object:  StoredProcedure [dbo].[sp_typy]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_typy]
GO
/****** Object:  StoredProcedure [dbo].[sp_typNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_typNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_typMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_typMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_typDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_typDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_typDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_typDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieTrans]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieTrans]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemsRollback]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieItemsRollback]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemRemove]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieItemRemove]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieItemDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemAdd]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieItemAdd]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieHistory]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecieDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecie]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecie]
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecia]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_przyjecia]
GO
/****** Object:  StoredProcedure [dbo].[sp_producentNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_producentNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_producentMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_producentMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_producentDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_producentDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_producentDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_producentDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_producenci]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_producenci]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweSkaner]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjeMagazynoweSkaner]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweLokalizacjaSkaner]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjeMagazynoweLokalizacjaSkaner]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweFind]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjeMagazynoweFind]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynowe]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjeMagazynowe]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaLabel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaLabel]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaHistory]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowaDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowa]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_pozycjaMagazynowa]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacje]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacje]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacjaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacjaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacjaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacjaDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacja]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_lokalizacja]
GO
/****** Object:  StoredProcedure [dbo].[sp_linie]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_linie]
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_liniaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_liniaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_liniaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_liniaDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_linia]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_linia]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategorie]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_kategorie]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_kategoriaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_kategoriaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_kategoriaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_kategoriaDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostki]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_jednostki]
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_jednostkaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_jednostkaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_jednostkaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_jednostkaDel]
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcy]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_dostawcy]
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaNew]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_dostawcaNew]
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaMod]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_dostawcaMod]
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaDetails]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_dostawcaDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaDel]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[sp_dostawcaDel]
GO
/****** Object:  StoredProcedure [dbo].[ProcedureName]    Script Date: 18.05.2020 22:22:03 ******/
DROP PROCEDURE [dbo].[ProcedureName]
GO
ALTER TABLE [dbo].[Table_WydanieTrans] DROP CONSTRAINT [FK_Table_Pobranie_Trans_Table_Pobranie]
GO
ALTER TABLE [dbo].[Table_WydanieTrans] DROP CONSTRAINT [FK_Table_Pobranie_Trans_Table_Magazyn]
GO
ALTER TABLE [dbo].[Table_Wydanie] DROP CONSTRAINT [FK_Table_Pobranie_Table_Linia]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] DROP CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Przyjecie]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] DROP CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Pozycja]
GO
ALTER TABLE [dbo].[Table_Przyjecie] DROP CONSTRAINT [FK_Table_Przyjecie_Table_Dostawca]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Typ]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Producent]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [FK_MAGAZYN_MIEJSCE]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [FK_MAGAZYN_JEDNOSTKA]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [FK_MAGAZYN_ASORTYMENT]
GO
ALTER TABLE [dbo].[Table_WydanieTrans] DROP CONSTRAINT [DF_Table_WydanieTrans_Deleted]
GO
ALTER TABLE [dbo].[Table_Wydanie] DROP CONSTRAINT [DF_Table_Pobranie_Deleted]
GO
ALTER TABLE [dbo].[Table_Wydanie] DROP CONSTRAINT [DF_Table_Pobranie_Trans_DataWpisu]
GO
ALTER TABLE [dbo].[Table_Typ] DROP CONSTRAINT [DF_Table_Typ_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Typ] DROP CONSTRAINT [DF_Table_Typ_Deleted]
GO
ALTER TABLE [dbo].[Table_RejestrTransakcji] DROP CONSTRAINT [DF_Table_RejestrTransakcji_Deleted]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] DROP CONSTRAINT [DF_Table_PrzyjecieTrans_Deleted]
GO
ALTER TABLE [dbo].[Table_Przyjecie] DROP CONSTRAINT [DF_PRZYJECIE_Deleted]
GO
ALTER TABLE [dbo].[Table_Przyjecie] DROP CONSTRAINT [DF_PRZYJECIE_DataPrzyjecia]
GO
ALTER TABLE [dbo].[Table_Producent] DROP CONSTRAINT [DF_Table_Producent_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Producent] DROP CONSTRAINT [DF_DOSTAWCA_Deleted]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [DF_Table_PozycjaMagazynowa_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] DROP CONSTRAINT [DF_MAGAZYN_Deleted]
GO
ALTER TABLE [dbo].[Table_Lokalizacja] DROP CONSTRAINT [DF_Table_Lokalizacja_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Lokalizacja] DROP CONSTRAINT [DF_MIEJSCE_Deleted]
GO
ALTER TABLE [dbo].[Table_Linia] DROP CONSTRAINT [DF_Table_Linia_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Linia] DROP CONSTRAINT [DF_Table_Linia_Deleted]
GO
ALTER TABLE [dbo].[Table_Kategoria] DROP CONSTRAINT [DF_Table_Kategoria_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Kategoria] DROP CONSTRAINT [DF_ASORTYMENT_Deleted]
GO
ALTER TABLE [dbo].[Table_Jednostka] DROP CONSTRAINT [DF_Table_Jednostka_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Jednostka] DROP CONSTRAINT [DF_JEDNOSTKA_Deleted]
GO
ALTER TABLE [dbo].[Table_Dostawca] DROP CONSTRAINT [DF_Table_Dostawca_DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Dostawca] DROP CONSTRAINT [DF_Table_Dostawca_Deleted]
GO
/****** Object:  Index [IX_Table_Typ]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Typ] ON [dbo].[Table_Typ]
GO
/****** Object:  Index [IX_Table_Producent]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Producent] ON [dbo].[Table_Producent]
GO
/****** Object:  Index [IX_Table_Magazyn]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Magazyn] ON [dbo].[Table_PozycjaMagazynowa]
GO
/****** Object:  Index [IX_Table_Lokalizacja]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Lokalizacja] ON [dbo].[Table_Lokalizacja]
GO
/****** Object:  Index [IX_Table_Linia]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Linia] ON [dbo].[Table_Linia]
GO
/****** Object:  Index [IX_Table_Kategoria]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Kategoria] ON [dbo].[Table_Kategoria]
GO
/****** Object:  Index [IX_Table_Jednostka]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Jednostka] ON [dbo].[Table_Jednostka]
GO
/****** Object:  Index [IX_Table_Dostawca]    Script Date: 18.05.2020 22:22:03 ******/
DROP INDEX [IX_Table_Dostawca] ON [dbo].[Table_Dostawca]
GO
/****** Object:  Table [dbo].[Table_WydanieTrans]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_WydanieTrans]
GO
/****** Object:  Table [dbo].[Table_WydanieItem]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_WydanieItem]
GO
/****** Object:  Table [dbo].[Table_Wydanie]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Wydanie]
GO
/****** Object:  Table [dbo].[Table_RejestrTransakcji]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_RejestrTransakcji]
GO
/****** Object:  Table [dbo].[Table_PrzyjecieTrans]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_PrzyjecieTrans]
GO
/****** Object:  Table [dbo].[Table_PrzyjecieItem]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_PrzyjecieItem]
GO
/****** Object:  Table [dbo].[Table_Przyjecie]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Przyjecie]
GO
/****** Object:  Table [dbo].[Table_Lokalizacja]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Lokalizacja]
GO
/****** Object:  Table [dbo].[Table_Jednostka]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Jednostka]
GO
/****** Object:  Table [dbo].[Table_Dostawca]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Dostawca]
GO
/****** Object:  View [dbo].[View_pozycjaMagazynowa]    Script Date: 18.05.2020 22:22:03 ******/
DROP VIEW [dbo].[View_pozycjaMagazynowa]
GO
/****** Object:  Table [dbo].[Table_Typ]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Typ]
GO
/****** Object:  Table [dbo].[Table_Producent]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Producent]
GO
/****** Object:  Table [dbo].[Table_PozycjaMagazynowa]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_PozycjaMagazynowa]
GO
/****** Object:  Table [dbo].[Table_Kategoria]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Kategoria]
GO
/****** Object:  View [dbo].[View_linia]    Script Date: 18.05.2020 22:22:03 ******/
DROP VIEW [dbo].[View_linia]
GO
/****** Object:  Table [dbo].[Table_Linia]    Script Date: 18.05.2020 22:22:03 ******/
DROP TABLE [dbo].[Table_Linia]
GO
USE [master]
GO
/****** Object:  Database [MAGAZYN_MINI]    Script Date: 18.05.2020 22:22:03 ******/
DROP DATABASE [MAGAZYN_MINI]
GO
/****** Object:  Database [MAGAZYN_MINI]    Script Date: 18.05.2020 22:22:03 ******/
CREATE DATABASE [MAGAZYN_MINI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MAGAZYN_MINI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MAGAZYN_MINI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MAGAZYN_MINI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MAGAZYN_MINI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MAGAZYN_MINI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MAGAZYN_MINI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MAGAZYN_MINI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET ARITHABORT OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MAGAZYN_MINI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MAGAZYN_MINI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MAGAZYN_MINI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MAGAZYN_MINI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MAGAZYN_MINI] SET  MULTI_USER 
GO
ALTER DATABASE [MAGAZYN_MINI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MAGAZYN_MINI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MAGAZYN_MINI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MAGAZYN_MINI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MAGAZYN_MINI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MAGAZYN_MINI] SET QUERY_STORE = OFF
GO
USE [MAGAZYN_MINI]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MAGAZYN_MINI]
GO
/****** Object:  Table [dbo].[Table_Linia]    Script Date: 18.05.2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Linia](
	[Linia_ID] [int] IDENTITY(1,1) NOT NULL,
	[Linia] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_Linia] PRIMARY KEY CLUSTERED 
(
	[Linia_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_linia]    Script Date: 18.05.2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_linia]
AS
SELECT        Linia_ID, Linia, Opis, Uwagi
FROM            dbo.Table_Linia
GO
/****** Object:  Table [dbo].[Table_Kategoria]    Script Date: 18.05.2020 22:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Kategoria](
	[Kategoria_ID] [int] IDENTITY(1,1) NOT NULL,
	[Kategoria] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_ASORTYMENT] PRIMARY KEY CLUSTERED 
(
	[Kategoria_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_PozycjaMagazynowa]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_PozycjaMagazynowa](
	[PozycjaMagazynowa_ID] [int] IDENTITY(1,1) NOT NULL,
	[Kategoria_ID] [int] NOT NULL,
	[Producent_ID] [int] NOT NULL,
	[Typ_ID] [int] NOT NULL,
	[NumerSystemowySSA] [int] NULL,
	[Jednostka_ID] [int] NOT NULL,
	[Lokalizacja_ID] [int] NOT NULL,
	[Stan] [int] NOT NULL,
	[StanMinimalny] [int] NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_MAGAZYN] PRIMARY KEY CLUSTERED 
(
	[PozycjaMagazynowa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Producent]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Producent](
	[Producent_ID] [int] IDENTITY(1,1) NOT NULL,
	[Producent] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](250) NOT NULL,
	[DaneKontaktowe] [nvarchar](250) NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_Producent] PRIMARY KEY CLUSTERED 
(
	[Producent_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Typ]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Typ](
	[Typ_ID] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_Typ] PRIMARY KEY CLUSTERED 
(
	[Typ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_pozycjaMagazynowa]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_pozycjaMagazynowa]
AS
SELECT        dbo.Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, dbo.Table_Kategoria.Kategoria + N' ' + dbo.Table_Typ.Typ + N' ' + dbo.Table_Producent.Producent AS PozycjaMagazynowa
FROM            dbo.Table_PozycjaMagazynowa INNER JOIN
                         dbo.Table_Kategoria ON dbo.Table_PozycjaMagazynowa.Kategoria_ID = dbo.Table_Kategoria.Kategoria_ID INNER JOIN
                         dbo.Table_Typ ON dbo.Table_PozycjaMagazynowa.Typ_ID = dbo.Table_Typ.Typ_ID INNER JOIN
                         dbo.Table_Producent ON dbo.Table_PozycjaMagazynowa.Producent_ID = dbo.Table_Producent.Producent_ID
GO
/****** Object:  Table [dbo].[Table_Dostawca]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Dostawca](
	[Dostawca_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dostawca] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](250) NOT NULL,
	[DaneKontaktowe] [nvarchar](250) NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NULL,
 CONSTRAINT [PK_Table_Dostawca] PRIMARY KEY CLUSTERED 
(
	[Dostawca_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Jednostka]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Jednostka](
	[Jednostka_ID] [int] IDENTITY(1,1) NOT NULL,
	[Jednostka] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_JEDNOSTKA] PRIMARY KEY CLUSTERED 
(
	[Jednostka_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Lokalizacja]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Lokalizacja](
	[Lokalizacja_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lokalizacja] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
	[DataModyfikacji] [datetime] NOT NULL,
 CONSTRAINT [PK_MIEJSCE] PRIMARY KEY CLUSTERED 
(
	[Lokalizacja_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Przyjecie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Przyjecie](
	[Przyjecie_ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Dostawca_ID] [int] NOT NULL,
	[Faktura] [nvarchar](250) NOT NULL,
	[DataPrzyjecia] [datetime] NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
 CONSTRAINT [PK_PRZYJECIE] PRIMARY KEY CLUSTERED 
(
	[Przyjecie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_PrzyjecieItem]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_PrzyjecieItem](
	[PrzyjecieItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[PozycjaMagazynowa_ID] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
 CONSTRAINT [PK_Table_PrzyjecieItem] PRIMARY KEY CLUSTERED 
(
	[PrzyjecieItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_PrzyjecieTrans]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_PrzyjecieTrans](
	[PrzyjecieTrans_ID] [int] IDENTITY(1,1) NOT NULL,
	[Przyjecie_ID] [int] NOT NULL,
	[PozycjaMagazynowa_ID] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_PrzyjecieTrans] PRIMARY KEY CLUSTERED 
(
	[PrzyjecieTrans_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_RejestrTransakcji]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_RejestrTransakcji](
	[RejestrTransakcji_ID] [int] IDENTITY(1,1) NOT NULL,
	[UUIDTransakcji] [uniqueidentifier] NOT NULL,
	[DataTransakcji] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Table_RejestrTransakcji] PRIMARY KEY CLUSTERED 
(
	[RejestrTransakcji_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Wydanie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Wydanie](
	[Wydanie_ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Linia_ID] [int] NOT NULL,
	[DataWydania] [datetime] NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[Uwagi] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_Pobranie_Trans] PRIMARY KEY CLUSTERED 
(
	[Wydanie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_WydanieItem]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_WydanieItem](
	[WydanieItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[PozycjaMagazynowa_ID] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
 CONSTRAINT [PK_Table_WydanieItem] PRIMARY KEY CLUSTERED 
(
	[WydanieItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_WydanieTrans]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_WydanieTrans](
	[WydanieTrans_ID] [int] IDENTITY(1,1) NOT NULL,
	[Wydanie_ID] [int] NOT NULL,
	[PozycjaMagazynowa_ID] [int] NOT NULL,
	[Ilosc] [int] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NULL,
	[DataUsuniecia] [datetime] NULL,
	[Uzytkownik] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_WydanieTrans] PRIMARY KEY CLUSTERED 
(
	[WydanieTrans_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Table_Dostawca] ON 

INSERT [dbo].[Table_Dostawca] ([Dostawca_ID], [Dostawca], [Adres], [DaneKontaktowe], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (19, N'PRODNARZ', N'PRODNARZ 
ul. Przemysłowa 19 
34-120 Andrychów', N'Leszek Janosz 
Kierownik Zespołu 
Sprzedaży i Zaopatrzenia 
tel. 33 8753766 
kom. 606 857 556 ', N'Zakład narzędziowy. 
Obróbka skrawaniem, cięcie laserem.', N'Pokrywanie TiN sonotrod.', 0, CAST(N'2020-02-14T20:26:13.247' AS DateTime), N'User', CAST(N'2020-02-14T21:15:17.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Dostawca] OFF
SET IDENTITY_INSERT [dbo].[Table_Jednostka] ON 

INSERT [dbo].[Table_Jednostka] ([Jednostka_ID], [Jednostka], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1, N'szt.', N'opis', N'uwagi', 0, NULL, N'User', CAST(N'2020-02-14T21:52:40.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Jednostka] OFF
SET IDENTITY_INSERT [dbo].[Table_Kategoria] ON 

INSERT [dbo].[Table_Kategoria] ([Kategoria_ID], [Kategoria], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1, N'Czujnik indukcyjny', N'Opis', N'Uwagi', 0, NULL, N'user', CAST(N'2020-02-16T20:32:56.970' AS DateTime))
INSERT [dbo].[Table_Kategoria] ([Kategoria_ID], [Kategoria], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (2, N'Czujnik pojemnościowy', N'', N'', 0, NULL, N'User', CAST(N'2020-02-14T23:27:29.867' AS DateTime))
INSERT [dbo].[Table_Kategoria] ([Kategoria_ID], [Kategoria], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (3, N'Czujnik laserowy', N'', N'', 1, CAST(N'2020-02-16T20:41:58.590' AS DateTime), N'user', CAST(N'2020-02-16T20:41:58.590' AS DateTime))
INSERT [dbo].[Table_Kategoria] ([Kategoria_ID], [Kategoria], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1024, N'Czujnik foto-optyczny', N'', N'', 1, CAST(N'2020-02-16T20:42:11.807' AS DateTime), N'User', CAST(N'2020-02-22T12:24:51.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Kategoria] OFF
SET IDENTITY_INSERT [dbo].[Table_Linia] ON 

INSERT [dbo].[Table_Linia] ([Linia_ID], [Linia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1, N'MB72', N'Miele przepływomierz GH2002', NULL, 0, NULL, N'User', CAST(N'2019-12-10T10:16:46.640' AS DateTime))
INSERT [dbo].[Table_Linia] ([Linia_ID], [Linia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (3, N'NMO640/1', N'Bosch zmiękczacz', NULL, 0, NULL, N'User', CAST(N'2020-02-15T22:37:04.980' AS DateTime))
INSERT [dbo].[Table_Linia] ([Linia_ID], [Linia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (4, N'MB71', N'Miele przepływomierz GH6000', NULL, 0, NULL, N'User', CAST(N'2020-02-15T22:37:33.983' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Linia] OFF
SET IDENTITY_INSERT [dbo].[Table_Lokalizacja] ON 

INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1, N'S01-AA', N'Szafka magazynowa 1', N'Uwaga', 0, NULL, N'User', CAST(N'2020-02-15T22:46:56.580' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (2, N'S04-BA', N'Szafa magazynowa nr 4', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:46:42.810' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (4, N'S01-AB', N'Szafa magazynowa nr 1', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:48:03.680' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (6, N'S01-AC', N'Szafa magazynowa nr 1', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:48:03.680' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (7, N'S01-AD', N'Szafa magazynowa nr 1', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:48:03.680' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (8, N'S01-AE', N'Szafa magazynowa nr 1', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:48:03.680' AS DateTime))
INSERT [dbo].[Table_Lokalizacja] ([Lokalizacja_ID], [Lokalizacja], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (9, N'S01-AF', N'Szafa magazynowa nr 1', N'', 0, NULL, N'User', CAST(N'2020-02-15T22:48:03.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Lokalizacja] OFF
SET IDENTITY_INSERT [dbo].[Table_PozycjaMagazynowa] ON 

INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (3, 1, 4, 2, 123456789, 1, 9, 34, 3, N'Czujnik', N'', 0, NULL, N'aleksander.lipiec', CAST(N'2020-02-17T08:55:40.980' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (4, 2, 4, 1, 987654321, 1, 9, 0, 3, N'Czujnik', N'', 0, NULL, N'aleksander.lipiec', CAST(N'2020-02-17T08:55:36.207' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (9, 1, 4, 3, NULL, 1, 9, 0, 3, N'Czujnik', NULL, 0, NULL, N'user', CAST(N'2020-03-03T19:23:51.363' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (10, 2, 4, 4, NULL, 1, 9, 0, 3, N'Czujnik', NULL, 0, NULL, N'user', CAST(N'2020-03-03T19:27:54.583' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (11, 2, 4, 5, NULL, 1, 1, 0, 3, N'czujnik', NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:32:23.603' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (12, 1, 4, 6, NULL, 1, 1, 0, 3, N'Czujniiik', NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:34:54.820' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (13, 2, 4, 7, NULL, 1, 1, 55, 3, N'ddd', NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:38:26.413' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (14, 1, 4, 8, NULL, 1, 9, 0, 3, N'fghdf', NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:42:07.300' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (15, 2, 4, 9, NULL, 1, 9, 0, 3, N'sdfgh', NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:43:58.430' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (23, 1, 4, 10, 0, 1, 1, 0, 5, N'OPIS', NULL, 0, NULL, N'USER', CAST(N'2020-03-03T20:19:50.113' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (24, 1, 4, 11, 666, 1, 9, 22, 6, N'DFGHSDFG', N'SDFGSDGF', 0, NULL, N'User', CAST(N'2020-03-03T20:40:50.743' AS DateTime))
INSERT [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID], [Kategoria_ID], [Producent_ID], [Typ_ID], [NumerSystemowySSA], [Jednostka_ID], [Lokalizacja_ID], [Stan], [StanMinimalny], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (25, 1, 4, 12, 0, 1, 1, 0, 1, N'KL;J', N'', 0, NULL, N'User', CAST(N'2020-03-03T20:44:54.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_PozycjaMagazynowa] OFF
SET IDENTITY_INSERT [dbo].[Table_Producent] ON 

INSERT [dbo].[Table_Producent] ([Producent_ID], [Producent], [Adres], [DaneKontaktowe], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (4, N'BALLUFF', N'Balluff Sp. z o.o.
 
Ul. Graniczna 21A
 
54-516 Wrocław', N'balluff@balluff.pl
 
Tel.: +48 71 382 09 00
 
Fax. +48 71 338 49 30', N'Czujniki elektroniczne i mechaniczne.
Obrotowe i liniowe przetworniki położenia.
Systemy identyfikacyjne.
Oraz bogata oferta z zakresu technologii sieci i połączeń wysokiej jakości do wydajnej komunikacji przemysłowej.', N'', 0, NULL, N'User', CAST(N'2019-12-10T10:10:34.977' AS DateTime))
INSERT [dbo].[Table_Producent] ([Producent_ID], [Producent], [Adres], [DaneKontaktowe], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (5, N'BALLUFF1', N'1', N'1', N'1', N'1', 1, CAST(N'2020-02-22T12:53:21.443' AS DateTime), N'User', CAST(N'2020-02-22T12:31:09.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Producent] OFF
SET IDENTITY_INSERT [dbo].[Table_Przyjecie] ON 

INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (54, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', 19, N'FV01/20202', CAST(N'2020-02-21T23:16:40.917' AS DateTime), N'Opis', N'Uwagi', 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (55, N'6ca3a3e6-4eee-4fd8-b627-85a7b02c2ba1', 19, N'FV02/2020', CAST(N'2020-02-21T23:17:50.597' AS DateTime), N'Opis', N'Uwagi', 1, CAST(N'2020-02-21T23:19:58.980' AS DateTime), N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (56, N'a72a5936-f6bb-47db-8f2f-a274e41a4644', 19, N'FV03/2020', CAST(N'2020-02-21T23:21:49.567' AS DateTime), N'Opis', N'Uwagi', 1, CAST(N'2020-02-21T23:55:04.757' AS DateTime), N'user')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (57, N'1c4df6fd-caf5-422e-87da-68b29a4a782a', 19, N'FV04/2020', CAST(N'2020-02-21T23:41:25.440' AS DateTime), N'OPIS', N'dfsadf', 1, CAST(N'2020-02-21T23:43:23.927' AS DateTime), N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (58, N'84f4ff68-c4f8-4ed7-b0c2-c84539becc4e', 19, N'qqq', CAST(N'2020-02-21T23:55:56.293' AS DateTime), N'qqq', N'qqq', 1, CAST(N'2020-02-22T00:09:37.813' AS DateTime), N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (59, N'4244220e-0fe0-4116-a532-b6e10bb4b3ac', 19, N'DDD', CAST(N'2020-03-03T20:09:00.280' AS DateTime), N'111', N'', 0, NULL, N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (60, N'db0585f1-73d3-43cc-9a7e-cc49a3ec6fdd', 19, N'GFG', CAST(N'2020-03-03T20:43:03.557' AS DateTime), N'TTTT', N'TTTT', 0, NULL, N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1059, N'c2e6f076-34b6-499f-be4b-2f7b6e175cea', 19, N'FV 689/2020', CAST(N'2020-05-01T22:12:50.530' AS DateTime), N'Zamówienie nr 567/123', N'', 0, NULL, N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1060, N'3cd09b8d-76c8-47af-9f81-c8d4824c440b', 19, N'FV002/05/2020', CAST(N'2020-05-17T19:25:35.053' AS DateTime), N'Przyjęcie', N'', 0, NULL, N'User')
INSERT [dbo].[Table_Przyjecie] ([Przyjecie_ID], [UUID], [Dostawca_ID], [Faktura], [DataPrzyjecia], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1061, N'bf71eca3-b209-4bb7-b86c-f97bb6bf1717', 19, N'FV003/05/2020', CAST(N'2020-05-17T19:29:06.720' AS DateTime), N'PRZYJECIE', N'', 0, NULL, N'User')
SET IDENTITY_INSERT [dbo].[Table_Przyjecie] OFF
SET IDENTITY_INSERT [dbo].[Table_PrzyjecieTrans] ON 

INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (16, 54, 3, 10, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (17, 54, 3, 10, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (18, 54, 4, 20, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (19, 54, 4, 20, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (20, 55, 3, 100, N'6ca3a3e6-4eee-4fd8-b627-85a7b02c2ba1', 1, CAST(N'2020-02-21T23:19:58.980' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (21, 55, 4, 100, N'6ca3a3e6-4eee-4fd8-b627-85a7b02c2ba1', 1, CAST(N'2020-02-21T23:19:58.980' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (22, 56, 3, 50, N'a72a5936-f6bb-47db-8f2f-a274e41a4644', 1, CAST(N'2020-02-21T23:55:04.757' AS DateTime), N'user')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (23, 57, 3, 1258, N'1c4df6fd-caf5-422e-87da-68b29a4a782a', 1, CAST(N'2020-02-21T23:43:23.927' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (24, 57, 4, 1234, N'1c4df6fd-caf5-422e-87da-68b29a4a782a', 1, CAST(N'2020-02-21T23:43:23.927' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (25, 58, 3, 100, N'84f4ff68-c4f8-4ed7-b0c2-c84539becc4e', 1, CAST(N'2020-02-22T00:09:37.813' AS DateTime), N'User')
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (26, 59, 11, 1, N'4244220e-0fe0-4116-a532-b6e10bb4b3ac', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (27, 59, 11, 1, N'4244220e-0fe0-4116-a532-b6e10bb4b3ac', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (28, 60, 24, 10, N'db0585f1-73d3-43cc-9a7e-cc49a3ec6fdd', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (29, 60, 24, 12, N'db0585f1-73d3-43cc-9a7e-cc49a3ec6fdd', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (30, 60, 13, 55, N'db0585f1-73d3-43cc-9a7e-cc49a3ec6fdd', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1026, 1059, 3, 1, N'c2e6f076-34b6-499f-be4b-2f7b6e175cea', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1027, 1059, 3, 1, N'c2e6f076-34b6-499f-be4b-2f7b6e175cea', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1028, 1060, 3, 13, N'3cd09b8d-76c8-47af-9f81-c8d4824c440b', 0, NULL, NULL)
INSERT [dbo].[Table_PrzyjecieTrans] ([PrzyjecieTrans_ID], [Przyjecie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1029, 1061, 3, 34, N'bf71eca3-b209-4bb7-b86c-f97bb6bf1717', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Table_PrzyjecieTrans] OFF
SET IDENTITY_INSERT [dbo].[Table_RejestrTransakcji] ON 

INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (53, N'ef7c3f9c-377d-4d32-8eaa-53d845d296f4', CAST(N'2020-02-21T23:16:40.917' AS DateTime), 1, CAST(N'2020-02-21T23:17:00.113' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (54, N'6ca3a3e6-4eee-4fd8-b627-85a7b02c2ba1', CAST(N'2020-02-21T23:17:50.597' AS DateTime), 1, CAST(N'2020-02-21T23:19:58.980' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (55, N'a6800928-7ec5-4af1-b1ca-19f0034a7543', CAST(N'2020-02-21T23:18:26.950' AS DateTime), 1, CAST(N'2020-02-21T23:19:39.163' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (56, N'31b0d286-8b25-47eb-901f-37a9cfcaf962', CAST(N'2020-02-21T23:19:02.440' AS DateTime), 1, CAST(N'2020-02-21T23:19:26.950' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (57, N'a72a5936-f6bb-47db-8f2f-a274e41a4644', CAST(N'2020-02-21T23:21:49.570' AS DateTime), 1, CAST(N'2020-02-21T23:55:04.757' AS DateTime), N'user')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (58, N'1c4df6fd-caf5-422e-87da-68b29a4a782a', CAST(N'2020-02-21T23:41:25.440' AS DateTime), 1, CAST(N'2020-02-21T23:43:23.927' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (59, N'803cdb77-f750-4524-9938-291e44b4a564', CAST(N'2020-02-21T23:42:03.940' AS DateTime), 1, CAST(N'2020-02-21T23:43:07.770' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (60, N'84f4ff68-c4f8-4ed7-b0c2-c84539becc4e', CAST(N'2020-02-21T23:55:56.293' AS DateTime), 1, CAST(N'2020-02-22T00:09:37.813' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (61, N'17af7ba7-dc36-44ab-8e53-897b38448420', CAST(N'2020-02-21T23:56:20.593' AS DateTime), 1, CAST(N'2020-02-21T23:56:39.400' AS DateTime), N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (62, N'4244220e-0fe0-4116-a532-b6e10bb4b3ac', CAST(N'2020-03-03T20:09:00.280' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (63, N'db0585f1-73d3-43cc-9a7e-cc49a3ec6fdd', CAST(N'2020-03-03T20:43:03.557' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (64, N'4387f1e6-f4e7-4bba-87b3-99787e51dba8', CAST(N'2020-03-03T20:45:39.757' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1062, N'c2e6f076-34b6-499f-be4b-2f7b6e175cea', CAST(N'2020-05-01T22:12:50.530' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1063, N'3cd09b8d-76c8-47af-9f81-c8d4824c440b', CAST(N'2020-05-17T19:25:35.057' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1064, N'bf71eca3-b209-4bb7-b86c-f97bb6bf1717', CAST(N'2020-05-17T19:29:06.720' AS DateTime), 0, NULL, N'User')
INSERT [dbo].[Table_RejestrTransakcji] ([RejestrTransakcji_ID], [UUIDTransakcji], [DataTransakcji], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (1065, N'3213c95b-902e-46c0-8bbe-24d0c0f53809', CAST(N'2020-05-17T19:37:06.053' AS DateTime), 0, NULL, N'User')
SET IDENTITY_INSERT [dbo].[Table_RejestrTransakcji] OFF
SET IDENTITY_INSERT [dbo].[Table_Typ] ON 

INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (1, N'BES 515-325-S4-C', N'Wymiary
Ø 12 x 70 mm
Seria
M12x1
Montaż
montaż równo z powierzchnią
Zasięg
2 mm
Wyjście przełączające
PNP, styk zwierny (NO)
Częstotliwość przełączania
3000 Hz
Materiał obudowy
Stal nierdzewna (1.4305)
Materiał powierzchni aktywnej
PA ', NULL, 0, NULL, N'User', CAST(N'2020-02-14T23:31:43.230' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (2, N'BES 516-212-E5-E-S21', N'Wymiary
Ø 18 x 70.5 mm
Seria
M18x1
Montaż
montaż równo z powierzchnią
Zasięg
5 mm
Wyjście przełączające
Normalnie zamknięty (NC)
Częstotliwość przełączania
400 Hz
Materiał obudowy
Mosiądz
Ochrona powierzchni
niklowane
Materiał powierz', NULL, 0, NULL, N'User', CAST(N'2019-12-10T10:16:46.640' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (3, N'adsfasdf', N'', N'', 0, NULL, N'User', CAST(N'2020-03-03T18:59:07.233' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (4, N'nowy typ', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:27:03.277' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (5, N'starytyp', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:31:46.273' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (6, N'blank stary typ', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:34:23.637' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (7, N'cvbfbf', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:38:01.753' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (8, N'NULfghdfghdfgL', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:41:32.960' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (9, N'vcbnfgndfghdf', NULL, NULL, 0, NULL, NULL, CAST(N'2020-03-03T19:43:40.547' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (10, N'TUUUUUU', N'', N'', 0, NULL, N'User', CAST(N'2020-03-03T20:10:47.873' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (11, N'ERTEWRT', N'', N'', 0, NULL, N'User', CAST(N'2020-03-03T20:40:01.633' AS DateTime))
INSERT [dbo].[Table_Typ] ([Typ_ID], [Typ], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik], [DataModyfikacji]) VALUES (12, N'LJ;KJL;', N'', N'', 0, NULL, N'User', CAST(N'2020-03-03T20:44:36.087' AS DateTime))
SET IDENTITY_INSERT [dbo].[Table_Typ] OFF
SET IDENTITY_INSERT [dbo].[Table_Wydanie] ON 

INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (28, N'a6800928-7ec5-4af1-b1ca-19f0034a7543', 4, CAST(N'2020-02-21T23:18:26.950' AS DateTime), N'Opis', N'Uwagi', 1, CAST(N'2020-02-21T23:19:39.163' AS DateTime), N'User')
INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (29, N'31b0d286-8b25-47eb-901f-37a9cfcaf962', 4, CAST(N'2020-02-21T23:19:02.437' AS DateTime), N'Opis', N'Uwagi', 1, CAST(N'2020-02-21T23:19:26.950' AS DateTime), N'User')
INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (30, N'803cdb77-f750-4524-9938-291e44b4a564', 4, CAST(N'2020-02-21T23:42:03.940' AS DateTime), N'gfh', N'fgdh', 1, CAST(N'2020-02-21T23:43:07.770' AS DateTime), N'User')
INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (31, N'17af7ba7-dc36-44ab-8e53-897b38448420', 1, CAST(N'2020-02-21T23:56:20.593' AS DateTime), N'qqq', N'qqq', 1, CAST(N'2020-02-21T23:56:39.400' AS DateTime), N'User')
INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (32, N'4387f1e6-f4e7-4bba-87b3-99787e51dba8', 4, CAST(N'2020-03-03T20:45:39.757' AS DateTime), N'GJHF', N'', 0, NULL, N'User')
INSERT [dbo].[Table_Wydanie] ([Wydanie_ID], [UUID], [Linia_ID], [DataWydania], [Opis], [Uwagi], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (34, N'3213c95b-902e-46c0-8bbe-24d0c0f53809', 4, CAST(N'2020-05-17T19:37:06.053' AS DateTime), N'gfh', N'', 0, NULL, N'User')
SET IDENTITY_INSERT [dbo].[Table_Wydanie] OFF
SET IDENTITY_INSERT [dbo].[Table_WydanieTrans] ON 

INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (28, 28, 3, 10, N'a6800928-7ec5-4af1-b1ca-19f0034a7543', 1, CAST(N'2020-02-21T23:19:39.163' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (29, 28, 4, 10, N'a6800928-7ec5-4af1-b1ca-19f0034a7543', 1, CAST(N'2020-02-21T23:19:39.163' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (30, 29, 3, 50, N'31b0d286-8b25-47eb-901f-37a9cfcaf962', 1, CAST(N'2020-02-21T23:19:26.950' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (31, 29, 4, 50, N'31b0d286-8b25-47eb-901f-37a9cfcaf962', 1, CAST(N'2020-02-21T23:19:26.950' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (32, 30, 3, 258, N'803cdb77-f750-4524-9938-291e44b4a564', 1, CAST(N'2020-02-21T23:43:07.770' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (33, 30, 4, 563, N'803cdb77-f750-4524-9938-291e44b4a564', 1, CAST(N'2020-02-21T23:43:07.770' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (34, 31, 3, 80, N'17af7ba7-dc36-44ab-8e53-897b38448420', 1, CAST(N'2020-02-21T23:56:39.400' AS DateTime), N'User')
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (35, 32, 11, 2, N'4387f1e6-f4e7-4bba-87b3-99787e51dba8', 0, NULL, NULL)
INSERT [dbo].[Table_WydanieTrans] ([WydanieTrans_ID], [Wydanie_ID], [PozycjaMagazynowa_ID], [Ilosc], [UUID], [Deleted], [DataUsuniecia], [Uzytkownik]) VALUES (37, 34, 3, 15, N'3213c95b-902e-46c0-8bbe-24d0c0f53809', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Table_WydanieTrans] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Dostawca]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Dostawca] ON [dbo].[Table_Dostawca]
(
	[Dostawca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Jednostka]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Jednostka] ON [dbo].[Table_Jednostka]
(
	[Jednostka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Kategoria]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Kategoria] ON [dbo].[Table_Kategoria]
(
	[Kategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Linia]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Linia] ON [dbo].[Table_Linia]
(
	[Linia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Lokalizacja]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Lokalizacja] ON [dbo].[Table_Lokalizacja]
(
	[Lokalizacja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Table_Magazyn]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Magazyn] ON [dbo].[Table_PozycjaMagazynowa]
(
	[PozycjaMagazynowa_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Producent]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Producent] ON [dbo].[Table_Producent]
(
	[Producent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Table_Typ]    Script Date: 18.05.2020 22:22:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Table_Typ] ON [dbo].[Table_Typ]
(
	[Typ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_Dostawca] ADD  CONSTRAINT [DF_Table_Dostawca_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Dostawca] ADD  CONSTRAINT [DF_Table_Dostawca_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Jednostka] ADD  CONSTRAINT [DF_JEDNOSTKA_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Jednostka] ADD  CONSTRAINT [DF_Table_Jednostka_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Kategoria] ADD  CONSTRAINT [DF_ASORTYMENT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Kategoria] ADD  CONSTRAINT [DF_Table_Kategoria_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Linia] ADD  CONSTRAINT [DF_Table_Linia_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Linia] ADD  CONSTRAINT [DF_Table_Linia_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Lokalizacja] ADD  CONSTRAINT [DF_MIEJSCE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Lokalizacja] ADD  CONSTRAINT [DF_Table_Lokalizacja_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] ADD  CONSTRAINT [DF_MAGAZYN_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] ADD  CONSTRAINT [DF_Table_PozycjaMagazynowa_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Producent] ADD  CONSTRAINT [DF_DOSTAWCA_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Producent] ADD  CONSTRAINT [DF_Table_Producent_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Przyjecie] ADD  CONSTRAINT [DF_PRZYJECIE_DataPrzyjecia]  DEFAULT (getdate()) FOR [DataPrzyjecia]
GO
ALTER TABLE [dbo].[Table_Przyjecie] ADD  CONSTRAINT [DF_PRZYJECIE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] ADD  CONSTRAINT [DF_Table_PrzyjecieTrans_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_RejestrTransakcji] ADD  CONSTRAINT [DF_Table_RejestrTransakcji_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Typ] ADD  CONSTRAINT [DF_Table_Typ_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_Typ] ADD  CONSTRAINT [DF_Table_Typ_DataModyfikacji]  DEFAULT (getdate()) FOR [DataModyfikacji]
GO
ALTER TABLE [dbo].[Table_Wydanie] ADD  CONSTRAINT [DF_Table_Pobranie_Trans_DataWpisu]  DEFAULT (getdate()) FOR [DataWydania]
GO
ALTER TABLE [dbo].[Table_Wydanie] ADD  CONSTRAINT [DF_Table_Pobranie_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_WydanieTrans] ADD  CONSTRAINT [DF_Table_WydanieTrans_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa]  WITH CHECK ADD  CONSTRAINT [FK_MAGAZYN_ASORTYMENT] FOREIGN KEY([Kategoria_ID])
REFERENCES [dbo].[Table_Kategoria] ([Kategoria_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] CHECK CONSTRAINT [FK_MAGAZYN_ASORTYMENT]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa]  WITH CHECK ADD  CONSTRAINT [FK_MAGAZYN_JEDNOSTKA] FOREIGN KEY([Jednostka_ID])
REFERENCES [dbo].[Table_Jednostka] ([Jednostka_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] CHECK CONSTRAINT [FK_MAGAZYN_JEDNOSTKA]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa]  WITH CHECK ADD  CONSTRAINT [FK_MAGAZYN_MIEJSCE] FOREIGN KEY([Lokalizacja_ID])
REFERENCES [dbo].[Table_Lokalizacja] ([Lokalizacja_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] CHECK CONSTRAINT [FK_MAGAZYN_MIEJSCE]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa]  WITH CHECK ADD  CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Producent] FOREIGN KEY([Producent_ID])
REFERENCES [dbo].[Table_Producent] ([Producent_ID])
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] CHECK CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Producent]
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa]  WITH CHECK ADD  CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Typ] FOREIGN KEY([Typ_ID])
REFERENCES [dbo].[Table_Typ] ([Typ_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_PozycjaMagazynowa] CHECK CONSTRAINT [FK_Table_PozycjaMagazynowa_Table_Typ]
GO
ALTER TABLE [dbo].[Table_Przyjecie]  WITH CHECK ADD  CONSTRAINT [FK_Table_Przyjecie_Table_Dostawca] FOREIGN KEY([Dostawca_ID])
REFERENCES [dbo].[Table_Dostawca] ([Dostawca_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_Przyjecie] CHECK CONSTRAINT [FK_Table_Przyjecie_Table_Dostawca]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans]  WITH CHECK ADD  CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Pozycja] FOREIGN KEY([PozycjaMagazynowa_ID])
REFERENCES [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID])
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] CHECK CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Pozycja]
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans]  WITH CHECK ADD  CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Przyjecie] FOREIGN KEY([Przyjecie_ID])
REFERENCES [dbo].[Table_Przyjecie] ([Przyjecie_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_PrzyjecieTrans] CHECK CONSTRAINT [FK_Table_Przyjecie_Trans_Table_Przyjecie]
GO
ALTER TABLE [dbo].[Table_Wydanie]  WITH CHECK ADD  CONSTRAINT [FK_Table_Pobranie_Table_Linia] FOREIGN KEY([Linia_ID])
REFERENCES [dbo].[Table_Linia] ([Linia_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_Wydanie] CHECK CONSTRAINT [FK_Table_Pobranie_Table_Linia]
GO
ALTER TABLE [dbo].[Table_WydanieTrans]  WITH CHECK ADD  CONSTRAINT [FK_Table_Pobranie_Trans_Table_Magazyn] FOREIGN KEY([PozycjaMagazynowa_ID])
REFERENCES [dbo].[Table_PozycjaMagazynowa] ([PozycjaMagazynowa_ID])
GO
ALTER TABLE [dbo].[Table_WydanieTrans] CHECK CONSTRAINT [FK_Table_Pobranie_Trans_Table_Magazyn]
GO
ALTER TABLE [dbo].[Table_WydanieTrans]  WITH CHECK ADD  CONSTRAINT [FK_Table_Pobranie_Trans_Table_Pobranie] FOREIGN KEY([Wydanie_ID])
REFERENCES [dbo].[Table_Wydanie] ([Wydanie_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Table_WydanieTrans] CHECK CONSTRAINT [FK_Table_Pobranie_Trans_Table_Pobranie]
GO
/****** Object:  StoredProcedure [dbo].[ProcedureName]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ProcedureName] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        PozycjaMagazynowa_ID, PozycjaMagazynowa
FROM            View_pozycjaMagazynowa
FOR JSON AUTO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_dostawcaDel] 
	-- Add the parameters for the stored procedure here
	@dostawca_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
UPDATE       Table_Dostawca
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Dostawca_ID = @dostawca_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_dostawcaDetails] 
	-- Add the parameters for the stored procedure here
	@dostawca_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Dostawca.*
FROM            Table_Dostawca
WHERE        (Dostawca_ID = @dostawca_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_dostawcaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_dostawcaMod] 
	-- Add the parameters for the stored procedure here
	@dostawca_ID int = 0,
	@dostawca nvarchar(50) =null, 
	@adres nvarchar(250) =null,
	@daneKontaktowe nvarchar(250) =null,
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

UPDATE       Table_Dostawca
SET                Dostawca = @dostawca, Adres = @adres, DaneKontaktowe = @daneKontaktowe, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Dostawca_ID = @dostawca_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_dostawcaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_dostawcaNew] 
	-- Add the parameters for the stored procedure here
	@dostawca nvarchar(50) =null, 
	@adres nvarchar(250) =null,
	@daneKontaktowe nvarchar(250) =null,
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Dostawca
                         (Dostawca, Adres, DaneKontaktowe, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@dostawca,@adres,@daneKontaktowe,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_dostawcy]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_dostawcy] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Dostawca_ID, Dostawca, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Dostawca
WHERE        (Deleted = 0)
ORDER BY Dostawca
END

IF @case = 1 BEGIN 

SELECT        Dostawca_ID, Dostawca, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Dostawca
WHERE        (Deleted = 1)
ORDER BY Dostawca
END

IF @case = -1 BEGIN 

SELECT        Dostawca_ID, Dostawca, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Dostawca
ORDER BY Dostawca
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_jednostkaDel] 
	-- Add the parameters for the stored procedure here
	@jednostka_ID int =0, 
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Jednostka_ID = @jednostka_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_Jednostka
SET                Deleted =1, Uzytkownik =@uzytkownik, DataModyfikacji =GETDATE()
WHERE        (Jednostka_ID = @jednostka_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_jednostkaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_jednostkaDetails] 
	-- Add the parameters for the stored procedure here
	@jednostka_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Jednostka.*, Jednostka_ID AS Expr1
FROM            Table_Jednostka
WHERE        (Jednostka_ID = @jednostka_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_jednostkaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_jednostkaMod] 
	-- Add the parameters for the stored procedure here
	@jednostka_ID int = 0,
	@jednostka nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

UPDATE       Table_Jednostka
SET                Jednostka = @jednostka, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Jednostka_ID = @jednostka_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_jednostkaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_jednostkaNew] 
	-- Add the parameters for the stored procedure here
	@jednostka nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Jednostka
                         (Jednostka, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@jednostka,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_jednostki]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_jednostki] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Jednostka_ID, Jednostka, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Jednostka
WHERE        (Deleted = 0)
ORDER BY Jednostka
END

IF @case = 1 BEGIN 

SELECT        Jednostka_ID, Jednostka, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Jednostka
WHERE        (Deleted = 1)
ORDER BY Jednostka
END

IF @case = -1 BEGIN 

SELECT        Jednostka_ID, Jednostka, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Jednostka
ORDER BY Jednostka
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_kategoriaDel] 
	-- Add the parameters for the stored procedure here
	@kategoria_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
GROUP BY Kategoria_ID
HAVING        (Kategoria_ID = @kategoria_ID)
IF (@retVal > 0)
BEGIN
	SET @result=-2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_Kategoria
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Kategoria_ID = @kategoria_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
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
/****** Object:  StoredProcedure [dbo].[sp_kategoriaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_kategoriaDetails] 
	-- Add the parameters for the stored procedure here
	@kategoria_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Kategoria.*, Kategoria_ID AS Expr1
FROM            Table_Kategoria
WHERE        (Kategoria_ID = @kategoria_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_kategoriaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_kategoriaMod] 
	-- Add the parameters for the stored procedure here
	@kategoria_ID int = 0,
	@kategoria nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

UPDATE       Table_Kategoria
SET                Kategoria = @kategoria, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Kategoria_ID = @kategoria_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_kategoriaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_kategoriaNew] 
	-- Add the parameters for the stored procedure here
	@kategoria nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Kategoria
                         (Kategoria, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@kategoria,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_kategorie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_kategorie] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Kategoria_ID, Kategoria, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Kategoria
WHERE        (Deleted = 0)
ORDER BY Kategoria
END

IF @case = 1 BEGIN 

SELECT        Kategoria_ID, Kategoria, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Kategoria
WHERE        (Deleted = 1)
ORDER BY Kategoria
END

IF @case = -1 BEGIN 

SELECT        Kategoria_ID, Kategoria, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Kategoria
ORDER BY Kategoria
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_linia]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 02-05-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_linia] 
	-- Add the parameters for the stored procedure here
	@linia_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Linia_ID, Linia, Opis
FROM            Table_Linia
WHERE        (Linia_ID = @linia_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_liniaDel] 
	-- Add the parameters for the stored procedure here
	@linia_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
UPDATE       Table_linia
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Linia_ID = @linia_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 15-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_liniaDetails] 
	-- Add the parameters for the stored procedure here
	@linia_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Linia.*
FROM            Table_Linia
WHERE        (Linia_ID = @linia_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_liniaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_liniaMod] 
	-- Add the parameters for the stored procedure here
	@linia_ID int =0,
	@linia nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

UPDATE       Table_Linia
SET                Linia = @linia, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Linia_ID = @linia_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_liniaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 12-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_liniaNew] 
	-- Add the parameters for the stored procedure here
	@linia nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Linia
                         (Linia, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@linia,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_linie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_linie] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Linia_ID, Linia, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Linia
WHERE        (Deleted = 0)
ORDER BY Linia
END

IF @case = 1 BEGIN 

SELECT        Linia_ID, Linia, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Linia
WHERE        (Deleted = 1)
ORDER BY Linia
END

IF @case = -1 BEGIN 

SELECT        Linia_ID, Linia, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Linia
ORDER BY Linia
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacja]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 02-05-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacja]
	-- Add the parameters for the stored procedure here
	@lokalizacja_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Lokalizacja_ID, Lokalizacja, Opis
FROM            Table_Lokalizacja
WHERE        (Lokalizacja_ID = @lokalizacja_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacjaDel] 
	-- Add the parameters for the stored procedure here
	@lokalizacja_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Lokalizacja_ID = @lokalizacja_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_lokalizacja
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Lokalizacja_ID = @lokalizacja_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 15-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacjaDetails] 
	-- Add the parameters for the stored procedure here
	@lokalizacja_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Lokalizacja.*, Lokalizacja_ID AS Expr1
FROM            Table_Lokalizacja
WHERE        (Lokalizacja_ID = @lokalizacja_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacjaMod] 
	-- Add the parameters for the stored procedure here
	@lokalizacja_ID int =0,
	@lokalizacja nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

UPDATE       Table_Lokalizacja
SET                Lokalizacja = @lokalizacja, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Lokalizacja_ID = @lokalizacja_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_lokalizacjaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacjaNew] 
	-- Add the parameters for the stored procedure here
	@lokalizacja nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Lokalizacja
                         (Lokalizacja, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@lokalizacja,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_lokalizacje]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_lokalizacje] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Lokalizacja_ID, Lokalizacja, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Lokalizacja
WHERE        (Deleted = 0)
ORDER BY Lokalizacja
END

IF @case = 1 BEGIN 

SELECT        Lokalizacja_ID, Lokalizacja, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Lokalizacja
WHERE        (Deleted = 1)
ORDER BY Lokalizacja
END

IF @case = -1 BEGIN 

SELECT        Lokalizacja_ID, Lokalizacja, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Lokalizacja
ORDER BY Lokalizacja
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowa]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 23-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowa] 
	-- Add the parameters for the stored procedure here
	@pozycjaMagazynowa_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        PozycjaMagazynowa
FROM            View_pozycjaMagazynowa
WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaDel] 
	-- Add the parameters for the stored procedure here
	@pozycjaMagazynowa_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
UPDATE       Table_PozycjaMagazynowa
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
COMMIT TRANSACTION
SELECT @result=SCOPE_IDENTITY()
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2020-02-07
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaDetails] 
	-- Add the parameters for the stored procedure here
	@pozycjaMagazynowa_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, Table_PozycjaMagazynowa.Kategoria_ID, Table_Kategoria.Kategoria, Table_PozycjaMagazynowa.Producent_ID, Table_Producent.Producent, 
                         Table_PozycjaMagazynowa.Typ_ID, Table_Typ.Typ, Table_PozycjaMagazynowa.NumerSystemowySSA, Table_PozycjaMagazynowa.Jednostka_ID, Table_Jednostka.Jednostka, Table_PozycjaMagazynowa.Lokalizacja_ID, 
                         Table_Lokalizacja.Lokalizacja, Table_PozycjaMagazynowa.Stan, Table_PozycjaMagazynowa.StanMinimalny, Table_PozycjaMagazynowa.Opis, Table_PozycjaMagazynowa.Uwagi, Table_PozycjaMagazynowa.Deleted, 
                         Table_PozycjaMagazynowa.DataUsuniecia, Table_PozycjaMagazynowa.Uzytkownik, Table_PozycjaMagazynowa.DataModyfikacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Kategoria ON Table_PozycjaMagazynowa.Kategoria_ID = Table_Kategoria.Kategoria_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         Table_Producent ON Table_PozycjaMagazynowa.Producent_ID = Table_Producent.Producent_ID INNER JOIN
                         Table_Typ ON Table_PozycjaMagazynowa.Typ_ID = Table_Typ.Typ_ID
WHERE        (Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaHistory]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 22-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaHistory] 
	-- Add the parameters for the stored procedure here
	@pozycjaMagazynowa_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

DECLARE @przyjecieTypAkcji  nvarchar(10)
DECLARE @wydanieTypAkcji  nvarchar(10)


SET @przyjecieTypAkcji  = N'PRZYJECIE'
SET @wydanieTypAkcji  = N'WYDANIE'

    -- Insert statements for procedure here
SELECT        Table_PrzyjecieTrans.PozycjaMagazynowa_ID, @przyjecieTypAkcji AS TypAkcji, View_pozycjaMagazynowa.PozycjaMagazynowa, SUM(Table_PrzyjecieTrans.Ilosc) AS Ilosc, 
                         Table_Przyjecie.DataPrzyjecia AS DataPrzyjeciaWydania, Table_PrzyjecieTrans.Deleted, Table_PrzyjecieTrans.DataUsuniecia, Table_PrzyjecieTrans.Uzytkownik
FROM            Table_PrzyjecieTrans INNER JOIN
                         View_pozycjaMagazynowa ON Table_PrzyjecieTrans.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID INNER JOIN
                         Table_Przyjecie ON Table_PrzyjecieTrans.Przyjecie_ID = Table_Przyjecie.Przyjecie_ID
GROUP BY Table_PrzyjecieTrans.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_Przyjecie.DataPrzyjecia, Table_PrzyjecieTrans.DataUsuniecia, Table_PrzyjecieTrans.Uzytkownik, 
                         Table_PrzyjecieTrans.Deleted
HAVING        (Table_PrzyjecieTrans.PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
UNION
SELECT        Table_WydanieTrans.PozycjaMagazynowa_ID, @wydanieTypAkcji AS TypAkcji, View_pozycjaMagazynowa_1.PozycjaMagazynowa, SUM(Table_WydanieTrans.Ilosc) AS Ilosc, Table_Wydanie.DataWydania, 
                         Table_WydanieTrans.Deleted, Table_WydanieTrans.DataUsuniecia, Table_WydanieTrans.Uzytkownik
FROM            Table_WydanieTrans INNER JOIN
                         View_pozycjaMagazynowa AS View_pozycjaMagazynowa_1 ON Table_WydanieTrans.PozycjaMagazynowa_ID = View_pozycjaMagazynowa_1.PozycjaMagazynowa_ID INNER JOIN
                         Table_Wydanie ON Table_WydanieTrans.Wydanie_ID = Table_Wydanie.Wydanie_ID
GROUP BY Table_WydanieTrans.PozycjaMagazynowa_ID, View_pozycjaMagazynowa_1.PozycjaMagazynowa, Table_Wydanie.DataWydania, Table_WydanieTrans.DataUsuniecia, Table_WydanieTrans.Uzytkownik, 
                         Table_WydanieTrans.Deleted
HAVING        (Table_WydanieTrans.PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
ORDER BY TypAkcji, DataPrzyjeciaWydania
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaLabel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2020-02-07
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaLabel] 
	-- Add the parameters for the stored procedure here
	@id int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, Table_Kategoria.Kategoria, Table_Producent.Producent, Table_Typ.Typ, Table_Lokalizacja.Lokalizacja, Table_Lokalizacja.Opis AS OpisLokalizacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Kategoria ON Table_PozycjaMagazynowa.Kategoria_ID = Table_Kategoria.Kategoria_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         Table_Producent ON Table_PozycjaMagazynowa.Producent_ID = Table_Producent.Producent_ID INNER JOIN
                         Table_Typ ON Table_PozycjaMagazynowa.Typ_ID = Table_Typ.Typ_ID
WHERE        (Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = @id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaMod] 
	-- Add the parameters for the stored procedure here
	@pozycjaMagazynowa_ID int = 0,
	@kategoria_ID int = 0,
	@producent_ID int = 0,
	@typ_ID int = 0,
	@numerSystemowySSA int = 0,
	@jednostka_ID int = 0,
	@lokalizacja_ID int = 0,
	@stanMinimalny int = 0,
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Kategoria_ID = @kategoria_ID) AND (Producent_ID = @producent_ID) AND (Typ_ID = @typ_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_PozycjaMagazynowa
SET                Kategoria_ID = @kategoria_ID, Producent_ID = @producent_ID, Typ_ID = @typ_ID, NumerSystemowySSA = @numerSystemowySSA, Jednostka_ID = @jednostka_ID, Lokalizacja_ID = @lokalizacja_ID, StanMinimalny = @stanMinimalny, Opis = @opis, 
                         Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
COMMIT TRANSACTION
SELECT @result=SCOPE_IDENTITY()
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_pozycjaMagazynowaNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjaMagazynowaNew] 
	-- Add the parameters for the stored procedure here
	@kategoria_ID int = 0,
	@producent_ID int = 0,
	@typ_ID int = 0,
	@numerSystemowySSA int = 0,
	@jednostka_ID int = 0,
	@lokalizacja_ID int = 0,
	@stanMinimalny int = 0,
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int
	SET @result= -1
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Kategoria_ID = @kategoria_ID) AND (Producent_ID = @producent_ID) AND (Typ_ID = @typ_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
INSERT INTO Table_PozycjaMagazynowa
                         (Kategoria_ID, Producent_ID, Typ_ID, NumerSystemowySSA, Jednostka_ID, Lokalizacja_ID, Stan, StanMinimalny, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@kategoria_ID,@producent_ID,@typ_ID,@numerSystemowySSA,@jednostka_ID,@lokalizacja_ID, 0,@stanMinimalny,@opis,@uwagi,@uzytkownik, GETDATE())
COMMIT TRANSACTION
SELECT @result=SCOPE_IDENTITY()
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynowe]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjeMagazynowe] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PozycjaMagazynowa.Stan, Table_PozycjaMagazynowa.StanMinimalny, Table_Lokalizacja.Lokalizacja_ID, 
                         Table_Lokalizacja.Lokalizacja, Table_PozycjaMagazynowa.NumerSystemowySSA, Table_PozycjaMagazynowa.Opis, Table_PozycjaMagazynowa.Uwagi, Table_PozycjaMagazynowa.Deleted, 
                         Table_PozycjaMagazynowa.DataUsuniecia, Table_PozycjaMagazynowa.Uzytkownik, Table_PozycjaMagazynowa.DataModyfikacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         View_pozycjaMagazynowa ON Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_PozycjaMagazynowa.Deleted = 0)
ORDER BY Table_PozycjaMagazynowa.PozycjaMagazynowa_ID
END

IF @case = 1 BEGIN 

SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PozycjaMagazynowa.Stan, Table_PozycjaMagazynowa.StanMinimalny, Table_Lokalizacja.Lokalizacja_ID, 
                         Table_Lokalizacja.Lokalizacja, Table_PozycjaMagazynowa.NumerSystemowySSA, Table_PozycjaMagazynowa.Opis, Table_PozycjaMagazynowa.Uwagi, Table_PozycjaMagazynowa.Deleted, 
                         Table_PozycjaMagazynowa.DataUsuniecia, Table_PozycjaMagazynowa.Uzytkownik, Table_PozycjaMagazynowa.DataModyfikacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         View_pozycjaMagazynowa ON Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_PozycjaMagazynowa.Deleted = 1)
ORDER BY Table_PozycjaMagazynowa.PozycjaMagazynowa_ID
END

IF @case = -1 BEGIN 

SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PozycjaMagazynowa.Stan, Table_PozycjaMagazynowa.StanMinimalny, Table_Lokalizacja.Lokalizacja_ID, 
                         Table_Lokalizacja.Lokalizacja, Table_PozycjaMagazynowa.NumerSystemowySSA, Table_PozycjaMagazynowa.Opis, Table_PozycjaMagazynowa.Uwagi, Table_PozycjaMagazynowa.Deleted, 
                         Table_PozycjaMagazynowa.DataUsuniecia, Table_PozycjaMagazynowa.Uzytkownik, Table_PozycjaMagazynowa.DataModyfikacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         View_pozycjaMagazynowa ON Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
ORDER BY Table_PozycjaMagazynowa.PozycjaMagazynowa_ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweFind]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 18-05-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjeMagazynoweFind] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PozycjaMagazynowa.Stan, Table_Lokalizacja.Lokalizacja
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         View_pozycjaMagazynowa ON Table_PozycjaMagazynowa.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
ORDER BY View_pozycjaMagazynowa.PozycjaMagazynowa, Table_Lokalizacja.Lokalizacja
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweLokalizacjaSkaner]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 01-05-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjeMagazynoweLokalizacjaSkaner] 
	-- Add the parameters for the stored procedure here
	@lokalizacja_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, Table_PozycjaMagazynowa.Kategoria_ID, Table_Kategoria.Kategoria, Table_PozycjaMagazynowa.Producent_ID, Table_Producent.Producent, 
                         Table_PozycjaMagazynowa.Typ_ID, Table_Typ.Typ, Table_PozycjaMagazynowa.NumerSystemowySSA, Table_PozycjaMagazynowa.Jednostka_ID, Table_Jednostka.Jednostka, Table_PozycjaMagazynowa.Lokalizacja_ID, 
                         Table_Lokalizacja.Lokalizacja, Table_PozycjaMagazynowa.Stan, Table_PozycjaMagazynowa.StanMinimalny, Table_PozycjaMagazynowa.Opis, Table_PozycjaMagazynowa.Uwagi, Table_PozycjaMagazynowa.Deleted, 
                         Table_PozycjaMagazynowa.DataUsuniecia, Table_PozycjaMagazynowa.Uzytkownik, Table_PozycjaMagazynowa.DataModyfikacji
FROM            Table_PozycjaMagazynowa INNER JOIN
                         Table_Jednostka ON Table_PozycjaMagazynowa.Jednostka_ID = Table_Jednostka.Jednostka_ID INNER JOIN
                         Table_Kategoria ON Table_PozycjaMagazynowa.Kategoria_ID = Table_Kategoria.Kategoria_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         Table_Producent ON Table_PozycjaMagazynowa.Producent_ID = Table_Producent.Producent_ID INNER JOIN
                         Table_Typ ON Table_PozycjaMagazynowa.Typ_ID = Table_Typ.Typ_ID
WHERE        (Table_PozycjaMagazynowa.Lokalizacja_ID = @Lokalizacja_ID)
FOR JSON AUTO , ROOT ('LOKALIZACJA')
END
GO
/****** Object:  StoredProcedure [dbo].[sp_pozycjeMagazynoweSkaner]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 16-05-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_pozycjeMagazynoweSkaner] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Table_PozycjaMagazynowa.PozycjaMagazynowa_ID, Table_Kategoria.Kategoria, Table_Typ.Typ, Table_Lokalizacja.Lokalizacja, CAST(Table_PozycjaMagazynowa.Stan AS varchar(10)) 
                         + N' ' + Table_Jednostka.Jednostka AS Stan
FROM            Table_Jednostka INNER JOIN
                         Table_PozycjaMagazynowa ON Table_Jednostka.Jednostka_ID = Table_PozycjaMagazynowa.Jednostka_ID INNER JOIN
                         Table_Kategoria ON Table_PozycjaMagazynowa.Kategoria_ID = Table_Kategoria.Kategoria_ID INNER JOIN
                         Table_Lokalizacja ON Table_PozycjaMagazynowa.Lokalizacja_ID = Table_Lokalizacja.Lokalizacja_ID INNER JOIN
                         Table_Typ ON Table_PozycjaMagazynowa.Typ_ID = Table_Typ.Typ_ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_producenci]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_producenci] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Producent_ID, Producent, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Producent
WHERE        (Deleted = 0)
ORDER BY Producent
END

IF @case = 1 BEGIN 

SELECT        Producent_ID, Producent, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Producent
WHERE        (Deleted = 1)
ORDER BY Producent
END

IF @case = -1 BEGIN 

SELECT        Producent_ID, Producent, Adres, DaneKontaktowe, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Producent
ORDER BY Producent
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_producentDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_producentDel] 
	-- Add the parameters for the stored procedure here
	@producent_ID int = 0,
	@uzytkownik nvarchar (50) = null,
	@result [int] OUTPUT
WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Producent_ID = @producent_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_Producent
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Producent_ID = @producent_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_producentDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_producentDetails] 
	-- Add the parameters for the stored procedure here
	@producent_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Producent.*
FROM            Table_Producent
WHERE        (Producent_ID = @producent_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_producentMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_producentMod] 
	-- Add the parameters for the stored procedure here
	@producent_ID int = 0,
	@producent nvarchar (50) = null,
	@adres nvarchar (250) = null,
	@DaneKontaktowe nvarchar (250) = null,
	@opis nvarchar (250) = null,
	@uwagi nvarchar (250) = null,
	@uzytkownik nvarchar (50) = null,
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

UPDATE       Table_Producent
SET                Producent = @producent, Adres = @adres, DaneKontaktowe = @DaneKontaktowe, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik
WHERE        (Producent_ID = @producent_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_producentNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_producentNew] 

	@producent nvarchar (50) = null,
	@adres nvarchar (250) = null,
	@DaneKontaktowe nvarchar (250) = null,
	@opis nvarchar (250) = null,
	@uwagi nvarchar (250) = null,
	@uzytkownik nvarchar (50) = null,
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

INSERT INTO Table_Producent
                         (Producent, Adres, DaneKontaktowe, Opis, Uwagi, Uzytkownik)
VALUES        (@producent,@adres,@DaneKontaktowe,@opis,@uwagi,@uzytkownik)
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
/****** Object:  StoredProcedure [dbo].[sp_przyjecia]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecia] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Table_Przyjecie.Przyjecie_ID, Table_Przyjecie.UUID, Table_Przyjecie.Dostawca_ID, Table_Dostawca.Dostawca, Table_Przyjecie.Faktura, Table_Przyjecie.DataPrzyjecia, Table_Przyjecie.Opis, Table_Przyjecie.Uwagi, 
                         Table_Przyjecie.Deleted, Table_Przyjecie.DataUsuniecia, Table_Przyjecie.Uzytkownik
FROM            Table_Przyjecie INNER JOIN
                         Table_Dostawca ON Table_Przyjecie.Dostawca_ID = Table_Dostawca.Dostawca_ID
WHERE        (Table_Przyjecie.Deleted = 0)
ORDER BY Table_Przyjecie.Przyjecie_ID
END

IF @case = 1 BEGIN 

SELECT        Table_Przyjecie.Przyjecie_ID, Table_Przyjecie.UUID, Table_Przyjecie.Dostawca_ID, Table_Dostawca.Dostawca, Table_Przyjecie.Faktura, Table_Przyjecie.DataPrzyjecia, Table_Przyjecie.Opis, Table_Przyjecie.Uwagi, 
                         Table_Przyjecie.Deleted, Table_Przyjecie.DataUsuniecia, Table_Przyjecie.Uzytkownik
FROM            Table_Przyjecie INNER JOIN
                         Table_Dostawca ON Table_Przyjecie.Dostawca_ID = Table_Dostawca.Dostawca_ID
WHERE        (Table_Przyjecie.Deleted = 1)
ORDER BY Table_Przyjecie.Przyjecie_ID
END

IF @case = -1 BEGIN 

SELECT        Table_Przyjecie.Przyjecie_ID, Table_Przyjecie.UUID, Table_Przyjecie.Dostawca_ID, Table_Dostawca.Dostawca, Table_Przyjecie.Faktura, Table_Przyjecie.DataPrzyjecia, Table_Przyjecie.Opis, Table_Przyjecie.Uwagi, 
                         Table_Przyjecie.Deleted, Table_Przyjecie.DataUsuniecia, Table_Przyjecie.Uzytkownik
FROM            Table_Przyjecie INNER JOIN
                         Table_Dostawca ON Table_Przyjecie.Dostawca_ID = Table_Dostawca.Dostawca_ID
ORDER BY Table_Przyjecie.Przyjecie_ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 23-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecie] 
	-- Add the parameters for the stored procedure here
	@przyjecie_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Faktura, DataPrzyjecia
FROM            Table_Przyjecie
WHERE        (Przyjecie_ID = @przyjecie_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieDel] 
	-- Add the parameters for the stored procedure here
	@przyjecie_ID int,
	@uzytkownik nvarchar(50),
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
	DECLARE 
	@linia_ID int,
    @pozycjaMagazynowa_ID int, 
    @ilosc int = 0,
	@przyjecieTrans_ID int,
	@stan int = 0,
	@uuid uniqueidentifier

BEGIN TRY
BEGIN TRANSACTION    
SET @result = -1
SET NOCOUNT ON

SELECT @uuid = UUID
FROM            Table_Przyjecie
WHERE        (Przyjecie_ID = @przyjecie_ID)

DECLARE cursor_przyjecieDel CURSOR
FOR  SELECT        PozycjaMagazynowa_ID, Ilosc, PrzyjecieTrans_ID
FROM            Table_PrzyjecieTrans
WHERE        (Przyjecie_ID = @przyjecie_ID)

OPEN cursor_przyjecieDel
 
FETCH NEXT FROM cursor_przyjecieDel INTO 
	@pozycjaMagazynowa_ID, 
	@ilosc,
	@przyjecieTrans_ID

WHILE @@FETCH_STATUS = 0
	BEGIN

		SELECT        @stan=Stan
		FROM            Table_PozycjaMagazynowa
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
		
		IF(@stan<@ilosc)
		BEGIN
			SET @result= -2
				RAISERROR (60000,16,1) 
			END

		UPDATE       Table_PozycjaMagazynowa
		SET                Stan = Stan - @ilosc
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)

		UPDATE       Table_PrzyjecieTrans
		SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
		WHERE        (PrzyjecieTrans_ID = @przyjecieTrans_ID)

		FETCH NEXT FROM cursor_przyjecieDel INTO 
		@pozycjaMagazynowa_ID, 
		@ilosc,
		@przyjecieTrans_ID
	END

UPDATE       Table_RejestrTransakcji
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (UUIDTransakcji = @uuid)

UPDATE       Table_Przyjecie
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Przyjecie_ID = @przyjecie_ID)
	
COMMIT TRANSACTION

CLOSE cursor_przyjecieDel
DEALLOCATE cursor_przyjecieDel
SET @result = 0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
		
CLOSE cursor_przyjecieDel
DEALLOCATE cursor_przyjecieDel
END
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieHistory]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 22-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieHistory] 
	-- Add the parameters for the stored procedure here
	@przyjecie_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_PrzyjecieTrans.Przyjecie_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PrzyjecieTrans.Ilosc, Table_PrzyjecieTrans.Deleted, Table_PrzyjecieTrans.DataUsuniecia, Table_PrzyjecieTrans.Uzytkownik
FROM            Table_PrzyjecieTrans INNER JOIN
                         View_pozycjaMagazynowa ON Table_PrzyjecieTrans.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_PrzyjecieTrans.Przyjecie_ID = @przyjecie_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemAdd]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 12-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieItemAdd] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier ,
	@pozycjaMagazynowa_ID int,
	@ilosc int,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
BEGIN TRY
BEGIN TRANSACTION  
SET NOCOUNT ON;

INSERT INTO Table_PrzyjecieItem
                         (UUID, PozycjaMagazynowa_ID, Ilosc)
VALUES        (@uuid,@pozycjaMagazynowa_ID,@ilosc)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 19-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieItemDetails] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

    -- Insert statements for procedure here
SELECT        Table_PrzyjecieItem.PrzyjecieItem_ID, Table_PrzyjecieItem.UUID, Table_PrzyjecieItem.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_PrzyjecieItem.Ilosc
FROM            Table_PrzyjecieItem INNER JOIN
                         View_pozycjaMagazynowa ON Table_PrzyjecieItem.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_PrzyjecieItem.UUID = @uuid)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemRemove]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 13-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieItemRemove] 
	-- Add the parameters for the stored procedure here
	@przyjecieItem_ID int,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON
DELETE FROM Table_PrzyjecieItem
WHERE        (PrzyjecieItem_ID = @przyjecieItem_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_przyjecieItemsRollback]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 12-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieItemsRollback] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier,
	@result int OUTPUT

	WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

DELETE FROM Table_PrzyjecieItem
WHERE        (UUID = @uuid)
	
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_przyjecieTrans]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-18
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_przyjecieTrans] 
	-- Add the parameters for the stored procedure here
	@dostawca_ID int,
	@faktura nvarchar(250),
	@opis nvarchar(250),
	@uwagi nvarchar(250),
	@uzytkownik nvarchar(50),
	@uuid uniqueidentifier,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
	DECLARE 
	@przyjecie_ID int, 
    @pozycjaMagazynowa_ID int, 
    @ilosc int,
	@przyjecieItem_ID int

BEGIN TRY
BEGIN TRANSACTION    
SET @result = -1
SET NOCOUNT ON
INSERT INTO Table_Przyjecie
                         (Dostawca_ID, UUID, Faktura, Opis, Uwagi, Uzytkownik, DataPrzyjecia)
VALUES        (@dostawca_ID,@uuid,@faktura,@opis,@uwagi,@uzytkownik, GETDATE())
SELECT @przyjecie_ID = SCOPE_IDENTITY() 

DECLARE cursor_przyjecieTrans CURSOR
FOR  SELECT        PozycjaMagazynowa_ID, Ilosc, PrzyjecieItem_ID
FROM            Table_PrzyjecieItem
WHERE        (UUID = @uuid)

OPEN cursor_przyjecieTrans
 
FETCH NEXT FROM cursor_przyjecieTrans INTO 
    @pozycjaMagazynowa_ID, 
    @ilosc,
	@przyjecieItem_ID;

WHILE @@FETCH_STATUS = 0
    BEGIN
		INSERT INTO Table_PrzyjecieTrans
								 (Przyjecie_ID, PozycjaMagazynowa_ID, Ilosc, UUID)
		VALUES        (@przyjecie_ID,@pozycjaMagazynowa_ID,@ilosc,@uuid)

		UPDATE       Table_PozycjaMagazynowa
		SET                Stan = Stan + @ilosc
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)

		DELETE FROM Table_PrzyjecieItem
		WHERE        (PrzyjecieItem_ID = @przyjecieItem_ID)

        FETCH NEXT FROM cursor_przyjecieTrans INTO 
		@pozycjaMagazynowa_ID, 
		@ilosc,
		@przyjecieItem_ID
	END
INSERT INTO Table_RejestrTransakcji
			(UUIDTransakcji, DataTransakcji, Uzytkownik)
VALUES      (@uuid,GETDATE(),@uzytkownik)

COMMIT TRANSACTION

CLOSE cursor_przyjecieTrans
DEALLOCATE cursor_przyjecieTrans
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
		CLOSE cursor_przyjecieTrans
DEALLOCATE cursor_przyjecieTrans
END
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_typDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_typDel] 
	-- Add the parameters for the stored procedure here
	@typ_ID int = 0,
	@uzytkownik nvarchar(50) =null,
	@result [int] OUTPUT

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
	DECLARE 
	@retVal int = -1
	SET @result= -1

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON;
SELECT @retVal = COUNT(*)
FROM            Table_PozycjaMagazynowa
WHERE        (Typ_ID = @typ_ID)

IF (@retVal > 0)
BEGIN
	SET @result= -2
    RAISERROR (60000,16,1); 
END
UPDATE       Table_Typ
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Typ_ID = @typ_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

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
/****** Object:  StoredProcedure [dbo].[sp_typDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_typDetails] 
	-- Add the parameters for the stored procedure here
	@typ_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_Typ.*
FROM            Table_Typ
WHERE        (Typ_ID = @typ_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_typMod]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_typMod] 
	-- Add the parameters for the stored procedure here
	@typ_ID int = 0,
	@typ nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

UPDATE       Table_Typ
SET                Typ = @typ, Opis = @opis, Uwagi = @uwagi, Uzytkownik = @uzytkownik, DataModyfikacji = GETDATE()
WHERE        (Typ_ID = @typ_ID)
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
/****** Object:  StoredProcedure [dbo].[sp_typNew]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_typNew] 
	-- Add the parameters for the stored procedure here
	@typ nvarchar(50) =null, 
	@opis nvarchar(250) =null,
	@uwagi nvarchar(250) =null,
	@uzytkownik nvarchar(50) =null,
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

INSERT INTO Table_Typ
                         (Typ, Opis, Uwagi, Uzytkownik, DataModyfikacji)
VALUES        (@typ,@opis,@uwagi,@uzytkownik, GETDATE())
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
/****** Object:  StoredProcedure [dbo].[sp_typy]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_typy] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN 

SELECT        Typ_ID, Typ, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Typ
WHERE        (Deleted = 0)
ORDER BY Typ
END

IF @case = 1 BEGIN 

SELECT        Typ_ID, Typ, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Typ
WHERE        (Deleted = 1)
ORDER BY Typ
END

IF @case = -1 BEGIN 

SELECT        Typ_ID, Typ, Opis, Uwagi, Deleted, DataUsuniecia, Uzytkownik, DataModyfikacji
FROM            Table_Typ
ORDER BY Typ
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydania]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-10
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydania] 
	-- Add the parameters for the stored procedure here
@case int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF @case = 0 BEGIN

SELECT        Table_Wydanie.Wydanie_ID, Table_Wydanie.UUID, Table_Wydanie.Linia_ID, Table_Linia.Linia, Table_Wydanie.DataWydania, Table_Wydanie.Opis, Table_Wydanie.Uwagi, Table_Wydanie.Deleted, 
                         Table_Wydanie.DataUsuniecia, Table_Wydanie.Uzytkownik
FROM            Table_Linia INNER JOIN
                         Table_Wydanie ON Table_Linia.Linia_ID = Table_Wydanie.Linia_ID
WHERE        (Table_Wydanie.Deleted = 0)
ORDER BY Table_Wydanie.Wydanie_ID
END

IF @case = 1 BEGIN

SELECT        Table_Wydanie.Wydanie_ID, Table_Wydanie.UUID, Table_Wydanie.Linia_ID, Table_Linia.Linia, Table_Wydanie.DataWydania, Table_Wydanie.Opis, Table_Wydanie.Uwagi, Table_Wydanie.Deleted, 
                         Table_Wydanie.DataUsuniecia, Table_Wydanie.Uzytkownik
FROM            Table_Linia INNER JOIN
                         Table_Wydanie ON Table_Linia.Linia_ID = Table_Wydanie.Linia_ID
WHERE        (Table_Wydanie.Deleted = 1)
ORDER BY Table_Wydanie.Wydanie_ID
END

IF @case = -1 BEGIN

SELECT        Table_Wydanie.Wydanie_ID, Table_Wydanie.UUID, Table_Wydanie.Linia_ID, Table_Linia.Linia, Table_Wydanie.DataWydania, Table_Wydanie.Opis, Table_Wydanie.Uwagi, Table_Wydanie.Deleted, 
                         Table_Wydanie.DataUsuniecia, Table_Wydanie.Uzytkownik
FROM            Table_Linia INNER JOIN
                         Table_Wydanie ON Table_Linia.Linia_ID = Table_Wydanie.Linia_ID
ORDER BY Table_Wydanie.Wydanie_ID
END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanie]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 23-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanie] 
	-- Add the parameters for the stored procedure here
	@wydanie_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        Table_Linia.Linia, Table_Wydanie.DataWydania
FROM            Table_Wydanie INNER JOIN
                         Table_Linia ON Table_Wydanie.Linia_ID = Table_Linia.Linia_ID
WHERE        (Table_Wydanie.Wydanie_ID = @wydanie_ID) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieDel]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 14-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieDel] 
	-- Add the parameters for the stored procedure here
	@wydanie_ID int,
	@uzytkownik nvarchar(50),
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
	DECLARE 
	@linia_ID int,
    @pozycjaMagazynowa_ID int, 
    @ilosc int,
	@wydanieTrans_ID int,
	@stan int,
	@uuid uniqueidentifier

BEGIN TRY
BEGIN TRANSACTION    
SET @result = -1
SET NOCOUNT ON

SELECT @uuid = UUID
FROM            Table_Wydanie
WHERE        (Wydanie_ID = @wydanie_ID)

DECLARE cursor_wydanieDel CURSOR
FOR  SELECT        PozycjaMagazynowa_ID, Ilosc, WydanieTrans_ID
FROM            Table_WydanieTrans
WHERE        (Wydanie_ID = @wydanie_ID)

OPEN cursor_wydanieDel
 
FETCH NEXT FROM cursor_wydanieDel INTO 
	@pozycjaMagazynowa_ID, 
	@ilosc,
	@wydanieTrans_ID

WHILE @@FETCH_STATUS = 0
	BEGIN

		SELECT        @stan=Stan
		FROM            Table_PozycjaMagazynowa
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
		
		UPDATE       Table_PozycjaMagazynowa
		SET                Stan = Stan + @ilosc
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)

		UPDATE       Table_WydanieTrans
		SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
		WHERE        (WydanieTrans_ID = @wydanieTrans_ID)

		FETCH NEXT FROM cursor_wydanieDel INTO 
		@pozycjaMagazynowa_ID, 
		@ilosc,
		@wydanieTrans_ID
	END

UPDATE       Table_RejestrTransakcji
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (UUIDTransakcji = @uuid)

UPDATE       Table_Wydanie
SET                Deleted = 1, DataUsuniecia = GETDATE(), Uzytkownik = @uzytkownik
WHERE        (Wydanie_ID = @wydanie_ID)
	
COMMIT TRANSACTION

CLOSE cursor_wydanieDel
DEALLOCATE cursor_wydanieDel
SET @result = 0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
		
CLOSE cursor_wydanieDel
DEALLOCATE cursor_wydanieDel
END
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieHistory]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 22-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieHistory] 
	-- Add the parameters for the stored procedure here
	@wydanie_ID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        Table_WydanieTrans.Wydanie_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_WydanieTrans.Ilosc, Table_WydanieTrans.Deleted, Table_WydanieTrans.DataUsuniecia, Table_WydanieTrans.Uzytkownik
FROM            Table_WydanieTrans INNER JOIN
                         View_pozycjaMagazynowa ON Table_WydanieTrans.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_WydanieTrans.Wydanie_ID = @wydanie_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemAdd]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 12-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieItemAdd] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier ,
	@pozycjaMagazynowa_ID int,
	@ilosc int,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
BEGIN TRY
BEGIN TRANSACTION  
SET NOCOUNT ON

		INSERT INTO Table_WydanieItem
								 (UUID, PozycjaMagazynowa_ID, Ilosc)
		VALUES        (@uuid,@pozycjaMagazynowa_ID,@ilosc)

COMMIT TRANSACTION
SET @result=0
END TRY
BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemDetails]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 19-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieItemDetails] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

    -- Insert statements for procedure here
	SELECT        Table_WydanieItem.WydanieItem_ID, Table_WydanieItem.UUID, Table_WydanieItem.PozycjaMagazynowa_ID, View_pozycjaMagazynowa.PozycjaMagazynowa, Table_WydanieItem.Ilosc
FROM            Table_WydanieItem INNER JOIN
                         View_pozycjaMagazynowa ON Table_WydanieItem.PozycjaMagazynowa_ID = View_pozycjaMagazynowa.PozycjaMagazynowa_ID
WHERE        (Table_WydanieItem.UUID = @uuid)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemRemove]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 13-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieItemRemove] 
	-- Add the parameters for the stored procedure here
	@wydanieItem_ID int,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN

BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON
DELETE FROM Table_WydanieItem
WHERE        (WydanieItem_ID = @wydanieItem_ID)
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_wydanieItemsRollback]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 12-02-2020
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieItemsRollback] 
	-- Add the parameters for the stored procedure here
	@uuid uniqueidentifier,
	@result int OUTPUT

	WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN
BEGIN TRY 
BEGIN TRANSACTION   
SET NOCOUNT ON

DELETE FROM Table_WydanieItem
WHERE        (UUID = @uuid)
	
COMMIT TRANSACTION
SET @result=0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 
SET @result= -1
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
/****** Object:  StoredProcedure [dbo].[sp_wydanieTrans]    Script Date: 18.05.2020 22:22:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Aleksander Lipiec
-- Create date: 2019-12-14
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_wydanieTrans] 
	-- Add the parameters for the stored procedure here
	@linia_ID int,
	@opis nvarchar(250),
	@uwagi nvarchar(250),
	@uzytkownik nvarchar(50),
	@uuid uniqueidentifier,
	@result int OUTPUT 

WITH EXECUTE 
AS 
CALLER 
AS 
BEGIN 
	DECLARE 
	@wydanie_ID int, 
    @pozycjaMagazynowa_ID int, 
    @ilosc int,
	@stan int,
	@wydanieItem_ID int

BEGIN TRY
BEGIN TRANSACTION    
SET @result = -1
SET NOCOUNT ON
INSERT INTO Table_Wydanie
                         (UUID, Linia_ID, DataWydania, Opis, Uwagi, Uzytkownik)
VALUES        (@uuid,@linia_ID, GETDATE(),@opis,@uwagi,@uzytkownik)
SELECT @wydanie_ID = SCOPE_IDENTITY(); 

DECLARE cursor_wydanieTrans CURSOR
FOR  SELECT        PozycjaMagazynowa_ID, Ilosc, WydanieItem_ID
FROM            Table_WydanieItem
WHERE        (UUID = @uuid)

OPEN cursor_wydanieTrans
 
FETCH NEXT FROM cursor_wydanieTrans INTO 
	@pozycjaMagazynowa_ID, 
	@ilosc,
	@wydanieItem_ID

WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO Table_WydanieTrans
									(Wydanie_ID, PozycjaMagazynowa_ID, Ilosc,UUID)
		VALUES        (@wydanie_ID,@pozycjaMagazynowa_ID,@ilosc,@uuid)

		SELECT        @stan=Stan
		FROM            Table_PozycjaMagazynowa
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)
		
		IF(@stan<@ilosc)
		BEGIN
			SET @result= -2
				RAISERROR (60000,16,1) 
			END

		UPDATE       Table_PozycjaMagazynowa
		SET                Stan = Stan - @ilosc
		WHERE        (PozycjaMagazynowa_ID = @pozycjaMagazynowa_ID)

		DELETE FROM Table_WydanieItem
		WHERE        (WydanieItem_ID = @wydanieItem_ID)

		FETCH NEXT FROM cursor_wydanieTrans INTO 
		@pozycjaMagazynowa_ID, 
		@ilosc,
		@wydanieItem_ID
	END
INSERT INTO Table_RejestrTransakcji
			(UUIDTransakcji, DataTransakcji, Uzytkownik)
VALUES      (@uuid,GETDATE(),@uzytkownik)
	
COMMIT TRANSACTION

CLOSE cursor_wydanieTrans
DEALLOCATE cursor_wydanieTrans
SET @result = 0
END TRY

BEGIN CATCH
IF @@ERROR<>0 BEGIN ROLLBACK 

SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
		
CLOSE cursor_wydanieTrans
DEALLOCATE cursor_wydanieTrans
END
END CATCH
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_Linia"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 222
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_linia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_linia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_PozycjaMagazynowa"
            Begin Extent = 
               Top = 20
               Left = 309
               Bottom = 330
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Kategoria"
            Begin Extent = 
               Top = 10
               Left = 552
               Bottom = 140
               Right = 727
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Typ"
            Begin Extent = 
               Top = 28
               Left = 101
               Bottom = 158
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_Producent"
            Begin Extent = 
               Top = 6
               Left = 765
               Bottom = 136
               Right = 944
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 10245
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_pozycjaMagazynowa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_pozycjaMagazynowa'
GO
USE [master]
GO
ALTER DATABASE [MAGAZYN_MINI] SET  READ_WRITE 
GO
