package com.rysirengback.bancobackend.services;

import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rysirengback.bancobackend.dto.response.ReadAccountDTO;
import com.rysirengback.bancobackend.repositories.AccountRepository;

import jakarta.transaction.Transactional;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountService {
	private final AccountRepository accountRepository;
	private final ModelMapper modelMapper;
	
	@Transactional
	public List<ReadAccountDTO> readAllAccounts(){
		List<ReadAccountDTO> requestResponse;
		
		requestResponse = Arrays.asList(modelMapper.map(accountRepository.findAll(), ReadAccountDTO[].class));
		
		return requestResponse;
	}
}