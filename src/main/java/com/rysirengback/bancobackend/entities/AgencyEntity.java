package com.rysirengback.bancobackend.entities;

import jakarta.persistence.*;

import java.io.Serial;
import java.sql.Date;
import java.util.List;

import lombok.*;
import lombok.experimental.SuperBuilder;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

@Data
@SuperBuilder
@NoArgsConstructor
@Entity
@Table(name="agency")
public class AgencyEntity {
	@Serial
    private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @GenericGenerator(name = "uuid")
    @Column(name="id")
    private String id;
	
	@CreationTimestamp(source = SourceType.DB)
    private Date createdDate;

    @UpdateTimestamp(source = SourceType.DB)
    private Date lastModifiedDate;
  
    @Column(name = "number")
	private String number;
    
    @OneToMany(mappedBy = "agency", cascade = CascadeType.ALL)
	private List<AccountEntity> accounts;
    
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id")
    private AddressEntity address;
}
