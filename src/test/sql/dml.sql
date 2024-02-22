-- Comandos DML


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`address`
--
-- Inserindo cinco endereços
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`address` (
	id,created_date,last_modified_date,country,state,city,district,street,number,postal_code,complement
) VALUES
	('000', '2020-01-01', '2020-01-01', 'BRASIL', 'RJ', 'RIO DE JANEIRO', 'COPACABANA', 'AVENIDA ATLÂNTICA', '100', '22070-000', 'PERTO DA PRAIA'),
    ('001', '2020-04-28', '2020-04-28', 'BRASIL', 'SP', 'SAO PAULO', 'MOEMA', 'RUA DOS PINHEIROS', '200', '04583-000', 'PRÓXIMO AO PARQUE'),
    ('010', '2020-12-05', '2020-12-06', 'BRASIL', 'ES', 'VILA VELHA', 'CENTRO', 'RUA DOS COQUEIROS', '300', '29100-000', 'AO LADO DO MERCADO'),
    ('011', '2020-03-03', '2020-03-04', 'BRASIL', 'BA', 'SALVADOR', 'BARRA', 'AVENIDA OCEÂNICA', '400', '40140-090', 'PRÓXIMO AO FAROL'),
    ('100', '2020-03-03', '2020-03-04', 'BRASIL', 'RJ', 'CAMPOS DOS GOYTACAZES', 'TOCOS', 'RUA GUILHERME MORISSON', '60', '28148-000', 'PROXIMO AO BAR DO DURVAL')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`address`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`agency`
--
-- Inserindo três agências
-- Cada agência possui um dos endereços criados.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`agency` (
	id,created_date,last_modified_date,address_id,number
) VALUES
	('000', '2020-01-01', '2020-01-01', '000', '001'),
    ('001', '2020-04-28', '2020-04-28', '001', '011'),
    ('010', '2020-12-06', '2020-12-06', '010', '222')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`agency`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`individual_person`
--
-- Inserindo três pessoas físicas
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`individual_person` (
	id,created_date,last_modified_date,name,cpf,rg,birth
) VALUES
	('000', '2020-01-01', '2020-01-01', 'SON GOKU', '123.412.423-99', '333.123.534-0', '736-04-16'),
    ('001', '2020-04-28', '2020-04-28', 'NARUTO UZUMAKI', '001.344.566-00', '863.000.321-7', '2002-10-10'),
    ('010', '2020-12-06', '2020-12-06', 'MONKEY D. LUFFY', '332.642.444-12', '21.332.343-1', '2006-05-05')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`individual_person`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`legal_person`
--
-- Inserindo duas pessoas jurídicas
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`legal_person` (
	id,created_date,last_modified_date,company_name,cnpj
) VALUES
	('000', '2020-01-01', '2020-01-01', 'G9 SOLUCOES INTEGRADAS EM MSN LTDA.', '12.345.678/0001-00'),
    ('001', '2020-04-28', '2020-04-28', 'LIDER MEGA ENSINO LTDA.', '12.765.678/0003-00')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`legal_person`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`account`
-- 
-- Inserindo três contas
-- As duas primeiras contas serão ligadas a primeira pessoa física criada (SON GOKU)
-- As duas contas posteriores serão ligadas a duas pessoas juridicas criadas
-- A última conta será ligada a última pessoa física criada (MONKEY D. LUFFY)
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`account` (
	id,created_date,last_modified_date,number,password,balance,account_type,locked,agency_id,individual_person_id,legal_person_id
) VALUES
	('000', '2020-01-01', '2020-01-01', '123123123', 'senha123', 0.50, 0,0,'000','000',NULL),
    ('001', '2020-04-28', '2020-04-28', '235542333', 'Senh@321', 0.30, 1,1,'000','000',NULL),
	('010', '2020-04-28', '2020-04-28', '235542323', 'Senh@321', 1200.00, 2,0,'001',NULL,'000'),
	('011', '2020-04-28', '2020-04-28', '235542353', 'Senh@321', 3550.00, 2,0,'010',NULL,'001'),
    ('100', '2020-12-06', '2020-12-06', '455745453', 'P@ass333', 3000000000.00,0,0,'010','010',NULL)
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`account`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`log`
-- 
-- Inserindo três logins
-- Os dois primeiros no mesmo local em datas e ips diferentes e na mesma conta (BA - SALVADOR)
-- O último na conta 455745453 em RJ - CAMPOS DOS GOYTACAZES
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`log` (
	id,created_date,last_modified_date,ip,account_id,address_id
) VALUES
	('000', '2023-01-01', '2023-01-01', '192.164.000.1', '001', '011'),
    ('001', '2023-04-28', '2023-04-28', '192.164.000.2', '001', '011'),
	('010', '2023-04-28', '2023-04-28', '192.168.212.3', '100', '100')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`log`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`operation`
-- 
-- Inserindo três operações de contas
-- Duas operações (saque de 100,00 e depósito de 3000,00) na conta 123123123
-- Uma operação de transferência da conta 455745453 para 123123123
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`operation` (
	id,created_date,last_modified_date,balance,operation_type,description,account_id,account_id_receiver
) VALUES
	('000', '2023-01-01', '2023-01-01', 100.00, 0, 'Saque para pagar as contas','000',NULL),
    ('001', '2023-02-02', '2023-02-02', 3000.00, 1, 'Depósito do salário','000',NULL),
    ('010', '2024-01-01', '2024-01-01', 50.00, 2, 'Pagar Goku','100','000')
;
-- SELECT * FROM `sistema_bancario_backend_teste`.`operation`;


-- -----------------------------------------------------
-- Atualizando de saldo nas contas com saldo acima de 2000,00 reais
-- -----------------------------------------------------
UPDATE account 
	SET balance = CASE 
		WHEN balance > 2000.00 THEN balance + balance * 0.00005
		ELSE balance
	END
WHERE balance > 2000.00;


-- -----------------------------------------------------
-- Relatório de dados da pessoa física x contas x agência x endereço da agência
--
-- Deve retornar o nome do cliente, documento do cliente, número das contas, saldo das contas, tipos das contas (utilizando case when atraves da numeração do tipo), numero da agência e rua da agência
-- Nesse caso fiz um teste de como funcionam as tabelas temporárias!
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_pessoafisica_conta_endereco_agencia`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_pessoafisica_conta_endereco_agencia` AS SELECT relatorio.* FROM (
	SELECT 
		-- Informações da pessoa física
		ip.name `nome cliente`, ip.cpf `documento cliente`,
		-- Informações da conta (account_type é numerado de 0 a 3, onde representam contas do tipo corrente, poupança, pagamentos e universitária respectivamente).
		ac.number `numero conta`,
		ac.balance `saldo conta`,
		CASE 
			WHEN ac.account_type = 0 THEN 'CORRENTE'
			WHEN ac.account_type = 1 THEN 'POUPANÇA'
			WHEN ac.account_type = 2 THEN 'PAGAMENTOS'
			WHEN ac.account_type = 3 THEN 'UNIVERSITÁRIA'
			ELSE NULL
		END AS `tipo da conta`,
		-- Informações da agência
		ag.number `numero da agencia`,
		-- Informações de endereço da agência
		ad.street `rua da agencia`
	FROM individual_person ip
		LEFT JOIN account ac ON ip.id = ac.individual_person_id
		LEFT JOIN agency ag ON ag.id = ac.agency_id
		LEFT JOIN address ad ON ag.address_id = ad.id
) AS relatorio;
SELECT * FROM `sistema_bancario_backend_teste`.`view_pessoafisica_conta_endereco_agencia`;
            
            
-- -----------------------------------------------------
-- Relatório de dados da pessoa juridica x contas x agência x endereço da agencia
--
-- Deve retornar o nome do cliente, documento do cliente, numero das contas, saldo das contas, tipos das contas (utilizando case when atraves da numeração do tipo), numero da agência e rua da agência
-- Nesse caso fiz um teste de como funcionam as tabelas temporarias!
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_pessoajuridica_conta_endereco_agencia`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_pessoajuridica_conta_endereco_agencia` AS SELECT relatorio.* FROM (
	SELECT 
		-- Informações da pessoa jurídica
		lp.company_name `nome cliente`, lp.cnpj `documento cliente`,
		-- Informações da conta (account_type é numerado de 0 a 3, onde representam contas do tipo corrente, poupança, pagamentos e universitária respectivamente)
		ac.number `numero conta`,
		ac.balance `saldo conta`,
		CASE 
			WHEN ac.account_type = 0 THEN 'CORRENTE'
			WHEN ac.account_type = 1 THEN 'POUPANÇA'
			WHEN ac.account_type = 2 THEN 'PAGAMENTOS'
			WHEN ac.account_type = 3 THEN 'UNIVERSITÁRIA'
			ELSE NULL
		END AS `tipo da conta`,
		-- Informações da agência
		ag.number `numero da agencia`,
		-- Informações de endereço da agência
		ad.street `rua da agencia`
	FROM legal_person lp
		LEFT JOIN account ac ON lp.id = ac.legal_person_id
		LEFT JOIN agency ag ON ag.id = ac.agency_id
		LEFT JOIN address ad ON ag.address_id = ad.id
) AS relatorio;
SELECT * FROM `sistema_bancario_backend_teste`.`view_pessoajuridica_conta_endereco_agencia`;


-- -----------------------------------------------------
-- Relatório de dados de log x contas
--
-- Deve retornar o histórico de logins das contas com número da conta, ip, data de login e endereço
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_log_conta`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_log_conta` AS SELECT relatorio.* FROM (
	SELECT 
		-- Informações da conta
		ac.number `numero conta`,
		-- Informações de login
		lo.ip `ip login`,
		lo.created_date `data login`,
		-- Informações de endereço do login
		ad.country `pais login`,
		ad.city `cidade login`,
		ad.district `distrito login`
	FROM account ac
		INNER JOIN log lo ON ac.id = lo.account_id
		LEFT JOIN address ad ON ad.id = lo.address_id
) AS relatorio;
SELECT * FROM `sistema_bancario_backend_teste`.`view_log_conta`;

        
-- -----------------------------------------------------
-- Relatório de dados de contas x operações
--
-- Deve retornar o histórico de operações das contas com número da conta, tipo de operação (utilizando case when atraves da numeração do tipo), valor e receptor da operação (apenas em caso de operacao de transação)
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_conta_operacao`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_conta_operacao` AS SELECT relatorio.* FROM (
	SELECT 
		-- Informações da conta.
		ac.number `numero conta`,
		-- Informações de operacoes (A operation_type é numerada de 0 a 2, onde representam operacoes do tipo saque, depósito e transação respectivamente)
		CASE 
			WHEN op.operation_type = 0 THEN 'SAQUE'
			WHEN op.operation_type = 1 THEN 'DEPÓSITO'
			WHEN op.operation_type = 2 THEN 'TRANSCAÇÃO'
			ELSE NULL
		END AS `tipo da operacao`,
		op.balance `valor`,
		-- Informações da conta que recebe a operação (apenas em caso de operação de transação)
		acre.number `numero conta receptor`
	FROM account ac
		INNER JOIN operation op ON ac.id = op.account_id
		LEFT JOIN account acre ON op.account_id_receiver = acre.id
) AS relatorio;
SELECT * FROM `sistema_bancario_backend_teste`.`view_conta_operacao`;


-- -----------------------------------------------------
-- Relatório de dados de agência x endereço
--
-- Deve retornar o número da agência e endereço completo em um texto único
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_agencia_endereco`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_agencia_endereco` AS SELECT relatorio.* FROM (
	SELECT 
		-- Informações da agencia
		ag.number `numero agencia`,
		-- Informações de endereço do login
		CONCAT(ad.street,' N°',ad.number,', ',ad.city,'/',ad.state,' - ',ad.country, ' (',ad.postal_code,')')`endereco`
	FROM agency ag
		INNER JOIN address ad ON ad.id = ag.address_id
) AS relatorio;
SELECT * FROM `sistema_bancario_backend_teste`.`view_agencia_endereco`;


-- -----------------------------------------------------
-- Relatório de dados de agencia x quantidade de pessoa física x quantidade de pessoa jurídica
--
-- Deve retornar o número da agência, a quantidade de pessoas fisicas e a quantidade de pessoas jurídicas
-- -----------------------------------------------------
DROP VIEW IF EXISTS `sistema_bancario_backend_teste`.`view_agencia_quantidadepessoafisica_quantidadepessoajuridica`;
CREATE VIEW `sistema_bancario_backend_teste`.`view_agencia_quantidadepessoafisica_quantidadepessoajuridica` AS 
    SELECT
        relatorio.number `numero agencia`,
        -- Contagem de campos nulos em account por agency
        SUM(IF(ac.legal_person_id IS NULL, 0, 1)) AS `pessoas jurídicas`,
        SUM(IF(ac.individual_person_id IS NULL, 0, 1)) AS `pessoas físicas`
    FROM (
        SELECT 
            -- Informações da agência
            ag.id,
            ag.number
        FROM agency ag
    ) AS relatorio
    LEFT JOIN account ac ON ac.agency_id = relatorio.id
GROUP BY relatorio.id, relatorio.number;
SELECT * FROM `sistema_bancario_backend_teste`.`view_agencia_quantidadepessoafisica_quantidadepessoajuridica`;