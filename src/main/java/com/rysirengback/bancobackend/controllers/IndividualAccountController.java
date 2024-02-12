package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.services.IndividualAccountService;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/account/individual-person")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class IndividualAccountController {
	@Autowired
	private IndividualAccountService individualAccountService;

	@PostMapping(value = "/create")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO createIndividualPersonAccount(@RequestBody CreateIndividualPersonAccountDTO request) {
		return individualAccountService.createIndividualPersonAccount(request);
	}
}
