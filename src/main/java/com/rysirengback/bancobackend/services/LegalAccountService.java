package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.*;
import lombok.RequiredArgsConstructor;

import jakarta.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class LegalAccountService {
	private final AccountRepository accountRepository;
	private final LegalPersonRepository legalPersonRepository;
	private final ModelMapper modelMapper;
	private final AgencyRepository agencyRepository;
	
	@Transactional
	public ReadAccountDTO createLegalPersonAccount(CreateLegalPersonAccountDTO request) {
		ReadAccountDTO requestResponse;
		AccountEntity accountRequest = modelMapper.map(request, AccountEntity.class);
		LegalPersonEntity personRequest = legalPersonRepository.save(modelMapper.map(request, LegalPersonEntity.class));
		
		accountRequest.setLegalPerson(personRequest);
		accountRequest.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		accountRequest.setNumber(request.getAgencyCode()+AccountService.generateAccountNumber());
		
		accountRequest = accountRepository.save(accountRequest);
		
		requestResponse = modelMapper.map(accountRequest, ReadAccountDTO.class);
		
		requestResponse.setCompanyName(personRequest.getCompanyName());
		requestResponse.setCnpj(personRequest.getCnpj());
		
		return requestResponse;
	}
}