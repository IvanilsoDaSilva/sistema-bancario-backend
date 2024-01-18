package com.rysirengback.bancobackend.repositories;

import com.rysirengback.bancobackend.entities.AddressEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<AddressEntity, String> {}