package com.rysirengback.bancobackend.services.depositstrategy;

import com.rysirengback.bancobackend.dto.request.DepositDTO;

public interface DepositStrategyService {
    public void deposit(DepositDTO request);
}
