package com.rysirengback.bancobackend.dto.request;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class CreateIndividualPersonDTO {
//	private String id;
//	private Date createdDate;
//	private Date lastModifiedDate;
	private String name;
	private String cpf;
	private String rg;
	private Date birth;
//	private List<AccountEntity> accounts;
}
