package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.services.AccountOperationsService;

import com.rysirengback.bancobackend.services.depositstrategy.SystemDepositService;
import com.rysirengback.bancobackend.services.loginstrategy.AccountPasswordLoginService;
import com.rysirengback.bancobackend.services.withdrawstrategy.SystemWithdrawService;
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
	@Autowired
	AccountPasswordLoginService accountPasswordLoginStrategyService;
	@Autowired
	SystemDepositService systemDepositService;
	@Autowired
	SystemWithdrawService systemWithdrawService;
	
	@PostMapping(value = "/login")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO logInAccount(@RequestBody LoginAccountDTO request) {
		return accountOperationsService.logInAccount(request, accountPasswordLoginStrategyService);
	}

	@PostMapping(value = "/deposit")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void depositInAccount(@RequestBody DepositDTO request) {
		accountOperationsService.depositInAccount(request, systemDepositService);
	}
	
	@PostMapping(value = "/withdraw")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void withdrawInAccount(@RequestBody WithdrawDTO request) {
		accountOperationsService.withdrawInAccount(request, systemWithdrawService);
	}
	
	@PostMapping(value = "/transfer")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void transferInAccount(@RequestBody WithdrawDTO request) {
//		accountOperationsService.transferInAccount(request);
	}
}
