package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.services.AccountOperationsService;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/account")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class AccountOperationsController {
	@Autowired
	private AccountOperationsService accountOperationsService;
	
	@PostMapping(value = "/login")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO logInAccount(@RequestBody LoginAccountDTO request) {
		return accountOperationsService.logInAccount(request);
	}

	@PostMapping(value = "/deposit")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void depositInAccount(@RequestBody DepositDTO request) {
		accountOperationsService.depositInAccount(request);
	}
	
	@PostMapping(value = "/withdraw")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void withdrawInAccount(@RequestBody WithdrawDTO request) {
		accountOperationsService.withdrawInAccount(request);
	}
	
	@PostMapping(value = "/transfer")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void transferInAccount(@RequestBody TransferDTO request) {
		accountOperationsService.transferInAccount(request);
	}
}
