-- Comandos DML


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`address`
--
-- Inserindo cinco endereços.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`address` (
	id,created_date,last_modified_date,country,state,city,district,street,number,postal_code,complement
) VALUES
	('000', '2020-01-01', '2020-01-01', 'BRASIL', 'RJ', 'RIO', 'COPACABANA', 'AVENIDA ATLÂNTICA', '100', '22070-000', 'PERTO DA PRAIA'),
    ('001', '2020-04-28', '2020-04-28', 'BRASIL', 'SP', 'SAO PAULO', 'MOEMA', 'RUA DOS PINHEIROS', '200', '04583-000', 'PRÓXIMO AO PARQUE'),
    ('010', '2020-12-05', '2020-12-06', 'BRASIL', 'ES', 'VILA VELHA', 'CENTRO', 'RUA DOS COQUEIROS', '300', '29100-000', 'AO LADO DO MERCADO'),
    ('011', '2020-03-03', '2020-03-04', 'BRASIL', 'BA', 'SALVADOR', 'BARRA', 'AVENIDA OCEÂNICA', '400', '40140-090', 'PRÓXIMO AO FAROL'),
    ('100', '2020-03-03', '2020-03-04', 'BRASIL', 'RJ', 'CAMPOS DOS GOYTACAZES', 'TOCOS', 'RUA GUILHERME MORISSON', '60', '28148-000', 'PROXIMO AO BAR DO DURVAL')
;
SELECT * FROM `sistema_bancario_backend_teste`.`address`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`agency`
--
-- Inserindo tres agencias
-- Cada agencia possui um dos endereços criados.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`agency` (
	id,created_date,last_modified_date,address_id,number
) VALUES
	('000', '2020-01-01', '2020-01-01', '000', '001'),
    ('001', '2020-04-28', '2020-04-28', '001', '011'),
    ('010', '2020-12-06', '2020-12-06', '010', '222')
;
SELECT * FROM `sistema_bancario_backend_teste`.`agency`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`individual_person`
--
-- Inserindo tres pessoas fisicas.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`individual_person` (
	id,created_date,last_modified_date,name,cpf,rg,birth
) VALUES
	('000', '2020-01-01', '2020-01-01', 'SON GOKU', '123.412.423-99', '333.123.534-0', '736-04-16'),
    ('001', '2020-04-28', '2020-04-28', 'NARUTO UZUMAKI', '001.344.566-00', '863.000.321-7', '2002-10-10'),
    ('010', '2020-12-06', '2020-12-06', 'MONKEY D. LUFFY', '332.642.444-12', '21.332.343-1', '2006-05-05')
;
SELECT * FROM `sistema_bancario_backend_teste`.`individual_person`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`legal_person`
--
-- Inserindo duas pessoas juridicas.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`legal_person` (
	id,created_date,last_modified_date,company_name,cnpj
) VALUES
	('000', '2020-01-01', '2020-01-01', 'G9 SOLUCOES INTEGRADAS EM MSN LTDA.', '12.345.678/0001-00'),
    ('001', '2020-04-28', '2020-04-28', 'LIDER MEGA ENSINO LTDA.', '12.765.678/0003-00')
;
SELECT * FROM `sistema_bancario_backend_teste`.`legal_person`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`account`
-- 
-- Inserindo tres contas.
-- As duas primeiras contas serão dadas ligadas a primeira pessoa
-- As duas contas posteriores serão ligadas a duas pessoas juridicas
-- A ultima conta será ligada a ultima pessoa fisica.
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
SELECT * FROM `sistema_bancario_backend_teste`.`account`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`log`
-- 
-- Inserindo tres logins.
-- Todos no mesmo local em datas diferentes
-- Dois em uma mesma conta,
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`log` (
	id,created_date,last_modified_date,ip,account_id,address_id
) VALUES
	('000', '2023-01-01', '2023-01-01', '192.164.0.1', '001', '011'),
    ('001', '2023-04-28', '2023-04-28', '192.164.0.2', '001', '011'),
	('010', '2023-04-28', '2023-04-28', '192.168.212.3', '100', '100')
;
SELECT * FROM `sistema_bancario_backend_teste`.`log`;


-- -----------------------------------------------------
-- Table `sistema_bancario_backend_teste`.`log`
-- 
-- Inserindo tres operaçoes de contas.
-- -----------------------------------------------------
INSERT INTO `sistema_bancario_backend_teste`.`operation` (
	id,created_date,last_modified_date,balance,operation_type,description,account_id,account_id_receiver
) VALUES
	('000', '2023-01-01', '2023-01-01', 100.00, 0, 'Saque para pagar contas','000',NULL),
    ('001', '2023-02-02', '2023-02-02', 3000.00, 1, 'Deposito do salario','000',NULL),
    ('010', '2024-01-01', '2024-01-01', 50.00, 2, 'Pagar Goku','100','000')
;
SELECT * FROM `sistema_bancario_backend_teste`.`operation`;


-- -----------------------------------------------------
-- Relatorios de dados da pessoa fisica x contas x endereço da agencia
--
-- Deve retornar o nome do cliente, documento do cliente, numero das contas, saldo das contas, tipos das contas (Utilizando case when atraves da numeração do tipo), numero da agencya e rua da agencia
-- -----------------------------------------------------
SELECT 
-- Informações da pessao fisica
ip.name `nome cliente`, ip.cpf `documento cliente`,
-- informações da conta (account_type é numerado de 0 a 3, onde representam contas do tipo corrente, poupança, pagamentos e universitária respectivamente).
ac.number `numero conta`,
ac.balance `saldo conta`,
CASE 
	WHEN ac.account_type = 0 THEN 'CORRENTE'
    WHEN ac.account_type = 1 THEN 'POUPANÇA'
    WHEN ac.account_type = 2 THEN 'PAGAMENTOS'
    WHEN ac.account_type = 3 THEN 'UNIVERSITÁRIA'
	ELSE NULL
END AS `tipo da conta`,
-- Informações da agencia
ag.number `numero da agencia`,
-- Informações de endereço da agencia
ad.street `rua da agencia`
	FROM individual_person ip
	LEFT JOIN account ac
    ON ip.id = ac.individual_person_id
		LEFT JOIN agency ag
        ON ag.id = ac.agency_id
			LEFT JOIN address ad
			ON ag.address_id = ad.id;
            
            
-- -----------------------------------------------------
-- Relatorios de dados da pessoa juridica x contas x endereço da agencia
--
-- Deve retornar o nome do cliente, documento do cliente, numero das contas, saldo das contas, tipos das contas (Utilizando case when atraves da numeração do tipo), numero da agencya e rua da agencia
-- -----------------------------------------------------
SELECT 
-- Informações da pessao juridica
lp.company_name `nome cliente`, lp.cnpj `documento cliente`,
-- informações da conta (account_type é numerado de 0 a 3, onde representam contas do tipo corrente, poupança, pagamentos e universitária respectivamente).
ac.number `numero conta`,
ac.balance `saldo conta`,
CASE 
	WHEN ac.account_type = 0 THEN 'CORRENTE'
    WHEN ac.account_type = 1 THEN 'POUPANÇA'
    WHEN ac.account_type = 2 THEN 'PAGAMENTOS'
    WHEN ac.account_type = 3 THEN 'UNIVERSITÁRIA'
	ELSE NULL
END AS `tipo da conta`,
-- Informações da agencia
ag.number `numero da agencia`,
-- Informações de endereço da agencia
ad.street `rua da agencia`
	FROM legal_person lp
	LEFT JOIN account ac
    ON lp.id = ac.legal_person_id
		LEFT JOIN agency ag
        ON ag.id = ac.agency_id
			LEFT JOIN address ad
			ON ag.address_id = ad.id;


-- -----------------------------------------------------
-- Relatorios de dados de log das contas
--
-- Deve retornar o historico de logins das contas com numero da conta, ip, data de login e local
-- -----------------------------------------------------
SELECT 
-- informações da conta (account_type é numerado de 0 a 3, onde representam contas do tipo corrente, poupança, pagamentos e universitária respectivamente).
ac.number `numero conta`,
-- Informações de login
lo.ip `ip login`,
lo.created_date `data login`,
-- Informações de endereço do login
ad.country `pais login`,
ad.city `cidade login`,
ad.district `distrito login`
	FROM account ac
	INNER JOIN log lo
    ON ac.id = lo.account_id
		LEFT JOIN address ad
        ON ad.id = lo.address_id;
        
-- -----------------------------------------------------
-- Relatorios de dados de operações das contas
--
-- Deve retornar o historico de operações das contas
-- -----------------------------------------------------
SELECT 
-- informações da conta.
ac.number `numero conta`,
-- Informações de operacoes (operation_type é numerado de 0 a 2, onde representam operacoes do tipo sque, deposito e transcação respectivamente).
CASE 
	WHEN op.operation_type = 0 THEN 'SAQUE'
    WHEN op.operation_type = 1 THEN 'DEPÓSITO'
    WHEN op.operation_type = 2 THEN 'TRANSCAÇÃO'
	ELSE NULL
END AS `tipo da operacao`,
op.balance `valor`,
-- informações da conta que recebe a operacao (apenas em caso de operacao de transação)
acre.number `numero conta receptor`
	FROM account ac
	INNER JOIN operation op
    ON ac.id = op.account_id
		LEFT JOIN account acre
			ON op.account_id_receiver = acre.id;