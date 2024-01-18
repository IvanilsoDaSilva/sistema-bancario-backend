package com.rysirengback.bancobackend.services;

import com.rysirengback.bancobackend.dto.request.CreateIndividualPersonDTO;
import com.rysirengback.bancobackend.dto.response.ReadIndividualPersonDTO;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.repositories.IndividualPersonRepository;

import lombok.RequiredArgsConstructor;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class IndividualPersonService {
	private final IndividualPersonRepository individualPersonRepository;
	private final ModelMapper modelMapper;
	
	public void createIndividualPerson(CreateIndividualPersonDTO request) {
		individualPersonRepository.save(modelMapper.map(request, IndividualPersonEntity.class));
	}
	
//	public ReadIndividualPersonDTO readIndividualPerson() {
//		individualPersonRepository.ge;
//		
//		return 
//	}
}