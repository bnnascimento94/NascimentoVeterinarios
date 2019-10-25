package br.com.nascimentoveterinarios.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import br.com.nascimentoveterinarios.dominios.Prontuario;


public interface RepositorioProntuarios extends JpaRepository<Prontuario,Long> {
	
	 @Query("select p from Prontuario p where p.veterinario.nome like %:nome%")
     List<Prontuario> findByVeterinario(@Param("nome") String nome);
	 


}
