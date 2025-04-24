-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `taulab`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `AUST`
--

CREATE TABLE `AUST` (
  `IDAUST` varchar(2) NOT NULL,
  `AUBIST` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `AUST`
--

INSERT INTO `AUST` (`IDAUST`, `AUBIST`) VALUES
('00', '1. - 6. Klasse'),
('01', '7. Klasse'),
('02', '8. Klasse'),
('03', '9. Klasse (nicht Gymnasium)'),
('04', '1. Jahr FMS'),
('05', '2. Jahr FMS'),
('06', '3. Jahr FMS'),
('07', '1. Jahr Gymnasium'),
('08', '2. Jahr Gymnasium'),
('09', '3. Jahr Gymnasium'),
('10', '4. Jahr Gymnasium'),
('11', 'Berufsmaturität'),
('12', '1. Jahr Berufsschule'),
('13', '2. Jahr Berufsschule'),
('14', '3. Jahr Berufsschule'),
('15', 'Bachelor'),
('16', 'Master');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FACH`
--

CREATE TABLE `FACH` (
  `IDFACH` varchar(2) NOT NULL,
  `UNFACH` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `FACH`
--

INSERT INTO `FACH` (`IDFACH`, `UNFACH`) VALUES
('00', 'Informatik'),
('01', 'Mathematik'),
('02', 'Physik'),
('03', 'Biologie'),
('04', 'Chemie'),
('05', 'Geographie'),
('06', 'Geschichte'),
('07', 'Philosophie'),
('08', 'Pädagogik'),
('09', 'Wirtschaft und Recht'),
('10', 'Rechnungswesen'),
('11', 'Deutsch'),
('12', 'Englisch'),
('13', 'Französisch'),
('14', 'Italienisch'),
('15', 'Spanisch'),
('16', 'Bildnerisches Gestalten'),
('17', 'Musik'),
('18', 'Berufskunde');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `KTKT`
--

CREATE TABLE `KTKT` (
  `IDKTKT` int(16) NOT NULL,
  `EMAILA` varchar(50) NOT NULL,
  `FEMALE` tinyint(1) NOT NULL,
  `VRNAME` varchar(50) NOT NULL,
  `NARICT` varchar(500) NOT NULL,
  `TIMEST` timestamp NOT NULL DEFAULT current_timestamp(),
  `ISNEW` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `KTKT`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `LEHR`
--

CREATE TABLE `LEHR` (
  `IDLEHR` varchar(16) NOT NULL,
  `EMAILA` varchar(50) NOT NULL,
  `FEMALE` tinyint(1) NOT NULL,
  `VRNAME` varchar(50) NOT NULL,
  `NANAME` varchar(50) NOT NULL,
  `ADRESS` varchar(50) NOT NULL,
  `POSTLZ` varchar(10) NOT NULL,
  `WHNORT` varchar(50) NOT NULL,
  `TLFNNR` varchar(50) DEFAULT NULL,
  `IDAUST` varchar(2) NOT NULL,
  `ARIDFA` varchar(255) DEFAULT NULL,
  `NAHIOR` varchar(255) DEFAULT NULL,
  `ARIDMO` varchar(255) DEFAULT NULL,
  `ACUNTI` tinyint(1) NOT NULL DEFAULT 1,
  `ACBEGE` tinyint(1) NOT NULL DEFAULT 0,
  `IDNAHI` varchar(2) NOT NULL,
  `ACNHER` tinyint(1) NOT NULL DEFAULT 0,
  `ANZLEK` int(8) NOT NULL DEFAULT 0,
  `ACPRBI` tinyint(1) NOT NULL DEFAULT 0,
  `ACAUSW` tinyint(1) NOT NULL DEFAULT 0,
  `BEMERK` varchar(500) DEFAULT NULL,
  `REGTST` timestamp NOT NULL DEFAULT current_timestamp(),
  `LASMOD` timestamp NULL DEFAULT NULL,
  `LASLOG` timestamp NULL DEFAULT NULL,
  `LASUPD` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACREPW` tinyint(1) NOT NULL DEFAULT 0,
  `ISNEW` tinyint(4) NOT NULL DEFAULT 1,
  `DELETD` tinyint(1) NOT NULL DEFAULT 0,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `LEHR`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MITA`
--

CREATE TABLE `MITA` (
  `IDMITA` varchar(16) NOT NULL,
  `EMAILA` varchar(50) NOT NULL,
  `FEMALE` tinyint(1) NOT NULL,
  `VRNAME` varchar(50) NOT NULL,
  `NANAME` varchar(50) NOT NULL,
  `ADRESS` varchar(50) NOT NULL,
  `POSTLZ` varchar(10) NOT NULL,
  `WHNORT` varchar(50) NOT NULL,
  `TLFNNR` varchar(50) DEFAULT NULL,
  `ACPRBI` tinyint(1) NOT NULL DEFAULT 0,
  `ACAUSW` tinyint(1) NOT NULL DEFAULT 0,
  `BEMERK` varchar(500) DEFAULT NULL,
  `REGTST` timestamp NOT NULL DEFAULT current_timestamp(),
  `LASMOD` timestamp NULL DEFAULT NULL,
  `LASLOG` timestamp NULL DEFAULT NULL,
  `LASUPD` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACREPW` tinyint(1) NOT NULL DEFAULT 0,
  `DELETD` tinyint(1) NOT NULL DEFAULT 0,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `MITA`
--

INSERT INTO `MITA` (`IDMITA`, `EMAILA`, `FEMALE`, `VRNAME`, `NANAME`, `ADRESS`, `POSTLZ`, `WHNORT`, `TLFNNR`, `ACPRBI`, `ACAUSW`, `BEMERK`, `REGTST`, `LASMOD`, `LASLOG`, `LASUPD`, `ACREPW`, `DELETD`, `ACTIVE`) VALUES
('5555555555555555', 'locher@faithpro.ch', 0, 'Christian', 'Locher', 'Wyhaldeweg 5', '3629', 'Oppligen', '+41 79 575 65 55', 0, 0, '', '2024-05-03 19:35:07', NULL, NULL, '2024-08-06 21:13:05', 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MOBI`
--

CREATE TABLE `MOBI` (
  `IDMOBI` varchar(2) NOT NULL,
  `MOBILI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `MOBI`
--

INSERT INTO `MOBI` (`IDMOBI`, `MOBILI`) VALUES
('00', 'ÖV'),
('01', 'Velo'),
('02', 'E-Bike'),
('03', 'Auto, Motorrad, Roller');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `NAHI`
--

CREATE TABLE `NAHI` (
  `IDNAHI` varchar(2) NOT NULL,
  `NACHHI` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `NAHI`
--

INSERT INTO `NAHI` (`IDNAHI`, `NACHHI`) VALUES
('00', 'Beides'),
('01', 'Vor Ort'),
('02', 'Online');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SCHU`
--

CREATE TABLE `SCHU` (
  `IDSCHU` varchar(16) NOT NULL,
  `EMAILA` varchar(50) NOT NULL,
  `FEMALE` tinyint(1) NOT NULL,
  `VRNAME` varchar(50) NOT NULL,
  `NANAME` varchar(50) NOT NULL,
  `ADRESS` varchar(50) NOT NULL,
  `POSTLZ` varchar(10) NOT NULL,
  `WHNORT` varchar(50) NOT NULL,
  `TLFNNR` varchar(50) DEFAULT NULL,
  `IDAUST` varchar(2) NOT NULL,
  `ARIDFA` varchar(255) DEFAULT NULL,
  `IDNAHI` varchar(2) NOT NULL,
  `ANZLEK` int(8) NOT NULL DEFAULT 0,
  `ACPRBI` tinyint(1) NOT NULL DEFAULT 0,
  `ACAUSW` tinyint(1) NOT NULL DEFAULT 0,
  `BEMERK` varchar(500) DEFAULT NULL,
  `REGTST` timestamp NOT NULL DEFAULT current_timestamp(),
  `LASMOD` timestamp NULL DEFAULT NULL,
  `LASLOG` timestamp NULL DEFAULT NULL,
  `LASUPD` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACREPW` tinyint(1) NOT NULL DEFAULT 0,
  `ISNEW` tinyint(1) NOT NULL DEFAULT 1,
  `DELETD` tinyint(1) NOT NULL DEFAULT 0,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `SCHU`
--

-- Deleted!

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `AUST`
--
ALTER TABLE `AUST`
  ADD PRIMARY KEY (`IDAUST`);

--
-- Indizes für die Tabelle `FACH`
--
ALTER TABLE `FACH`
  ADD PRIMARY KEY (`IDFACH`);

--
-- Indizes für die Tabelle `KTKT`
--
ALTER TABLE `KTKT`
  ADD PRIMARY KEY (`IDKTKT`);

--
-- Indizes für die Tabelle `LEHR`
--
ALTER TABLE `LEHR`
  ADD PRIMARY KEY (`IDLEHR`);

--
-- Indizes für die Tabelle `MITA`
--
ALTER TABLE `MITA`
  ADD PRIMARY KEY (`IDMITA`);

--
-- Indizes für die Tabelle `MOBI`
--
ALTER TABLE `MOBI`
  ADD PRIMARY KEY (`IDMOBI`);

--
-- Indizes für die Tabelle `NAHI`
--
ALTER TABLE `NAHI`
  ADD PRIMARY KEY (`IDNAHI`);

--
-- Indizes für die Tabelle `SCHU`
--
ALTER TABLE `SCHU`
  ADD PRIMARY KEY (`IDSCHU`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `KTKT`
--
ALTER TABLE `KTKT`
  MODIFY `IDKTKT` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
