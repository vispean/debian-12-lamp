-- LEHR -> tutor
RENAME TABLE LEHR TO tutor;
ALTER TABLE tutor
RENAME COLUMN IDLEHR TO id;
ALTER TABLE tutor
MODIFY COLUMN id bigint(16);
ALTER TABLE tutor
RENAME COLUMN EMAILA TO email;
ALTER TABLE tutor
RENAME COLUMN FEMALE TO is_female;
ALTER TABLE tutor
RENAME COLUMN VRNAME TO first_name;
ALTER TABLE tutor
RENAME COLUMN NANAME TO last_name;
ALTER TABLE tutor
RENAME COLUMN TLFNNR TO phone_number;
ALTER TABLE tutor
RENAME COLUMN IDAUST TO id_education_level;
ALTER TABLE tutor
MODIFY COLUMN id_education_level tinyint(2);
ALTER TABLE tutor
RENAME COLUMN ACUNTI TO is_tutoring;
ALTER TABLE tutor
RENAME COLUMN ACBEGE TO check_initial_talk;
ALTER TABLE tutor
RENAME COLUMN IDNAHI TO id_tutoring_type;
ALTER TABLE tutor
MODIFY COLUMN id_tutoring_type tinyint(2);
ALTER TABLE tutor
RENAME COLUMN ACNHER TO has_tutoring_experience;
ALTER TABLE tutor
RENAME COLUMN ANZLEK TO amount_of_tutoring_lessons;
ALTER TABLE tutor
RENAME COLUMN ACPRBI TO has_profile_picture;
ALTER TABLE tutor
RENAME COLUMN ACAUSW TO check_id;
ALTER TABLE tutor
RENAME COLUMN BEMERK TO remarks;
ALTER TABLE tutor
RENAME COLUMN REGTST TO time_of_registration;
ALTER TABLE tutor
RENAME COLUMN LASMOD TO time_of_last_modification;
ALTER TABLE tutor
RENAME COLUMN LASLOG TO time_of_last_log_in;
ALTER TABLE tutor
RENAME COLUMN LASUPD TO time_of_last_update;
ALTER TABLE tutor
RENAME COLUMN ACREPW TO needs_password_change;
ALTER TABLE tutor
RENAME COLUMN ISNEW TO is_new;
ALTER TABLE tutor
RENAME COLUMN DELETD TO is_deleted;
ALTER TABLE tutor
RENAME COLUMN ACTIVE TO is_active;
ALTER TABLE tutor
ADD place_of_residence varchar(16);
ALTER TABLE tutor
ADD place_of_tutoring varchar(16);
ALTER TABLE tutor
MODIFY COLUMN time_of_last_modification
timestamp COMMENT 'update by a human specifically';

-- SCHU -> student
RENAME TABLE SCHU TO student;
ALTER TABLE student
RENAME COLUMN IDSCHU TO id;
ALTER TABLE student
MODIFY COLUMN id bigint(16);
ALTER TABLE student
RENAME COLUMN EMAILA TO email;
ALTER TABLE student
RENAME COLUMN FEMALE TO is_female;
ALTER TABLE student
RENAME COLUMN VRNAME TO first_name;
ALTER TABLE student
RENAME COLUMN NANAME TO last_name;
ALTER TABLE student
RENAME COLUMN TLFNNR TO phone_number;
ALTER TABLE student
RENAME COLUMN IDAUST TO id_education_level;
ALTER TABLE student
MODIFY COLUMN id_education_level tinyint(2);
ALTER TABLE student
RENAME COLUMN IDNAHI TO id_tutoring_type;
ALTER TABLE student
MODIFY COLUMN id_tutoring_type tinyint(2);
ALTER TABLE student
RENAME COLUMN ANZLEK TO amount_of_tutoring_lessons;
ALTER TABLE student
RENAME COLUMN ACPRBI TO has_profile_picture;
ALTER TABLE student
RENAME COLUMN ACAUSW TO check_id;
ALTER TABLE student
RENAME COLUMN BEMERK TO remarks;
ALTER TABLE student
RENAME COLUMN REGTST TO time_of_registration;
ALTER TABLE student
RENAME COLUMN LASMOD TO time_of_last_modification;
ALTER TABLE student
RENAME COLUMN LASLOG TO time_of_last_log_in;
ALTER TABLE student
RENAME COLUMN LASUPD TO time_of_last_update;
ALTER TABLE student
RENAME COLUMN ACREPW TO needs_password_change;
ALTER TABLE student
RENAME COLUMN ISNEW TO is_new;
ALTER TABLE student
RENAME COLUMN DELETD TO is_deleted;
ALTER TABLE student
RENAME COLUMN ACTIVE TO is_active;
ALTER TABLE student
ADD place_of_residence varchar(16);
ALTER TABLE student
ADD place_of_tutoring varchar(16);
ALTER TABLE student
ADD is_being_tutored tinyint(1);
ALTER TABLE student
ADD discount int(3);
ALTER TABLE student
MODIFY COLUMN time_of_last_modification
timestamp COMMENT 'update by a human specifically';

-- MITA -> manager
RENAME TABLE MITA TO manager;
ALTER TABLE manager
RENAME COLUMN IDMITA TO id;
ALTER TABLE manager
MODIFY COLUMN id bigint(16);
ALTER TABLE manager
RENAME COLUMN EMAILA TO email;
ALTER TABLE manager
RENAME COLUMN FEMALE TO is_female;
ALTER TABLE manager
RENAME COLUMN VRNAME TO first_name;
ALTER TABLE manager
RENAME COLUMN NANAME TO last_name;
ALTER TABLE manager
RENAME COLUMN TLFNNR TO phone_number;
ALTER TABLE manager
RENAME COLUMN ACPRBI TO has_profile_picture;
ALTER TABLE manager
RENAME COLUMN BEMERK TO remarks;
ALTER TABLE manager
RENAME COLUMN REGTST TO time_of_registration;
ALTER TABLE manager
RENAME COLUMN LASMOD TO time_of_last_modification;
ALTER TABLE manager
RENAME COLUMN LASLOG TO time_of_last_log_in;
ALTER TABLE manager
RENAME COLUMN LASUPD TO time_of_last_update;
ALTER TABLE manager
RENAME COLUMN ACREPW TO needs_password_change;
ALTER TABLE manager
RENAME COLUMN DELETD TO is_deleted;
ALTER TABLE manager
RENAME COLUMN ACTIVE TO is_active;
ALTER TABLE manager
ADD place_of_residence varchar(16);
ALTER TABLE manager
MODIFY COLUMN time_of_last_modification
timestamp COMMENT 'update by a human specifically';

-- AUST -> education_level
RENAME TABLE AUST TO education_level;
ALTER TABLE education_level
RENAME COLUMN IDAUST TO id;
ALTER TABLE education_level
MODIFY COLUMN id tinyint(2);
ALTER TABLE education_level
RENAME COLUMN AUBIST TO education_level;
ALTER TABLE education_level
ADD lesson_price int(3);

-- FACH -> subject
RENAME TABLE FACH TO subject;
ALTER TABLE subject
RENAME COLUMN IDFACH TO id;
ALTER TABLE subject
MODIFY COLUMN id tinyint(2);
ALTER TABLE subject
RENAME COLUMN UNFACH TO subject;

-- MOBI -> moblity
RENAME TABLE MOBI TO mobility;
ALTER TABLE mobility
RENAME COLUMN IDMOBI TO id;
ALTER TABLE mobility
MODIFY COLUMN id tinyint(2);
ALTER TABLE mobility
RENAME COLUMN MOBILI TO mobility;

-- NAHI -> tutoring_type
RENAME TABLE NAHI TO tutoring_type;
ALTER TABLE tutoring_type
RENAME COLUMN IDNAHI TO id;
ALTER TABLE tutoring_type
MODIFY COLUMN id tinyint(2);
ALTER TABLE tutoring_type
RENAME COLUMN NACHHI TO tutoring_type;

-- KTKT -> contact_external
RENAME TABLE KTKT TO contact_external;
ALTER TABLE contact_external
RENAME COLUMN IDKTKT TO id;
ALTER TABLE contact_external
MODIFY COLUMN id bigint(16) AUTO_INCREMENT;
ALTER TABLE contact_external
RENAME COLUMN EMAILA TO email;
ALTER TABLE contact_external
RENAME COLUMN FEMALE TO is_female;
ALTER TABLE contact_external
RENAME COLUMN VRNAME TO first_name;
ALTER TABLE contact_external
RENAME COLUMN NARICT TO message;
ALTER TABLE contact_external
RENAME COLUMN TIMEST TO time_of_contact;
ALTER TABLE contact_external
RENAME COLUMN ISNEW TO is_new;

-- location
CREATE TABLE `location` (
  `id` bigint(16) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COMMENT 'label on map',
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `address` varchar(50),
  `postal_code` varchar(10),
  `location` varchar(50),
  `canton` varchar(2),
  `is_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'on Google Maps'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutoring
CREATE TABLE `tutoring` (
  `id_student` bigint(16) NOT NULL,
  `id_tutor` bigint(16) NOT NULL,
  `is_in_trial` tinyint(1) NOT NULL DEFAULT 1,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_student`, `id_tutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutoring_session
CREATE TABLE `tutoring_session` (
  `id` bigint(16) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tutor` bigint(16) NOT NULL,
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  `id_education_level` tinyint(2) NOT NULL,
  `id_tutoring_type` tinyint(2) NOT NULL,
  `place_of_tutoring` bigint(16) DEFAULT NULL,
  `is_trial` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutoring_suggestion
CREATE TABLE `tutoring_suggestion` (
  `id` bigint(16) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tutor` bigint(16) NOT NULL,
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  `id_education_level` tinyint(2) NOT NULL,
  `id_tutoring_type` tinyint(2) NOT NULL,
  `place_of_tutoring` bigint(16) DEFAULT NULL,
  `is_accepted_by_student` tinyint(1) DEFAULT 0,
  `is_accepted_by_tutor` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutor_knows_subject
CREATE TABLE `tutor_knows_subject` (
  `id_tutor` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_tutor`, `id_subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- student_wants_subject
CREATE TABLE `student_wants_subject` (
  `id_student` bigint(16) NOT NULL,
  `id_subject` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_student`, `id_subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- language
CREATE TABLE `language` (
  `id` tinyint(2) PRIMARY KEY NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutor_knows_language
CREATE TABLE `tutor_knows_language` (
  `id_tutor` bigint(16) NOT NULL,
  `id_language` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_tutor`, `id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- student_knows_language
CREATE TABLE `student_knows_language` (
  `id_student` bigint(16) NOT NULL,
  `id_language` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_student`, `id_language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- tutor_has_mobility
CREATE TABLE `tutor_has_mobility` (
  `id_tutor` bigint(16) NOT NULL,
  `id_mobility` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_tutor`, `id_mobility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- contact_tutor
CREATE TABLE `contact_tutor` (
  `id` bigint(16) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_tutor` bigint(16) NOT NULL,
  `id_contact_type` tinyint(2) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time_of_contact` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- contact_student
CREATE TABLE `contact_student` (
  `id` bigint(16) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_student` bigint(16) NOT NULL,
  `id_contact_type` tinyint(2) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time_of_contact` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_new` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- contact_type
CREATE TABLE `contact_type` (
  `id` tinyint(2) PRIMARY KEY NOT NULL,
  `contact_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
