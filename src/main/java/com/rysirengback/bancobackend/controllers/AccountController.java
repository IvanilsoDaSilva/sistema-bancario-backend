package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.services.AccountService;

import lombok.AllArgsConstructor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/account")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	@GetMapping(value = "/read-all")
	@ResponseStatus(HttpStatus.OK)
	@CrossOrigin
	public List<ReadAccountDTO> readAllAccounts() {
		return accountService.readAllAccounts();
	}
}
