package com.rysirengback.bancobackend;

import com.rysirengback.bancobackend.entities.*;
import com.rysirengback.bancobackend.repositories.*;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@AutoConfigureMockMvc
class TestAccountController {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private AccountRepository accountRepository;
    @MockBean
    private IndividualPersonRepository individualPersonRepository;
    @MockBean
    private LegalPersonRepository legalPersonRepository;

	@Test
	void readAllAccounts() throws Exception {
        IndividualPersonEntity individualPerson = IndividualPersonEntity.builder()
                .id("1")
                .name("Jão Ninguem")
                .cpf("000.000.000-00")
                .build();
        Mockito.when(individualPersonRepository.findById("1"))
                .thenReturn(Optional.ofNullable(individualPerson));

        LegalPersonEntity legalPerson = LegalPersonEntity.builder()
                .id("2")
                .companyName("Empresa nula")
                .cnpj("00.000.000/0001-00")
                .build();
        Mockito.when(legalPersonRepository.findById("2"))
                .thenReturn(Optional.ofNullable(legalPerson));

        AccountEntity accountIndividual = AccountEntity.builder()
                .id("1")
                .number("000000001")
                .password("87654321")
                .balance(10.00)
                .individualPerson(individualPerson)
                .build();
        AccountEntity accountLegal = AccountEntity.builder()
                .id("2")
                .number("000000000")
                .password("12345678")
                .balance(200000.00)
                .legalPerson(legalPerson)
                .build();
        Mockito.when(accountRepository.findAll()).thenReturn(List.of(
                accountIndividual,
                accountLegal
        ));

        this.mockMvc.perform(get("/account/read-all"))
                .andDo(print())
                .andExpect(status().isOk());
	}
}
