package com.rysirengback.bancobackend.repositories;

import com.rysirengback.bancobackend.entities.AgencyEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AgencyRepository extends JpaRepository<AgencyEntity, String> {
	AgencyEntity findByNumber(String number);
}