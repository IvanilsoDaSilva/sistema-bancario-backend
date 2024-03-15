package com.rysirengback.bancobackend.services.loginstrategy;

import com.rysirengback.bancobackend.dto.request.LoginAccountDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;

public interface LoginStrategyService {
    public AccountEntity login(LoginAccountDTO request);
}
