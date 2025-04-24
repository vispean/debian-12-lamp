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
-- Tabellenstruktur für Tabelle `contact_external`
--

CREATE TABLE `contact_external` (
  `id` bigint(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_female` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time_of_contact` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `contact_external`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_student`
--

CREATE TABLE `contact_student` (
  `id` bigint(16) NOT NULL,
  `id_student` bigint(16) NOT NULL,
  `id_contact_type` tinyint(2) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time_of_contact` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_tutor`
--

CREATE TABLE `contact_tutor` (
  `id` bigint(16) NOT NULL,
  `id_tutor` bigint(16) NOT NULL,
  `id_contact_type` tinyint(2) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time_of_contact` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_type`
--

CREATE TABLE `contact_type` (
  `id` tinyint(2) NOT NULL,
  `contact_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `education_level`
--

CREATE TABLE `education_level` (
  `id` tinyint(2) NOT NULL,
  `education_level` varchar(255) NOT NULL,
  `lesson_price` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `education_level`
--

INSERT INTO `education_level` (`id`, `education_level`, `lesson_price`) VALUES
(0, '1. - 6. Klasse', NULL),
(1, '7. Klasse', NULL),
(2, '8. Klasse', NULL),
(3, '9. Klasse (nicht Gymnasium)', NULL),
(4, '1. Jahr FMS', NULL),
(5, '2. Jahr FMS', NULL),
(6, '3. Jahr FMS', NULL),
(7, '1. Jahr Gymnasium', NULL),
(8, '2. Jahr Gymnasium', NULL),
(9, '3. Jahr Gymnasium', NULL),
(10, '4. Jahr Gymnasium', NULL),
(11, 'Berufsmaturität', NULL),
(12, '1. Jahr Berufsschule', NULL),
(13, '2. Jahr Berufsschule', NULL),
(14, '3. Jahr Berufsschule', NULL),
(15, 'Bachelor', NULL),
(16, 'Master', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `language`
--

CREATE TABLE `language` (
  `id` tinyint(2) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `id` bigint(16) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT 'label on map',
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `canton` varchar(2) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'on Google Maps'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`id`, `name`, `latitude`, `longitude`, `address`, `postal_code`, `location`, `canton`, `is_verified`) VALUES
(1, NULL, 46.819241, 7.599873, 'Wyhaldeweg 5', '3629', 'Oppligen', 'BE', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manager`
--

CREATE TABLE `manager` (
  `id` bigint(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_female` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `has_profile_picture` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `time_of_registration` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_of_last_modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'update by a human specifically',
  `time_of_last_log_in` timestamp NULL DEFAULT NULL,
  `time_of_last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `needs_password_change` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `place_of_residence` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `manager`
--

INSERT INTO `manager` (`id`, `email`, `is_female`, `first_name`, `last_name`, `phone_number`, `has_profile_picture`, `remarks`, `time_of_registration`, `time_of_last_modification`, `time_of_last_log_in`, `time_of_last_update`, `needs_password_change`, `is_deleted`, `is_active`, `place_of_residence`) VALUES
(5555555555555555, 'locher@faithpro.ch', 0, 'Christian', 'Locher', '+41 79 575 65 55', 0, '', '2024-05-03 19:35:07', '2025-04-22 01:37:00', NULL, '2025-04-22 01:55:17', 0, 0, 1, '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mobility`
--

CREATE TABLE `mobility` (
  `id` tinyint(2) NOT NULL,
  `mobility` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `mobility`
--

INSERT INTO `mobility` (`id`, `mobility`) VALUES
(0, 'ÖV'),
(1, 'Velo'),
(2, 'E-Bike'),
(3, 'Auto, Motorrad, Roller');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `id` bigint(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_female` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `id_education_level` tinyint(2) DEFAULT NULL,
  `id_tutoring_type` tinyint(2) DEFAULT NULL,
  `amount_of_tutoring_lessons` int(8) NOT NULL DEFAULT 0,
  `has_profile_picture` tinyint(1) NOT NULL DEFAULT 0,
  `check_id` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `time_of_registration` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_of_last_modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'update by a human specifically',
  `time_of_last_log_in` timestamp NULL DEFAULT NULL,
  `time_of_last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `needs_password_change` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `place_of_residence` varchar(16) DEFAULT NULL,
  `place_of_tutoring` varchar(16) DEFAULT NULL,
  `is_being_tutored` tinyint(1) DEFAULT NULL,
  `discount` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `student`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student_knows_language`
--

CREATE TABLE `student_knows_language` (
  `id_student` bigint(16) NOT NULL,
  `id_language` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student_wants_subject`
--

CREATE TABLE `student_wants_subject` (
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `student_wants_subject`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `id` tinyint(2) NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `subject`
--

INSERT INTO `subject` (`id`, `subject`) VALUES
(0, 'Informatik'),
(1, 'Mathematik'),
(2, 'Physik'),
(3, 'Biologie'),
(4, 'Chemie'),
(5, 'Geographie'),
(6, 'Geschichte'),
(7, 'Philosophie'),
(8, 'Pädagogik'),
(9, 'Wirtschaft und Recht'),
(10, 'Rechnungswesen'),
(11, 'Deutsch'),
(12, 'Englisch'),
(13, 'Französisch'),
(14, 'Italienisch'),
(15, 'Spanisch'),
(16, 'Bildnerisches Gestalten'),
(17, 'Musik'),
(18, 'Berufskunde');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutor`
--

CREATE TABLE `tutor` (
  `id` bigint(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `is_female` tinyint(1) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `id_education_level` tinyint(2) DEFAULT NULL,
  `is_tutoring` tinyint(1) NOT NULL DEFAULT 1,
  `check_initial_talk` tinyint(1) NOT NULL DEFAULT 0,
  `id_tutoring_type` tinyint(2) DEFAULT NULL,
  `has_tutoring_experience` tinyint(1) NOT NULL DEFAULT 0,
  `amount_of_tutoring_lessons` int(8) NOT NULL DEFAULT 0,
  `has_profile_picture` tinyint(1) NOT NULL DEFAULT 0,
  `check_id` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` varchar(500) DEFAULT NULL,
  `time_of_registration` timestamp NOT NULL DEFAULT current_timestamp(),
  `time_of_last_modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'update by a human specifically',
  `time_of_last_log_in` timestamp NULL DEFAULT NULL,
  `time_of_last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `needs_password_change` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(4) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `place_of_residence` varchar(16) DEFAULT NULL,
  `place_of_tutoring` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `tutor`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutoring`
--

CREATE TABLE `tutoring` (
  `id_student` bigint(16) NOT NULL,
  `id_tutor` bigint(16) NOT NULL,
  `is_in_trial` tinyint(1) NOT NULL DEFAULT 1,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutoring_session`
--

CREATE TABLE `tutoring_session` (
  `id` bigint(16) NOT NULL,
  `id_tutor` bigint(16) NOT NULL,
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  `id_education_level` tinyint(2) NOT NULL,
  `id_tutoring_type` tinyint(2) NOT NULL,
  `place_of_tutoring` bigint(16) DEFAULT NULL,
  `is_trial` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutoring_suggestion`
--

CREATE TABLE `tutoring_suggestion` (
  `id` bigint(16) NOT NULL,
  `id_tutor` bigint(16) NOT NULL,
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  `id_education_level` tinyint(2) NOT NULL,
  `id_tutoring_type` tinyint(2) NOT NULL,
  `place_of_tutoring` bigint(16) DEFAULT NULL,
  `is_accepted_by_student` tinyint(1) DEFAULT 0,
  `is_accepted_by_tutor` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutoring_type`
--

CREATE TABLE `tutoring_type` (
  `id` tinyint(2) NOT NULL,
  `tutoring_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `tutoring_type`
--

INSERT INTO `tutoring_type` (`id`, `tutoring_type`) VALUES
(0, 'Beides'),
(1, 'Vor Ort'),
(2, 'Online');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutor_has_mobility`
--

CREATE TABLE `tutor_has_mobility` (
  `id_tutor` bigint(16) NOT NULL,
  `id_mobility` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `tutor_has_mobility`
--

-- Deleted!

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutor_knows_language`
--

CREATE TABLE `tutor_knows_language` (
  `id_tutor` bigint(16) NOT NULL,
  `id_language` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tutor_knows_subject`
--

CREATE TABLE `tutor_knows_subject` (
  `id_tutor` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Daten für Tabelle `tutor_knows_subject`
--

-- Deleted!

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `contact_external`
--
ALTER TABLE `contact_external`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `contact_student`
--
ALTER TABLE `contact_student`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `contact_tutor`
--
ALTER TABLE `contact_tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `contact_type`
--
ALTER TABLE `contact_type`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `education_level`
--
ALTER TABLE `education_level`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `mobility`
--
ALTER TABLE `mobility`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `student_knows_language`
--
ALTER TABLE `student_knows_language`
  ADD PRIMARY KEY (`id_student`,`id_language`);

--
-- Indizes für die Tabelle `student_wants_subject`
--
ALTER TABLE `student_wants_subject`
  ADD PRIMARY KEY (`id_student`,`id_subject`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tutoring`
--
ALTER TABLE `tutoring`
  ADD PRIMARY KEY (`id_student`,`id_tutor`);

--
-- Indizes für die Tabelle `tutoring_session`
--
ALTER TABLE `tutoring_session`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tutoring_suggestion`
--
ALTER TABLE `tutoring_suggestion`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tutoring_type`
--
ALTER TABLE `tutoring_type`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `tutor_has_mobility`
--
ALTER TABLE `tutor_has_mobility`
  ADD PRIMARY KEY (`id_tutor`,`id_mobility`);

--
-- Indizes für die Tabelle `tutor_knows_language`
--
ALTER TABLE `tutor_knows_language`
  ADD PRIMARY KEY (`id_tutor`,`id_language`);

--
-- Indizes für die Tabelle `tutor_knows_subject`
--
ALTER TABLE `tutor_knows_subject`
  ADD PRIMARY KEY (`id_tutor`,`id_subject`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `contact_external`
--
ALTER TABLE `contact_external`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `contact_student`
--
ALTER TABLE `contact_student`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `contact_tutor`
--
ALTER TABLE `contact_tutor`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT für Tabelle `tutoring_session`
--
ALTER TABLE `tutoring_session`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tutoring_suggestion`
--
ALTER TABLE `tutoring_suggestion`
  MODIFY `id` bigint(16) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
