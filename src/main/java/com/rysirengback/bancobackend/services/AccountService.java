package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;

import lombok.RequiredArgsConstructor;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountService {
	private final AccountRepository accountRepository;
	private final ModelMapper modelMapper;
	
	public void createIndividualPersonAccount(CreateIndividualPersonAccountDTO request) {
		accountRepository.save(modelMapper.map(request, AccountEntity.class));
	}
	
//	public ReadIndividualPersonDTO readIndividualPerson() {
//		individualPersonRepository.ge;
//		
//		return 
//	}
}