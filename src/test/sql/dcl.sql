-- Comandos DCL


-- -----------------------------------------------------
-- Schema MYSQL
-- -----------------------------------------------------
USE mysql;


-- -----------------------------------------------------
-- Table USER
-- 
-- Inserindo o usuário administrador.
-- O usuário administrador terá todas permissões no schema.
-- -----------------------------------------------------
DROP user IF EXISTS SB_administrador@localhost;
CREATE user 'SB_administrador'@'localhost' IDENTIFIED BY '123';
GRANT
	ALL
	ON `sistema_bancario_backend_teste`.*
TO 'SB_administrador'@'localhost';
SHOW GRANTS FOR 'SB_administrador'@'localhost';


-- -----------------------------------------------------
-- Table USER
-- 
-- Inserindo o usuário gerente de nivel alto.
-- O usuário gerente terá todas permissões no schema.
-- -----------------------------------------------------
DROP user IF EXISTS SB_gerente_alto@localhost;
CREATE user 'SB_gerente_alto'@'localhost' IDENTIFIED BY '123';
GRANT 
	SELECT
    ON `sistema_bancario_backend_teste`.`operation` 
TO 'SB_gerente_alto'@'localhost';
GRANT 
	SELECT
    ON `sistema_bancario_backend_teste`.`log` 
TO 'SB_gerente_alto'@'localhost';
GRANT 
	SELECT, UPDATE(locked,password,agency_id)
    ON `sistema_bancario_backend_teste`.`account`
TO 'SB_gerente_alto'@'localhost';
SHOW GRANTS FOR 'SB_gerente_alto'@'localhost';


-- -----------------------------------------------------
-- Table USER
-- 
-- Inserindo o usuário gerente de nivel baixo.
-- O usuário gerente terá todas permissões no schema.
-- -----------------------------------------------------
DROP user IF EXISTS SB_gerente_baixo@localhost;
CREATE user 'SB_gerente_baixo'@'localhost' IDENTIFIED BY '123';
GRANT
	SELECT(number,account_type,locked,agency_id,individual_person_id,legal_person_id)
    ON `sistema_bancario_backend_teste`.`account`
TO 'SB_gerente_baixo'@'localhost';
SHOW GRANTS FOR 'SB_gerente_baixo'@'localhost';


-- -----------------------------------------------------
-- Table USER
-- 
-- Mostrar todos os usuários
-- -----------------------------------------------------
SELECT * FROM user;