package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonAccountDTO;
import com.rysirengback.bancobackend.dto.request.CreateLegalPersonAccountDTO;
import com.rysirengback.bancobackend.dto.request.LoginAccountDTO;
import com.rysirengback.bancobackend.dto.response.ReadAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import com.rysirengback.bancobackend.repositories.AgencyRepository;
import com.rysirengback.bancobackend.repositories.IndividualPersonRepository;
import com.rysirengback.bancobackend.repositories.LegalPersonRepository;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

import java.util.Random;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountService {
	private final AccountRepository accountRepository;
	private final IndividualPersonRepository individualPersonRepository;
	private final LegalPersonRepository legalPersonRepository;
	private final ModelMapper modelMapper;
	private final AgencyRepository agencyRepository;
	private final Random random = new Random();
	
	private String generateAccountNumber() {
		String accountNumber = new String();
		Integer number = random.nextInt(900000)+100000;
		
		accountNumber = number.toString();
		
		return accountNumber;
	}
	
	@Transactional
	public ReadAccountDTO LoginAccount(LoginAccountDTO request) {
		
		return new ReadAccountDTO();
	}
	
	@Transactional
	public ReadAccountDTO createIndividualPersonAccount(CreateIndividualPersonAccountDTO request) {
		ReadAccountDTO response;
		AccountEntity account = modelMapper.map(request, AccountEntity.class);
		IndividualPersonEntity person = individualPersonRepository.save(modelMapper.map(request, IndividualPersonEntity.class));
		
		account.setIndividualPerson(person);
		account.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		account.setNumber(request.getAgencyCode()+generateAccountNumber());
		
		account = accountRepository.save(account);
		
		response = modelMapper.map(account, ReadAccountDTO.class);
		
		response.setName(person.getName());
		response.setCpf(person.getCpf());
		response.setRg(person.getRg());
		response.setBirth(person.getBirth());
		
		return response;
	}
	
	@Transactional
	public ReadAccountDTO createLegalPersonAccount(CreateLegalPersonAccountDTO request) {
		ReadAccountDTO response;
		AccountEntity account = modelMapper.map(request, AccountEntity.class);
		
		LegalPersonEntity person = legalPersonRepository.save(modelMapper.map(request, LegalPersonEntity.class));
		
		account.setLegalPerson(person);
		account.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		account.setNumber(request.getAgencyCode()+generateAccountNumber());
		
		account = accountRepository.save(account);
		
		response = modelMapper.map(account, ReadAccountDTO.class);
		
		response.setCompanyName(person.getCompanyName());
		response.setCnpj(person.getCnpj());
		
		return response;
	}
}