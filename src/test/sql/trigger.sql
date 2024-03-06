-- Comandos TRIGGER


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER //


-- -----------------------------------------------------
-- TRIGGER
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS update_balance//
CREATE TRIGGER update_balance BEFORE INSERT ON `sistema_bancario_backend_teste`.`operation` FOR EACH ROW BEGIN
    SET NEW.balance = NEW.balance+10.00;
END//


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER ;