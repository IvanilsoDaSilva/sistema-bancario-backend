package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.entities.LegalPersonEntity;
import com.rysirengback.bancobackend.repositories.*;
import com.rysirengback.bancobackend.services.depositstrategy.DepositStrategyService;
import com.rysirengback.bancobackend.services.depositstrategy.SystemDepositService;
import com.rysirengback.bancobackend.services.loginstrategy.LoginStrategyService;
import com.rysirengback.bancobackend.services.withdrawstrategy.WithdrawStrategyService;
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
	@Autowired
	SystemDepositService systemDeposit;
	private final ModelMapper modelMapper;
	private final AccountRepository accountRepository;
	private final IndividualPersonRepository individualPersonRepository;
	private final LegalPersonRepository legalPersonRepository;
	
	@Transactional
	public ReadAccountDTO logInAccount(LoginAccountDTO request, LoginStrategyService loginMethod) {
		ReadAccountDTO response;

		AccountEntity account = loginMethod.login(request);
		
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
	public void depositInAccount(DepositDTO request, DepositStrategyService depositMethod) {
		if (request.getBalance()>0) {
			depositMethod.deposit(request);
		} else {
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	public void withdrawInAccount(WithdrawDTO request, WithdrawStrategyService withdrawMethod) {
		AccountEntity account = modelMapper.map(accountRepository.findById(request.getId()), AccountEntity.class);
		
		if (request.getBalance() <= account.getBalance() && request.getBalance()>0) {
			withdrawMethod.withdraw(request);
		} else {
			throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}