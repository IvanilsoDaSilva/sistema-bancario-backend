package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.*;
import lombok.RequiredArgsConstructor;

import jakarta.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountOperationsService {
	private final AccountRepository accountRepository;
	private final IndividualPersonRepository individualPersonRepository;
	private final LegalPersonRepository legalPersonRepository;
	private final ModelMapper modelMapper;
	
	@Transactional
	public ReadAccountDTO logInAccount(LoginAccountDTO request) {
		ReadAccountDTO response;
		AccountEntity account = accountRepository.findByNumberAndPassword(request.getNumber(), request.getPassword());
		
		response = modelMapper.map(account, ReadAccountDTO.class);
		
		if(account.getIndividualPerson() != null ) {
			IndividualPersonEntity person = modelMapper.map(individualPersonRepository.findById(response.getIndividualPersonId()), IndividualPersonEntity.class);
			
			response.setName(person.getName());
			response.setCpf(person.getCpf());
			response.setRg(person.getRg());
			response.setBirth(person.getBirth());
		} else {
			LegalPersonEntity person = modelMapper.map(legalPersonRepository.findById(response.getLegalPersonId()), LegalPersonEntity.class);
			
			response.setCompanyName(person.getCompanyName());
			response.setCnpj(person.getCnpj());
		}
		
		return response;
	}
	
	@Transactional
	public void depositInAccount(DepositDTO request) {
		if (request.getBalance()>0) {
			AccountEntity account = modelMapper.map(accountRepository.findById(request.getId()), AccountEntity.class);
			
			account.setBalance(account.getBalance()+request.getBalance());
			
			accountRepository.save(account);
		} else {
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public void withdrawInAccount(WithdrawDTO request) {
		AccountEntity account = modelMapper.map(accountRepository.findById(request.getId()), AccountEntity.class);
		
		if (request.getBalance() <= account.getBalance() && request.getBalance()>0) {
			
			account.setBalance(account.getBalance()-request.getBalance());
			
			accountRepository.save(account);
		} else {
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}