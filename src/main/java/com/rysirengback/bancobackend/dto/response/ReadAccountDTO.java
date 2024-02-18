package com.rysirengback.bancobackend.dto.response;

import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.AgencyEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;

import java.sql.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class ReadAccountDTO {
	private String id;
//	private Date createdDate;
//	private Date lastModifiedDate;
	private String name;
	private String cpf;
	private String rg;
	private Date birth;
//	private List<AccountEntity> accounts;
	
	private String companyName;
	private String cnpj;
	
	private String number;
//	private String password;
	private double balance;
	private boolean locked;
	private String legalPersonId;
	private String individualPersonId;
	private String agencyCode;
}
