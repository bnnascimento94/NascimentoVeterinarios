package br.com.nascimentoveterinarios.dominios;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="vet_veterinario")
@JsonIdentityInfo(
		  generator = ObjectIdGenerators.PropertyGenerator.class, 
		  property = "id")
public class Veterinario {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@NotNull(message ="Este campo não pode estar vazio")
	@NotEmpty(message="Este campo não pode estar vazio")
	@Size(min= 5, max=30, message ="Este campo deve conter dentre 3 e 30 caracteres")
	@Column(name="nome")
	private String nome;
	
	@NotNull(message="Este campo não pode estar vazio")
	@NotEmpty(message ="Este campo não pode estar vazio")
	@Size(min=5, max=30, message="Este campo deve conter dentre 3 e 30 caracteres")
	@Column(name="especialidade")
	private String especialidade;
	
	@NotNull(message="Este campo não pode estar vazio")
	@NotEmpty(message ="Este campo não pode estar vazio")
	@Size(min=5, max=30, message="Este campo deve conter dentre 3 e 30 caracteres")
	@Column(name="numero_conselho")
	private String numeroConselho;
	
	@OneToMany(mappedBy="veterinario", fetch=FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
	private Set<Prontuario> prontuarios;
	
	
	public String getNome() {
		return nome;
	}
	public Long getId() {
		return id;
	}
	public Set<Prontuario> getProntuarios() {
		return prontuarios;
	}
	public void setProntuarios(Set<Prontuario> prontuarios) {
		this.prontuarios = prontuarios;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEspecialidade() {
		return especialidade;
	}
	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}
	public String getNumeroConselho() {
		return numeroConselho;
	}
	public void setNumeroConselho(String numeroConselho) {
		this.numeroConselho = numeroConselho;
	}

	
}
