package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.repositories.*;
import lombok.RequiredArgsConstructor;

import jakarta.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class IndividualAccountService {
	private final AccountRepository accountRepository;
	private final IndividualPersonRepository individualPersonRepository;
	private final ModelMapper modelMapper;
	private final AgencyRepository agencyRepository;
	
	@Transactional
	public ReadAccountDTO createIndividualPersonAccount(CreateIndividualPersonAccountDTO request) {
		ReadAccountDTO requestResponse;
		AccountEntity accountRequest = modelMapper.map(request, AccountEntity.class);
		IndividualPersonEntity personRequest = individualPersonRepository.save(modelMapper.map(request, IndividualPersonEntity.class));
		
		accountRequest.setIndividualPerson(personRequest);
		accountRequest.setAgency(agencyRepository.findByNumber(request.getAgencyCode()));
		accountRequest.setNumber(request.getAgencyCode()+AccountAuthService.generateAccountNumber());
		
		accountRequest = accountRepository.save(accountRequest);
		
		requestResponse = modelMapper.map(accountRequest, ReadAccountDTO.class);
		
		requestResponse.setName(personRequest.getName());
		requestResponse.setCpf(personRequest.getCpf());
		requestResponse.setRg(personRequest.getRg());
		requestResponse.setBirth(personRequest.getBirth());
		
		return requestResponse;
	}
}