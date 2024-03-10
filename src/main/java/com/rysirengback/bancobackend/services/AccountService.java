package com.rysirengback.bancobackend.services;

import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

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
				Optional<IndividualPersonEntity> person = individualPersonRepository.findById(account.getIndividualPersonId());

				System.out.println(person);
				
				account.setName(person.get().getName());
				account.setCpf(person.get().getCpf());
				account.setRg(person.get().getRg());
				account.setBirth(person.get().getBirth());
			} else {
				Optional<LegalPersonEntity> person = legalPersonRepository.findById(account.getLegalPersonId());
				
				account.setCompanyName(person.get().getCompanyName());
				account.setCnpj(person.get().getCnpj());
			}
		}
		
		return requestResponse;
	}
}