package com.rysirengback.bancobackend.entities;

import jakarta.persistence.*;

import java.util.List;

import lombok.*;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
public abstract class Client {
	@OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
	protected List<AccountEntity> accounts;
}
