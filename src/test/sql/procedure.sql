-- Comandos PROCEDURE


-- -----------------------------------------------------
-- Configuração do delimitador
-- -----------------------------------------------------
DELIMITER //


-- -----------------------------------------------------
-- PROCEDURE
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS FORMAT//
CREATE PROCEDURE ADJUSTMENT(minBalanceAdjustment DOUBLE, adjustmentValue DOUBLE) BEGIN
    UPDATE `sistema_bancario_backend_teste`.`account` 
		SET balance = CASE 
			WHEN balance > minBalanceAdjustment THEN balance + balance * adjustmentValue
			ELSE balance
		END
	WHERE balance > minBalanceAdjustment;
END//


-- -----------------------------------------------------
-- ROUTINES
-- -----------------------------------------------------
SELECT routine_name FROM information_schema.routines