package com.rysirengback.bancobackend.repositories;

import com.rysirengback.bancobackend.entities.LegalPersonEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LegalPersonRepository extends JpaRepository<LegalPersonEntity, String> {}