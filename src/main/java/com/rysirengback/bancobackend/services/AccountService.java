package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonAccountDTO;
import com.rysirengback.bancobackend.dto.request.CreateLegalPersonAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import com.rysirengback.bancobackend.repositories.AgencyRepository;
import com.rysirengback.bancobackend.repositories.IndividualPersonRepository;
import com.rysirengback.bancobackend.repositories.LegalPersonRepository;

import lombok.RequiredArgsConstructor;

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
	
	
	public void createIndividualPersonAccount(CreateIndividualPersonAccountDTO request) {
		request.setIndividualPerson(individualPersonRepository.save(modelMapper.map(request, IndividualPersonEntity.class)));
		request.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		accountRepository.save(modelMapper.map(request, AccountEntity.class));
	}
	
	public void createLegalPersonAccount(CreateLegalPersonAccountDTO request) {
		request.setLegalPerson(legalPersonRepository.save(modelMapper.map(request, LegalPersonEntity.class)));
		request.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		accountRepository.save(modelMapper.map(request, AccountEntity.class));
	}
}