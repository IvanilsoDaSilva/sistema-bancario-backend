package com.rysirengback.bancobackend.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import java.util.List;

@Data
@SuperBuilder
@NoArgsConstructor
public abstract class Client {
	@OneToMany(mappedBy = "agency", cascade = CascadeType.ALL)
	protected List<Account> accounts;
}
