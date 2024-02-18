SELECT ip.name `nome cliente`, ip.cpf `cpf cliente`,  ac.number `numero da conta`,  ac.password `senha da conta`, ac.account_type `tipo da conta`, ag.number `numero da agencia`, ad.street `rua da agencia`
	FROM individual_person ip
	INNER JOIN account ac
    ON ip.id = ac.individual_person_id
		INNER JOIN agency ag
        ON ag.id = ac.agency_id
			INNER JOIN address ad
			ON ag.address_id = ad.id;

SELECT * FROM agency;
SELECT * FROM account;
SELECT * FROM individual_person;
SELECT * FROM legal_person;