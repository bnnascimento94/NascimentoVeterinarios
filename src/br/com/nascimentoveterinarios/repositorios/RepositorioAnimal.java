package br.com.nascimentoveterinarios.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import br.com.nascimentoveterinarios.dominios.Animal;

public interface RepositorioAnimal extends JpaRepository<Animal,Long> {
	
	 @Query("select a from Animal a where a.nome like %:nome%")
     List<Animal> findByNome(@Param("nome") String nome);

}
