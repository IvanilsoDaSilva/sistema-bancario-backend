package com.rysirengback.bancobackend.services.depositstrategy;

import com.rysirengback.bancobackend.dto.request.DepositDTO;
import com.rysirengback.bancobackend.entities.AccountEntity;
import com.rysirengback.bancobackend.repositories.AccountRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
@Service
public class SystemDepositService implements DepositStrategyService {
    private final AccountRepository accountRepository;
    private final ModelMapper modelMapper;

    @Override
    @Transactional
    public void deposit(DepositDTO request) {
        AccountEntity account = modelMapper.map(accountRepository.findById(request.getId()), AccountEntity.class);
        account.setBalance(account.getBalance()+request.getBalance());
        accountRepository.save(account);
    }
}
