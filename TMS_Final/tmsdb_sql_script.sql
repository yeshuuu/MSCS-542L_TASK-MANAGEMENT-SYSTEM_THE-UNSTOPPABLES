-- MySQL Script generated by MySQL Workbench
-- Wed Dec  7 00:30:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tmsdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tmsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tmsdb` DEFAULT CHARACTER SET latin1 ;
USE `tmsdb` ;

-- -----------------------------------------------------
-- Table `tmsdb`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`media` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` VARCHAR(191) NOT NULL,
  `model_id` BIGINT(20) UNSIGNED NOT NULL,
  `uuid` CHAR(36) NULL DEFAULT NULL,
  `collection_name` VARCHAR(191) NOT NULL,
  `name` VARCHAR(191) NOT NULL,
  `file_name` VARCHAR(191) NOT NULL,
  `mime_type` VARCHAR(191) NULL DEFAULT NULL,
  `disk` VARCHAR(191) NOT NULL,
  `conversions_disk` VARCHAR(191) NULL DEFAULT NULL,
  `size` BIGINT(20) UNSIGNED NOT NULL,
  `manipulations` JSON NOT NULL,
  `custom_properties` JSON NOT NULL,
  `generated_conversions` JSON NOT NULL,
  `responsive_images` JSON NOT NULL,
  `order_column` INT(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `media_uuid_unique` (`uuid` ASC) VISIBLE,
  INDEX `media_model_type_model_id_index` (`model_type` ASC, `model_id` ASC) VISIBLE,
  INDEX `media_order_column_index` (`order_column` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(191) NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`password_resets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`password_resets` (
  `email` VARCHAR(191) NOT NULL,
  `token` VARCHAR(191) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`permission_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`permission_role` (
  `role_id` BIGINT(20) UNSIGNED NOT NULL,
  `permission_id` BIGINT(20) UNSIGNED NOT NULL,
  INDEX `role_id_fk_7630256` (`role_id` ASC) VISIBLE,
  INDEX `permission_id_fk_7630256` (`permission_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`permissions` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`personal_access_tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`personal_access_tokens` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` VARCHAR(191) NOT NULL,
  `tokenable_id` BIGINT(20) UNSIGNED NOT NULL,
  `name` VARCHAR(191) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL DEFAULT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `personal_access_tokens_token_unique` (`token` ASC) VISIBLE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type` ASC, `tokenable_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`role_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`role_user` (
  `user_id` BIGINT(20) UNSIGNED NOT NULL,
  `role_id` BIGINT(20) UNSIGNED NOT NULL,
  INDEX `user_id_fk_7630265` (`user_id` ASC) VISIBLE,
  INDEX `role_id_fk_7630265` (`role_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`roles` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`task_statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`task_statuses` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`task_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`task_tags` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`task_task_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`task_task_tag` (
  `task_id` BIGINT(20) UNSIGNED NOT NULL,
  `task_tag_id` BIGINT(20) UNSIGNED NOT NULL,
  INDEX `task_id_fk_7630324` (`task_id` ASC) VISIBLE,
  INDEX `task_tag_id_fk_7630324` (`task_tag_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`tasks` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `due_date` DATE NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `status_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `assigned_to_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `status_fk_7630323` (`status_id` ASC) VISIBLE,
  INDEX `assigned_to_fk_7630327` (`assigned_to_id` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`user_alerts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`user_alerts` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alert_text` VARCHAR(191) NOT NULL,
  `alert_link` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`user_user_alert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`user_user_alert` (
  `user_alert_id` BIGINT(20) UNSIGNED NOT NULL,
  `user_id` BIGINT(20) UNSIGNED NOT NULL,
  `read` TINYINT(1) NOT NULL DEFAULT '0',
  INDEX `user_alert_id_fk_7630291` (`user_alert_id` ASC) VISIBLE,
  INDEX `user_id_fk_7630291` (`user_id` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `tmsdb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmsdb`.`users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(191) NOT NULL,
  `email` VARCHAR(191) NOT NULL,
  `email_verified_at` DATETIME NULL DEFAULT NULL,
  `password` VARCHAR(191) NOT NULL,
  `remember_token` VARCHAR(191) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
