package com.rysirengback.bancobackend.dto.request;

import com.rysirengback.bancobackend.entities.AgencyEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class CreateIndividualPersonAccountDTO {
//	private String id;
//	private Date createdDate;
//	private Date lastModifiedDate;
	private String name;
	private String cpf;
	private String rg;
	private Date birth;
//	private List<AccountEntity> accounts;
	
//	private String number;
	private String password;
//	private double balance;
//	private boolean locked;
//	private LegalPersonEntity legalPerson;
	private IndividualPersonEntity individualPerson;
	private AgencyEntity agency;
}
