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
@Table(name="operation")
public class Operation implements Serializable {
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
    
    @Column(name = "operation_type")
	private AccountTypeEnum operationType;
    
    @Column(name = "balance")
	private double balance;
    
    @Column(name = "description")
	private String description;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "account_id", referencedColumnName = "id")
	private AccountEntity account;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "account_id_receiver", referencedColumnName = "id")
	private AccountEntity accountReceiver;
}
