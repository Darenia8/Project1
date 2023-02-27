-- DATASET DESCARGADO DE: https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
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

-- Recuento del total de JJOO disputados
SELECT COUNT(DISTINCT Games) AS Total_JJOO
FROM athlete_events;

-- Listar todos los JJOO por año, temporada y ciudad hasta 2016
SELECT DISTINCT year, season, city
FROM athlete_events
ORDER BY year ASC;

-- Total de deportes jugados en cada JJOO
SELECT games, COUNT(DISTINCT sport) AS total_deportes
FROM athlete_events
GROUP BY games
ORDER BY total_deportes DESC, games DESC;

-- Atletas mas viejos en conseguir medalla de oro
SELECT name, sex, age, team, games, city, sport, event, medal
FROM athlete_events
WHERE medal = "gold" AND age NOT LIKE "NA"
ORDER BY age DESC, name DESC
LIMIT 2;

-- Top atletas con medalla de oro
SELECT name, team, COUNT(medal) AS total_oro
FROM athlete_events
WHERE medal = "gold"
group by name
order by total_gold desc
limit 5;

-- Top atletas con medalla de oro, bronce o plata
select name, team, COUNT(medal) as total_medallas
from athlete_events
where medal IN ("gold", "silver", "bronze")
group by name
order by total_medallas desc
limit 10;

-- TOP 5 países con más medallas en la historia
select nr.region, COUNT(ae.medal) as total_medallas
from athlete_events ae
join noc_regions nr on ae.noc = nr.noc
WHERE medal <> "NA" 
group by region
ORDER BY total_medallas DESC
LIMIT 5;

--
-- Table structure for table `noc_regions`
--

CREATE TABLE `noc_regions` (
  `NOC` text,
  `region` text,
  `notes` text
);
