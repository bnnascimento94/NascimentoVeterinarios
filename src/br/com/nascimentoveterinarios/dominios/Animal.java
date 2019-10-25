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
@Table(name="anim_animal")
@JsonIdentityInfo(
		  generator = ObjectIdGenerators.PropertyGenerator.class, 
		  property = "id")
public class Animal {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@NotNull(message="Este campo é Obrigatório")
	@NotEmpty(message="Este campo é obrigatório")
	@Size(min=3, max=30, message="Este campo deve ter entre 3 e 30 caracteres")
	@Column(name="nome", nullable= false)
	private String nome;
	
	@NotNull(message= "Este campo é obrigatório")
	@Column(name="idade", nullable=false)
	private int idade;
	
	@NotNull(message="Este campo é Obrigatório")
	@NotEmpty(message="Este campo é obrigatório")
	@Size(min=3, max=30, message="Este campo deve ter entre 3 e 30 caracteres")
	@Column(name="raca", nullable= false)
	private String raca;
	
	@NotNull(message="Este campo é Obrigatório")
	@NotEmpty(message="Este campo é obrigatório")
	@Size(min=3, max=30, message="Este campo deve ter entre 3 e 30 caracteres")
	@Column(name="nome_dono", nullable= false)
	private String nomedono;
	

	@OneToMany(mappedBy="animal", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Prontuario> prontuarios;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<Prontuario> getProntuarios() {
		return prontuarios;
	}

	public void setProntuarios(Set<Prontuario> prontuarios) {
		this.prontuarios = prontuarios;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}

	public String getNomedono() {
		return nomedono;
	}

	public void setNomedono(String nomedono) {
		this.nomedono = nomedono;
	}


	

}
