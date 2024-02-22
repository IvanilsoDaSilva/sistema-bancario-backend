package com.rysirengback.bancobackend.services;

import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rysirengback.bancobackend.dto.response.ReadAccountDTO;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import com.rysirengback.bancobackend.repositories.IndividualPersonRepository;
import com.rysirengback.bancobackend.repositories.LegalPersonRepository;

import jakarta.transaction.Transactional;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountService {
	private final AccountRepository accountRepository;
	private final IndividualPersonRepository individualPersonRepository;
	private final LegalPersonRepository legalPersonRepository;
	private final ModelMapper modelMapper;
	
	@Transactional
	public List<ReadAccountDTO> readAllAccounts(){
		List<ReadAccountDTO> requestResponse;
		
		requestResponse = Arrays.asList(modelMapper.map(accountRepository.findAll(), ReadAccountDTO[].class));
		
		for (ReadAccountDTO account : requestResponse) {
			if (account.getIndividualPersonId() != null) {
				IndividualPersonEntity person = individualPersonRepository.getById(account.getIndividualPersonId());
				
				account.setName(person.getName());
				account.setCpf(person.getCpf());
				account.setRg(person.getRg());
				account.setBirth(person.getBirth());
			} else {
				LegalPersonEntity person = legalPersonRepository.getById(account.getLegalPersonId());
				
				account.setCompanyName(person.getCompanyName());
				account.setCnpj(person.getCnpj());
			}
		}
		
		return requestResponse;
	}
}