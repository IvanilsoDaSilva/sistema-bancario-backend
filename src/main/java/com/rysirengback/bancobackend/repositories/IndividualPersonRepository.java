package com.rysirengback.bancobackend.repositories;

import com.rysirengback.bancobackend.entities.IndividualPersonEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IndividualPersonRepository extends JpaRepository<IndividualPersonEntity, String> {}