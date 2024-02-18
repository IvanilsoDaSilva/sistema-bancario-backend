CREATE SCHEMA IF NOT EXISTS `sistema_bancario_backend_teste_simples` DEFAULT CHARACTER SET utf8mb4;
USE `sistema_bancario_backend_teste_simples`;

CREATE TABLE IF NOT EXISTS `individual_person` (
	`id` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`cpf` VARCHAR(255) NOT NULL,
	`rg` VARCHAR(255) NULL DEFAULT NULL,
	`birth` DATE NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	UNIQUE INDEX (`cpf` ASC)
);

CREATE TABLE IF NOT EXISTS `address` (
	`id` VARCHAR(255) NOT NULL,
	`city` VARCHAR(255) NULL DEFAULT NULL,
	`complement` VARCHAR(255) NULL DEFAULT NULL,
	`country` VARCHAR(255) NULL DEFAULT NULL,
	`district` VARCHAR(255) NULL DEFAULT NULL,
	`number` VARCHAR(255) NULL DEFAULT NULL,
	`postal_code` VARCHAR(255) NULL DEFAULT NULL,
	`state` VARCHAR(255) NULL DEFAULT NULL,
	`street` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `agency` (
	`id` VARCHAR(255) NOT NULL,
	`address_id` VARCHAR(255) NULL DEFAULT NULL,
	`number` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
	UNIQUE INDEX (`address_id` ASC)
);

CREATE TABLE IF NOT EXISTS `legal_person` (
	`id` VARCHAR(255) NOT NULL,
	`cnpj` VARCHAR(255) NOT NULL,
	`company_name` VARCHAR(255) NOT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	UNIQUE INDEX (`cnpj` ASC)
);

CREATE TABLE IF NOT EXISTS `account` (
	`id` VARCHAR(255) NOT NULL,
	`account_type` TINYINT(4) NULL DEFAULT NULL,
	`balance` DOUBLE NULL DEFAULT NULL,
	`locked` BIT(1) NULL DEFAULT NULL,
	`agency_id` VARCHAR(255) NULL DEFAULT NULL,
	`individual_person_id` VARCHAR(255) NULL DEFAULT NULL,
	`legal_person_id` VARCHAR(255) NULL DEFAULT NULL,
	`number` VARCHAR(255) NULL DEFAULT NULL,
	`password` VARCHAR(255) NOT NULL,
    `created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	FOREIGN KEY (`individual_person_id`) REFERENCES `individual_person` (`id`),
	FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
	FOREIGN KEY (`legal_person_id`) REFERENCES `legal_person` (`id`),
	UNIQUE (`number`),
	INDEX (`agency_id` ASC),
	INDEX (`individual_person_id` ASC),
	INDEX (`legal_person_id` ASC)
);

CREATE TABLE IF NOT EXISTS `log` (
	`id` VARCHAR(255) NOT NULL,
	`ip` VARCHAR(255) NULL DEFAULT NULL,
    `account_id` VARCHAR(255) NULL DEFAULT NULL,
    `address_id` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
	FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
	INDEX `FK503ama154cr4d3cyc7741l4b7` (`account_id` ASC),
	INDEX `FKgfiexhes0mhq1np5lms15iyts` (`address_id` ASC)
);

CREATE TABLE IF NOT EXISTS `operation` (
	`id` VARCHAR(255) NOT NULL,
	`operation_type` TINYINT(4) NULL DEFAULT NULL,
	`balance` DOUBLE NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `account_id` VARCHAR(255) NULL DEFAULT NULL,
    `account_id_receiver` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
	FOREIGN KEY (`account_id_receiver`) REFERENCES `account` (`id`),
	INDEX `FK505amab54cr4d3cyc7741l4uu` (`account_id` ASC),
	INDEX `FFgf1exhes0mhq1np5lms15iyss` (`account_id_receiver` ASC)
);