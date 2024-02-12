package com.rysirengback.bancobackend.services;

import lombok.RequiredArgsConstructor;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountService {
	private final static Random random = new Random();
	
	public static String generateAccountNumber() {
		String accountNumber = new String();
		Integer number = random.nextInt(900000)+100000;
		
		accountNumber = number.toString();
		
		return accountNumber; 
	}
}