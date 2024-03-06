-- Comandos FUNCTION


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER //


-- -----------------------------------------------------
-- Table FUNCTION
-- -----------------------------------------------------
DROP FUNCTION IF EXISTS FORMAT//
CREATE FUNCTION FORMAT(text VARCHAR(255)) RETURNS VARCHAR(255) BEGIN
	RETURN (UPPER(LTRIM(RTRIM(text))));
END//


-- -----------------------------------------------------
-- Table ROUTINES
-- -----------------------------------------------------
SELECT specific_name FROM information_schema.routines;