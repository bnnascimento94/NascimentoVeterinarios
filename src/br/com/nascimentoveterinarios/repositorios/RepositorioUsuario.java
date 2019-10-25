package br.com.nascimentoveterinarios.repositorios;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.nascimentoveterinarios.dominios.Usuario;


public interface RepositorioUsuario extends JpaRepository<Usuario, Long> {
	
	 @Query("select u from Usuario u where u.username like %:nome%")
     List<Usuario> findByUsernameLista(@Param("nome") String nome);
	 
	 Usuario findByUsername(String username);

}
