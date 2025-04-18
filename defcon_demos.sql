-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 03:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `defcon_demos`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_deletion_requests`
--

CREATE TABLE `account_deletion_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_requests`
--

CREATE TABLE `blacklist_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dedcon_builds`
--

CREATE TABLE `dedcon_builds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `release_date` datetime NOT NULL,
  `size` bigint(20) NOT NULL,
  `platform` varchar(20) NOT NULL,
  `player_count` varchar(10) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `download_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_demos`
--

CREATE TABLE `deleted_demos` (
  `id` int(11) NOT NULL,
  `demo_name` varchar(255) NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demos`
--

CREATE TABLE `demos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `log_file` varchar(255) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `size` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `game_type` varchar(60) DEFAULT NULL,
  `players` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`players`)),
  `last_alliance` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`last_alliance`)),
  `player1_name` varchar(255) DEFAULT NULL,
  `player1_team` int(11) DEFAULT NULL,
  `player1_score` int(11) DEFAULT NULL,
  `player1_territory` varchar(255) DEFAULT NULL,
  `player1_key_id` varchar(255) DEFAULT NULL,
  `player2_name` varchar(255) DEFAULT NULL,
  `player2_team` int(11) DEFAULT NULL,
  `player2_score` int(11) DEFAULT NULL,
  `player2_territory` varchar(255) DEFAULT NULL,
  `player2_key_id` varchar(255) DEFAULT NULL,
  `player3_name` varchar(255) DEFAULT NULL,
  `player3_team` int(11) DEFAULT NULL,
  `player3_score` int(11) DEFAULT NULL,
  `player3_territory` varchar(255) DEFAULT NULL,
  `player3_key_id` varchar(255) DEFAULT NULL,
  `player4_name` varchar(255) DEFAULT NULL,
  `player4_team` int(11) DEFAULT NULL,
  `player4_score` int(11) DEFAULT NULL,
  `player4_territory` varchar(255) DEFAULT NULL,
  `player4_key_id` varchar(255) DEFAULT NULL,
  `player5_name` varchar(255) DEFAULT NULL,
  `player5_team` int(11) DEFAULT NULL,
  `player5_score` int(11) DEFAULT NULL,
  `player5_territory` varchar(255) DEFAULT NULL,
  `player5_key_id` varchar(255) DEFAULT NULL,
  `player6_name` varchar(255) DEFAULT NULL,
  `player6_team` int(11) DEFAULT NULL,
  `player6_score` int(11) DEFAULT NULL,
  `player6_territory` varchar(255) DEFAULT NULL,
  `player6_key_id` varchar(255) DEFAULT NULL,
  `player7_name` varchar(255) DEFAULT NULL,
  `player7_team` int(11) DEFAULT NULL,
  `player7_score` int(11) DEFAULT NULL,
  `player7_territory` varchar(255) DEFAULT NULL,
  `player7_key_id` varchar(255) DEFAULT NULL,
  `player8_name` varchar(255) DEFAULT NULL,
  `player8_team` int(11) DEFAULT NULL,
  `player8_score` int(11) DEFAULT NULL,
  `player8_territory` varchar(255) DEFAULT NULL,
  `player8_key_id` varchar(255) DEFAULT NULL,
  `player9_name` varchar(255) DEFAULT NULL,
  `player9_team` int(11) DEFAULT NULL,
  `player9_score` int(11) DEFAULT NULL,
  `player9_territory` varchar(255) DEFAULT NULL,
  `player9_key_id` varchar(255) DEFAULT NULL,
  `player10_name` varchar(255) DEFAULT NULL,
  `player10_team` int(11) DEFAULT NULL,
  `player10_score` int(11) DEFAULT NULL,
  `player10_territory` varchar(255) DEFAULT NULL,
  `player10_key_id` varchar(255) DEFAULT NULL,
  `download_count` int(11) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Table structure for table `demo_reports`
--

CREATE TABLE `demo_reports` (
  `id` int(11) NOT NULL,
  `demo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `status` enum('pending','resolved') DEFAULT 'pending',
  `report_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_change_requests`
--

CREATE TABLE `email_change_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `requested_email` varchar(255) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `key_id` varchar(255) DEFAULT NULL,
  `games_played` int(11) DEFAULT 0,
  `wins` int(11) DEFAULT 0,
  `losses` int(11) DEFAULT 0,
  `total_score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard_name_change_requests`
--

CREATE TABLE `leaderboard_name_change_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `requested_name` varchar(255) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard_whitelist`
--

CREATE TABLE `leaderboard_whitelist` (
  `id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modlist`
--

CREATE TABLE `modlist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('ai','map','tool','overhaul','graphics') NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `likes_count` int(11) DEFAULT 0,
  `favorites_count` int(11) DEFAULT 0,
  `compatibility` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `download_count` int(11) DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `preview_image_path` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- --------------------------------------------------------

--
-- Table structure for table `mod_favorites`
--

CREATE TABLE `mod_favorites` (
  `id` int(11) NOT NULL,
  `mod_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mod_likes`
--

CREATE TABLE `mod_likes` (
  `id` int(11) NOT NULL,
  `mod_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mod_reports`
--

CREATE TABLE `mod_reports` (
  `id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `status` enum('pending','resolved') DEFAULT 'pending',
  `report_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` bigint(20) NOT NULL,
  `upload_date` datetime NOT NULL,
  `date` datetime NOT NULL,
  `version` varchar(50) NOT NULL,
  `platform` varchar(20) DEFAULT NULL,
  `player_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `username_change_requests`
--

CREATE TABLE `username_change_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `requested_username` varchar(255) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT 6,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verification_token` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `reset_token_expiry` bigint(20) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `defcon_username` varchar(255) DEFAULT NULL,
  `years_played` int(11) DEFAULT 0,
  `bio` text DEFAULT NULL,
  `blacklist_from_leaderboard` tinyint(1) DEFAULT 0,
  `application_form` text DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `discord_username` varchar(255) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL,
  `contributions` text DEFAULT NULL,
  `favorites` varchar(255) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `main_contributions` text DEFAULT NULL,
  `guides_and_mods` text DEFAULT NULL,
  `record_score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_deletion_requests`
--
ALTER TABLE `account_deletion_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `blacklist_requests`
--
ALTER TABLE `blacklist_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `dedcon_builds`
--
ALTER TABLE `dedcon_builds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_demos`
--
ALTER TABLE `deleted_demos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_demo_name` (`demo_name`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `demos`
--
ALTER TABLE `demos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo_reports`
--
ALTER TABLE `demo_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demo_id` (`demo_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `email_change_requests`
--
ALTER TABLE `email_change_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_name` (`player_name`),
  ADD UNIQUE KEY `key_id` (`key_id`);

--
-- Indexes for table `leaderboard_name_change_requests`
--
ALTER TABLE `leaderboard_name_change_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `leaderboard_whitelist`
--
ALTER TABLE `leaderboard_whitelist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_name` (`player_name`);

--
-- Indexes for table `modlist`
--
ALTER TABLE `modlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mod_favorites`
--
ALTER TABLE `mod_favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mod_id` (`mod_id`,`user_id`);

--
-- Indexes for table `mod_likes`
--
ALTER TABLE `mod_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mod_id` (`mod_id`,`user_id`);

--
-- Indexes for table `mod_reports`
--
ALTER TABLE `mod_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mod_id` (`mod_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `username_change_requests`
--
ALTER TABLE `username_change_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_deletion_requests`
--
ALTER TABLE `account_deletion_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blacklist_requests`
--
ALTER TABLE `blacklist_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dedcon_builds`
--
ALTER TABLE `dedcon_builds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `deleted_demos`
--
ALTER TABLE `deleted_demos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `demos`
--
ALTER TABLE `demos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1223;

--
-- AUTO_INCREMENT for table `demo_reports`
--
ALTER TABLE `demo_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_change_requests`
--
ALTER TABLE `email_change_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `leaderboard_name_change_requests`
--
ALTER TABLE `leaderboard_name_change_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leaderboard_whitelist`
--
ALTER TABLE `leaderboard_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modlist`
--
ALTER TABLE `modlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `mod_favorites`
--
ALTER TABLE `mod_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mod_likes`
--
ALTER TABLE `mod_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `mod_reports`
--
ALTER TABLE `mod_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `username_change_requests`
--
ALTER TABLE `username_change_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deleted_demos`
--
ALTER TABLE `deleted_demos`
  ADD CONSTRAINT `deleted_demos_ibfk_1` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `demo_reports`
--
ALTER TABLE `demo_reports`
  ADD CONSTRAINT `demo_reports_ibfk_1` FOREIGN KEY (`demo_id`) REFERENCES `demos` (`id`),
  ADD CONSTRAINT `demo_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mod_reports`
--
ALTER TABLE `mod_reports`
  ADD CONSTRAINT `mod_reports_ibfk_1` FOREIGN KEY (`mod_id`) REFERENCES `modlist` (`id`),
  ADD CONSTRAINT `mod_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
