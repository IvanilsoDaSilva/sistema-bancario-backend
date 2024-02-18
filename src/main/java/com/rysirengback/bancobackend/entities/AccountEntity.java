package com.rysirengback.bancobackend.entities;

import com.rysirengback.bancobackend.enums.*;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Date;

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
@Table(name="account")
public class AccountEntity implements Serializable {
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
  
    @Column(name = "password")
	private String password;
    
    @Column(name = "balance")
	private double balance;
    
    @Column(name = "account_type")
	private AccountTypeEnum accountType;
	
	@Column(name = "locked")
	private boolean locked;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "legal_person_id", referencedColumnName = "id")
	private LegalPersonEntity legalPerson;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "individual_person_id", referencedColumnName = "id")
	private IndividualPersonEntity individualPerson;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "agency_id", referencedColumnName = "id")
	private AgencyEntity agency;
}
