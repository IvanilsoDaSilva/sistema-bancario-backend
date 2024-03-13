package com.rysirengback.bancobackend;

import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.entities.AgencyEntity;
import com.rysirengback.bancobackend.entities.IndividualPersonEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import com.rysirengback.bancobackend.repositories.AgencyRepository;
import com.rysirengback.bancobackend.repositories.IndividualPersonRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class TestIndividualPersonController {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private IndividualPersonRepository individualPersonRepository;
    @MockBean
    private AgencyRepository agencyRepository;
    @MockBean
    private AccountRepository accountRepository;

	@Test
	void createIndividualPersonAccount() throws Exception {
        IndividualPersonEntity person = IndividualPersonEntity.builder()
                .id("4")
                .name("Usuario")
                .cpf("000.000.000-00")
                .build();
        Mockito.when(individualPersonRepository.save(Mockito.any()))
                .thenReturn(person);

        AgencyEntity agency = AgencyEntity.builder()
                .id("1")
                .number("001")
                .build();
        Mockito.when(agencyRepository.findByNumber("001"))
                .thenReturn(agency);

        AccountEntity account = AccountEntity.builder()
                .id("1")
                .individualPerson(person)
                .number("000001")
                .agency(agency)
                .password("123")
                .build();
        Mockito.when(accountRepository.save(Mockito.any()))
                .thenReturn(account);

        this.mockMvc.perform(post("/account/individual-person/create")
                        .headers(new HttpHeaders() {{setContentType(MediaType.APPLICATION_JSON);}})
                        .content(
                                "{\"id\": \"4\", \"name\": \"Usuario\", \"cpf\": \"000.000.000-00\", \"number\": \"000001\", \"password\": \"123\", \"agencyNumber\": \"001\"}"
                        )
                        .accept(MediaType.APPLICATION_JSON)
                )
                .andDo(print())
                .andExpect(status().isCreated());
	}
}
