package com.rysirengback.bancobackend.services.withdrawstrategy;

import com.rysirengback.bancobackend.dto.request.WithdrawDTO;

public interface WithdrawStrategyService {
    public void withdraw(WithdrawDTO request);
}
