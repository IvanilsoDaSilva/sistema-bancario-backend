-- Comandos FUNCTION


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER //


-- -----------------------------------------------------
-- FUNCTION
-- -----------------------------------------------------
DROP FUNCTION IF EXISTS FORMATER//
CREATE FUNCTION FORMATER(text VARCHAR(255)) RETURNS VARCHAR(255) BEGIN
	RETURN (UPPER(LTRIM(RTRIM(text))));
END//


-- -----------------------------------------------------
-- ROUTINES
-- -----------------------------------------------------
SELECT routine_name FROM information_schema.routines;


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER ;