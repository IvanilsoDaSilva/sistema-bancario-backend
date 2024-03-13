package com.rysirengback.bancobackend.repositories;

import com.rysirengback.bancobackend.entities.AccountEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, String> {
	AccountEntity findByNumberAndPassword(String number, String password);
	AccountEntity findByNumber(String number);
}