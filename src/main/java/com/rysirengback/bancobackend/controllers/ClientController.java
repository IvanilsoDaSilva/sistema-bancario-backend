package com.rysirengback.bancobackend.controllers;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonDTO;
import com.rysirengback.bancobackend.services.IndividualPersonService;
import com.rysirengback.bancobackend.services.LegalPersonService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/client")
@AllArgsConstructor(onConstructor = @__({@Autowired}))
@RestController
public class ClientController {
	@Autowired
	private IndividualPersonService individualPersonService;
	
	@Autowired
	private LegalPersonService legalPersonService;
	
	@PostMapping(value = "/individual-person/create")
	@ResponseStatus(HttpStatus.CREATED)
	@CrossOrigin
	public void createIndividualPerson(@RequestBody CreateIndividualPersonDTO request) {
		individualPersonService.createIndividualPerson(request);
	}
}
