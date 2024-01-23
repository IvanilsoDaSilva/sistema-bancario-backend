package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonAccountDTO;
import com.rysirengback.bancobackend.dto.request.CreateLegalPersonAccountDTO;
import com.rysirengback.bancobackend.dto.response.ReadAccountDTO;
import com.rysirengback.bancobackend.services.AccountService;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/account")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	@PostMapping(value = "/individual-person/create")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO createIndividualPersonAccount(@RequestBody CreateIndividualPersonAccountDTO request) {
		return accountService.createIndividualPersonAccount(request);
	}
	
	@PostMapping(value = "/legal-person/create")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO createLegalPersonAccount(@RequestBody CreateLegalPersonAccountDTO request) {
		return accountService.createLegalPersonAccount(request);
	}
}
