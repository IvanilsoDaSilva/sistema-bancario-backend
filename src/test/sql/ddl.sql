-- Comandos DDL


-- -----------------------------------------------------
-- Configuração das váriaveis ambiente do MySql
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com variáveis de ambiente no MySQL.
    
	SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;:

	@@UNIQUE_CHECKS é uma variável de sistema que contém o valor atual das verificações de unicidade no MySQL.
	@OLD_UNIQUE_CHECKS é uma variável de usuário que estamos definindo para armazenar o valor atual de @@UNIQUE_CHECKS.
	Com UNIQUE_CHECKS=0, estamos desabilitando temporariamente a verificação de unicidade. Ou seja, estamos dizendo ao MySQL para não realizar verificações de unicidade ao inserir ou atualizar dados em tabelas.

	SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;:

	@@FOREIGN_KEY_CHECKS é outra variável de sistema que contém o valor atual das verificações de chave estrangeira no MySQL.
	@OLD_FOREIGN_KEY_CHECKS é uma variável de usuário para armazenar o valor atual de @@FOREIGN_KEY_CHECKS.
	Com FOREIGN_KEY_CHECKS=0, estamos desabilitando temporariamente as verificações de chave estrangeira. Ou seja, estamos dizendo ao MySQL para não verificar se as chaves estrangeiras estão sendo obedecidas ao inserir ou atualizar dados em tabelas.

	SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';:

	@@SQL_MODE é uma variável de sistema que controla vários aspectos do comportamento do SQL no MySQL, como o nível de rigor nas consultas e operações de tabela.
	@OLD_SQL_MODE é uma variável de usuário que armazena o valor atual de @@SQL_MODE.
	SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' define um novo conjunto de modos SQL. Isso especifica várias configurações para o modo SQL, incluindo restrições mais rigorosas para consultas GROUP BY (ONLY_FULL_GROUP_BY), tratamento estrito de transações (STRICT_TRANS_TABLES), entre outros.
	
*/
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS,FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET @log_bin_trust_function_creators = 1;


-- -----------------------------------------------------
-- Schema sistema_bancario_backend_teste
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação do schema.
	
    DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
DROP SCHEMA IF EXISTS `sistema_bancario_backend_teste`;
CREATE SCHEMA IF NOT EXISTS `sistema_bancario_backend_teste` DEFAULT CHARACTER SET utf8mb4;
USE `sistema_bancario_backend_teste`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`individual_person`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela individual_person.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
    UNIQUE
    
    Define que o campo será unico.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	INDEX define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`individual_person` (
	`id` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NULL DEFAULT NULL,
	`cpf` VARCHAR(255) NULL DEFAULT NULL,
	`rg` VARCHAR(255) NULL DEFAULT NULL,
	`birth` DATE NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	UNIQUE INDEX `UK_idljlcm9jq4s0ce07sh6yey0j` (`cpf` ASC)
) -- VISIBLE) 
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`legal_person`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela legal_person.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
	UNIQUE
    
    Define que o campo será unico.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	INDEX define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`legal_person` (
	`id` VARCHAR(255) NOT NULL,
	`cnpj` VARCHAR(255) NULL DEFAULT NULL,
	`company_name` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	UNIQUE INDEX `UK_q1akyn8ain430o9pft20nacrf` (`cnpj` ASC)
) -- VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`address`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela address.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`address` (
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
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`agency`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela agency.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
	UNIQUE
    
    Define que o campo será unico.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	UNIQUE define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    CONSTRAINT `{chave}` FOREIGN KEY (`{campo}`) REFERENCES `{schema}`.`{tabela}` (`{campo2}`):
    
    CONSTRAINT é a palavra reservada para definicar caractersticas das colunas no banco de dados.
    {chave} é o nome dado a constraint.
    FOREIGN KEY identifica o tipo da constraint (Chave estrangeira).
    {campo} especifica a coluna que será aplicada a constraint.
    REFERENCES `{schema}`.`{tabela}` (`{campo2}`) especifica a coluna da tabela de referencia (Nesse caso, a coluna de referencia para a chave estrangeira).
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`agency` (
	`id` VARCHAR(255) NOT NULL,
	`address_id` VARCHAR(255) NULL DEFAULT NULL,
	`number` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	CONSTRAINT `FKiqovy0gm1lebgwor5g2kdfcmk`
		FOREIGN KEY (`address_id`)
		REFERENCES `sistema_bancario_backend_teste`.`address` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE
	,
	UNIQUE INDEX `UK_7vmqa8p2jsvct6baec7sjsiqy` (`address_id` ASC) -- VISIBLE

)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`account`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela account.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
	UNIQUE
    
    Define que o campo será unico.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	INDEX define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    CONSTRAINT `{chave}` FOREIGN KEY (`{campo}`) REFERENCES `{schema}`.`{tabela}` (`{campo2}`):
    
    CONSTRAINT é a palavra reservada para definicar caractersticas das colunas no banco de dados.
    {chave} é o nome dado a constraint.
    FOREIGN KEY identifica o tipo da constraint (Chave estrangeira).
    {campo} especifica a coluna que será aplicada a constraint.
    REFERENCES `{schema}`.`{tabela}` (`{campo2}`) especifica a coluna da tabela de referencia (Nesse caso, a coluna de referencia para a chave estrangeira).
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`account` (
	`id` VARCHAR(255) NOT NULL,
	`number` VARCHAR(255) NULL DEFAULT NULL,
	`password` VARCHAR(255) NULL DEFAULT NULL,
	`balance` DOUBLE NULL DEFAULT NULL,
	`account_type` TINYINT(4) NULL DEFAULT NULL,
	`locked` BIT(1) NULL DEFAULT NULL,
	`agency_id` VARCHAR(255) NULL DEFAULT NULL,
	`individual_person_id` VARCHAR(255) NULL DEFAULT NULL,
	`legal_person_id` VARCHAR(255) NULL DEFAULT NULL,
    `created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,
    
	PRIMARY KEY (`id`),
	CONSTRAINT `FK6h135jstrjuphvowfq4ms8cb9`
		FOREIGN KEY (`individual_person_id`)
		REFERENCES `sistema_bancario_backend_teste`.`individual_person` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	CONSTRAINT `FK7u8hrmb7h1qyu17ppeu1em5o2`
		FOREIGN KEY (`agency_id`)
		REFERENCES `sistema_bancario_backend_teste`.`agency` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	CONSTRAINT `FKecs860waipliu6fddiqbqq30v`
		FOREIGN KEY (`legal_person_id`)
		REFERENCES `sistema_bancario_backend_teste`.`legal_person` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	UNIQUE INDEX `FK7u8hrmb7h1qyu17ppeu1em5ab` (`number` ASC),
	INDEX `FK7u8hrmb7h1qyu17ppeu1em5o2` (`agency_id` ASC), -- VISIBLE,
	INDEX `FK6h135jstrjuphvowfq4ms8cb9` (`individual_person_id` ASC), -- VISIBLE,
	INDEX `FKecs860waipliu6fddiqbqq30v` (`legal_person_id` ASC) -- VISIBLE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`log`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela log.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	INDEX define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    CONSTRAINT `{chave}` FOREIGN KEY (`{campo}`) REFERENCES `{schema}`.`{tabela}` (`{campo2}`):
    
    CONSTRAINT é a palavra reservada para definicar caractersticas das colunas no banco de dados.
    {chave} é o nome dado a constraint.
    FOREIGN KEY identifica o tipo da constraint (Chave estrangeira).
    {campo} especifica a coluna que será aplicada a constraint.
    REFERENCES `{schema}`.`{tabela}` (`{campo2}`) especifica a coluna da tabela de referencia (Nesse caso, a coluna de referencia para a chave estrangeira).
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`log` (
	`id` VARCHAR(255) NOT NULL,
	`ip` VARCHAR(255) NULL DEFAULT NULL,
    `account_id` VARCHAR(255) NULL DEFAULT NULL,
    `address_id` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	CONSTRAINT `FKiqovy1gm2lfbgwor5g2kdff1k`
		FOREIGN KEY (`account_id`)
		REFERENCES `sistema_bancario_backend_teste`.`account` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	CONSTRAINT `FKiqovy0gm1lebgwor5g2kdff1k`
		FOREIGN KEY (`address_id`)
		REFERENCES `sistema_bancario_backend_teste`.`address` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	INDEX `FK503ama154cr4d3cyc7741l4b7` (`account_id` ASC),
	INDEX `FKgfiexhes0mhq1np5lms15iyts` (`address_id` ASC)

)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`operation`
-- -----------------------------------------------------
/*
	
	Esse conjunto de comandos SQL está lidando com a criação da tabela operation.
    
    NULL DEFAULT NULL:
    
    Define que o campo pode receber valores NULL e caso não informado, armazenará NULL por padrão.
    
    INDEX `{chave}` (`{campo}` ASC):
	
	INDEX define que o campo será indexado.
	{chave} é o nome dado ao índice único (Opcionais, mas podem ser úteis para identificar e referenciar o índice posteriormente, especialmente em operações de gerenciamento de banco de dados).
	{campo} especifica a coluna que será indexada.
	ASC define que o indice será criado em ordem crescente.
    
    VISIBLE: 
    
    Removido devido a problemas de compatibilidade de versão do MySQL.
    Pode ser considerada opcional e, em muitos casos, é simplesmente ignorada.
    Seu uso pode ser útil apenas para tornar o código mais claro para outros desenvolvedores e para garantir compatibilidade com futuras atualizações do MySQL.
    
    CONSTRAINT `{chave}` FOREIGN KEY (`{campo}`) REFERENCES `{schema}`.`{tabela}` (`{campo2}`):
    
    CONSTRAINT é a palavra reservada para definicar caractersticas das colunas no banco de dados.
    {chave} é o nome dado a constraint.
    FOREIGN KEY identifica o tipo da constraint (Chave estrangeira).
    {campo} especifica a coluna que será aplicada a constraint.
    REFERENCES `{schema}`.`{tabela}` (`{campo2}`) especifica a coluna da tabela de referencia (Nesse caso, a coluna de referencia para a chave estrangeira).
    
    ENGINE = InnoDB:
    
    Especificando que a tabela será armazenada utilizando o mecanismo InnoDB. Isso garante que a tabela terá suporte a transações, chaves estrangeiras e outras funcionalidades avançadas fornecidas pelo InnoDB.
    
	DEFAULT CHARACTER SET utf8mb4:
    
    Define o conjunto de caracteres padrão para uma tabela no MySQL. Neste caso, o utf8mb4, uma extensão do conjunto de caracteres UTF-8.
    O utf8mb4 permite um byte a mais na codificação.
    
*/
CREATE TABLE IF NOT EXISTS `sistema_bancario_backend_teste`.`operation` (
	`id` VARCHAR(255) NOT NULL,
	`balance` DOUBLE NULL DEFAULT NULL,
	`operation_type` TINYINT(4) NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `account_id` VARCHAR(255) NULL DEFAULT NULL,
    `account_id_receiver` VARCHAR(255) NULL DEFAULT NULL,
	`created_date` DATE NULL DEFAULT NULL,
	`last_modified_date` DATE NULL DEFAULT NULL,

	PRIMARY KEY (`id`),
	CONSTRAINT `FKiqavy1gm2lfaaafffg2kdffss`
		FOREIGN KEY (`account_id`)
		REFERENCES `sistema_bancario_backend_teste`.`account` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	CONSTRAINT `FKKqovy0gm1lebgwaaff2kkffuu`
		FOREIGN KEY (`account_id_receiver`)
		REFERENCES `sistema_bancario_backend_teste`.`account` (`id`)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	INDEX `FK505amab54cr4d3cyaa7ffl4ss` (`account_id` ASC),
	INDEX `FFgf1exhesfffq1np5lmaa5iyuu` (`account_id_receiver` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Configuração das váriaveis ambiente do MySql
-- -----------------------------------------------------
/*

	Esses comandos são usados para restaurar os valores anteriores de determinadas variáveis de ambiente no MySQL.

	SET SQL_MODE=@OLD_SQL_MODE;:

	Este comando define o modo SQL atual (SQL_MODE) para o valor armazenado na variável de usuário @OLD_SQL_MODE.
	A variável @OLD_SQL_MODE é normalmente usada para armazenar o modo SQL anterior antes de ser alterado temporariamente para um novo valor.
	Restaurar o modo SQL anterior é útil quando você temporariamente alterou as configurações do modo SQL e deseja restaurá-las para seu valor original.
	
    SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;:

	Este comando desativa temporariamente as verificações de chave estrangeira no MySQL, definindo a variável FOREIGN_KEY_CHECKS para o valor armazenado na variável de usuário @OLD_FOREIGN_KEY_CHECKS.
	A variável @OLD_FOREIGN_KEY_CHECKS é usada para armazenar o estado anterior das verificações de chave estrangeira antes de serem desativadas temporariamente.
	Desativar temporariamente as verificações de chave estrangeira pode ser útil ao realizar operações de carga de dados em massa ou ao reimportar dados em um banco de dados.
	
    SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;:

	Este comando desativa temporariamente as verificações de unicidade no MySQL, definindo a variável UNIQUE_CHECKS para o valor armazenado na variável de usuário @OLD_UNIQUE_CHECKS.
	A variável @OLD_UNIQUE_CHECKS é usada para armazenar o estado anterior das verificações de unicidade antes de serem desativadas temporariamente.
	Desativar temporariamente as verificações de unicidade pode ser útil em situações semelhantes às das verificações de chave estrangeira, quando você está realizando operações que podem temporariamente violar as restrições de unicidade e deseja restaurar as verificações posteriormente.

*/
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
