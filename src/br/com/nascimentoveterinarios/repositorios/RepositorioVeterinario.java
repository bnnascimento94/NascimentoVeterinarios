package br.com.nascimentoveterinarios.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.nascimentoveterinarios.dominios.Veterinario;


public interface RepositorioVeterinario extends  JpaRepository<Veterinario, Long> {
	
	 @Query("select v from Veterinario v where v.nome like %:nome%")
     List<Veterinario> findByNome(@Param("nome") String nome);
	
}
