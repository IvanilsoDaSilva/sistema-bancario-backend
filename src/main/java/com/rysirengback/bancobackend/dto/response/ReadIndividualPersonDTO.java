package com.rysirengback.bancobackend.dto.response;

import com.rysirengback.bancobackend.entities.AccountEntity;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public class ReadIndividualPersonDTO {
//	private String id;
//	private Date createdDate;
//	private Date lastModifiedDate;
	private String name;
	private String cpf;
//	private String rg;
//	private Date birth;
	private List<AccountEntity> accounts;
}
