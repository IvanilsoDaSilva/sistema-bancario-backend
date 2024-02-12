package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.*;
import com.rysirengback.bancobackend.dto.response.*;
import com.rysirengback.bancobackend.services.LegalAccountService;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/account/legal-person")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class LegalAccountController {
	@Autowired
	private LegalAccountService legalAccountService;
	
	@PostMapping(value = "/create")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public ReadAccountDTO createLegalPersonAccount(@RequestBody CreateLegalPersonAccountDTO request) {
		return legalAccountService.createLegalPersonAccount(request);
	}
}
