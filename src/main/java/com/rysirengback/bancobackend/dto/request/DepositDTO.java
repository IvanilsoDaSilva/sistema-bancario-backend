package com.rysirengback.bancobackend.dto.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class DepositDTO {
	private String id;
//	private Date createdDate;
//	private Date lastModifiedDate;
	
//	private String number;
//	private String password;
	private double balance;
//	private AccountTypeEnum accountType;
//	private boolean locked;
//	private LegalPersonEntity legalPerson;
//	private IndividualPersonEntity individualPerson;
//	private AgencyEntity agency;
	
//	private String agencyCode;
}
