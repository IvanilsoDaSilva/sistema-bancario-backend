package com.rysirengback.bancobackend.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.io.Serial;
import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

@Data
@SuperBuilder
@NoArgsConstructor
@Entity
@Table(name="individual_person")
public class IndividualPersonEntity extends Client {
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
    
    @Column(name = "name")
	private String name;
	
    @Column(name = "cpf", unique=true)
	private String cpf;
	
    @Column(name = "rg")
	private String rg;
	
    @Column(name = "birth")
	private Date birth;
}
