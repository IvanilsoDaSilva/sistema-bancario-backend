package com.rysirengback.bancobackend;

import com.rysirengback.bancobackend.entities.*;
import com.rysirengback.bancobackend.repositories.*;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.http.HttpHeaders;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class TestLegalPersonController {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private LegalPersonRepository legalPersonRepository;
    @MockBean
    private AgencyRepository agencyRepository;
    @MockBean
    private AccountRepository accountRepository;

	@Test
	void createLegalPersonAccount() throws Exception {
        LegalPersonEntity person = LegalPersonEntity.builder()
                .id("3")
                .companyName("Empresa Massa")
                .cnpj("00.000.000/0001-03")
                .build();
        Mockito.when(legalPersonRepository.save(Mockito.any()))
                .thenReturn(person);

        AgencyEntity agency = AgencyEntity.builder()
                .id("1")
                .number("001")
                .build();
        Mockito.when(agencyRepository.findByNumber("001"))
                .thenReturn(agency);

        AccountEntity account = AccountEntity.builder()
                .id("1")
                .legalPerson(person)
                .agency(agency)
                .password("123")
                .build();
        Mockito.when(accountRepository.save(Mockito.any()))
                .thenReturn(account);

        this.mockMvc.perform(post("/account/legal-person/create")
                        .headers(new HttpHeaders() {{setContentType(MediaType.APPLICATION_JSON);}})
                        .content(
                                "{\"id\": \"3\", \"companyName\": \"Empresa Massa\", \"cnpj\": \"00.000.000/0001-03\", \"password\": \"123\", \"agencyNumber\": \"001\"}"
                        )
                        .accept(MediaType.APPLICATION_JSON)
                )
                .andDo(print())
                .andExpect(status().isCreated());
	}
}
