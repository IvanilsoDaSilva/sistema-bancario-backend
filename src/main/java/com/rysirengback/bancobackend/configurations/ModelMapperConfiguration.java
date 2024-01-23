package com.rysirengback.bancobackend.configurations;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.rysirengback.bancobackend.dto.response.ReadAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;

@Configuration
public class ModelMapperConfiguration {
    @Bean
    public ModelMapper modelMapper() {
    	ModelMapper modelMapper = new ModelMapper();
    	
    	modelMapper.createTypeMap(AccountEntity.class, ReadAccountDTO.class)
    		.<String>addMapping(src -> src.getAgency().getNumber(), (dest, value) -> dest.setAgencyCode(value));
    	
        return modelMapper;
    }
}