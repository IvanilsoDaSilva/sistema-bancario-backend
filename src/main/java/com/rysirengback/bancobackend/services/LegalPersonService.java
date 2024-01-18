package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonDTO;
import com.rysirengback.bancobackend.dto.response.ReadIndividualPersonDTO;
import com.rysirengback.bancobackend.repositories.LegalPersonRepository;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class LegalPersonService {
	private final LegalPersonRepository legalPersonRepository;
	
//	public void createIndividualPerson(CreateIndividualPersonDTO request) {
//		individualPersonRepository.save(request);
//	}
//	
//	public ReadIndividualPersonDTO readIndividualPerson() {
//		individualPersonRepository.ge;
//		
//		return 
//	}
}