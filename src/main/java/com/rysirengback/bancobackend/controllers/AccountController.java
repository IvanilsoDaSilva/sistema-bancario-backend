package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonAccountDTO;
import com.rysirengback.bancobackend.services.AccountService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
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
	public void createAccount(@RequestBody CreateIndividualPersonAccountDTO request) {
		accountService.createIndividualPersonAccount(request);
	}
}
