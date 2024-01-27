package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
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
	
	@PostMapping(value = "/login")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO login(@RequestBody LoginAccountDTO request) {
		return accountService.login(request);
	}

	@PostMapping(value = "/deposit")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void despoit(@RequestBody DepositDTO request) {
		accountService.deposit(request);
	}

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
