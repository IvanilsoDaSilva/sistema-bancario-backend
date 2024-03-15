package com.rysirengback.bancobackend.services.loginstrategy;

import com.rysirengback.bancobackend.dto.request.LoginAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class AccountPasswordLoginService implements LoginStrategyService{
    private final AccountRepository accountRepository;
    @Override
    @Transactional
    public AccountEntity login(LoginAccountDTO request) {
        return accountRepository.findByNumberAndPassword(request.getNumber(), request.getPassword());
    }
}
