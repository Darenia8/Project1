-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectos
-- ------------------------------------------------------
-- Server version	8.0.30

CREATE TABLE `athlete_events` (
  `ID` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Sex` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `Height` varchar(100) DEFAULT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Team` varchar(100) DEFAULT NULL,
  `NOC` varchar(100) DEFAULT NULL,
  `Games` varchar(100) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Season` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Sport` varchar(100) DEFAULT NULL,
  `Event` varchar(100) DEFAULT NULL,
  `Medal` varchar(100) DEFAULT NULL
);

--
-- Table structure for table `noc_regions`
--

CREATE TABLE `noc_regions` (
  `NOC` text,
  `region` text,
  `notes` text
);
