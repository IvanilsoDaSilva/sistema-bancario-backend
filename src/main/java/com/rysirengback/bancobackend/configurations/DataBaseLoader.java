package com.rysirengback.bancobackend.configurations;

import com.rysirengback.bancobackend.entities.AgencyEntity;
import com.rysirengback.bancobackend.entities.AddressEntity;
import com.rysirengback.bancobackend.repositories.AgencyRepository;

import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor(onConstructor = @__({@Autowired}))
public class DataBaseLoader implements ApplicationRunner {
	private final AgencyRepository agencyRepository;
	
    @Override
    public void run(ApplicationArguments args) {
    	agencyRepository.save(AgencyEntity.builder()
    			.number("001")
    			.address(AddressEntity.builder()
    					.country("Brasil")
    					.state("Rio de Janeiro")
    					.city("Campos dos Goytacazes")
    					.district("Tocos")
    					.street("Rua Guilherme Morisson")
    					.number("58")
    					.postalCode("28148-000")
    					.complement("Perto do Bar do Durval")
    					.build())
    			.build());
    	
    	agencyRepository.save(AgencyEntity.builder()
    			.number("055")
    			.address(AddressEntity.builder()
    					.country("Brasil")
    					.state("Rio de Janeiro")
    					.city("Campos dos Goytacazes")
    					.district("Tocos")
    					.street("Rua Miguel Renald")
    					.number("23")
    					.postalCode("28148-000")
    					.complement("Perto do Bar do Celso")
    					.build()
    			)
    			.build());
    	
    	agencyRepository.save(AgencyEntity.builder()
    			.number("014")
    			.address(AddressEntity.builder()
    					.country("Brasil")
    					.state("Rio de Janeiro")
    					.city("Campos dos Goytacazes")
    					.district("Tocos")
    					.street("Rua Antonio Parentes")
    					.number("77")
    					.postalCode("28148-000")
    					.complement("Perto do Curral")
    					.build()
    			)
    			.build());
    	
    	agencyRepository.save(AgencyEntity.builder()
    			.number("666")
    			.address(AddressEntity.builder()
    					.country("Brasil")
    					.state("Rio de Janeiro")
    					.city("Campos dos Goytacazes")
    					.district("Parque Vera Cruz")
    					.street("Rua Tenente Antonio Joaquim")
    					.number("202")
    					.postalCode("28060-020")
    					.complement("Perto do Bar 27")
    					.build()
    			)
    			.build());
    }
}