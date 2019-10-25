package br.com.nascimentoveterinarios.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.nascimentoveterinarios.dominios.Usuario;
import br.com.nascimentoveterinarios.repositorios.RepositorioUsuario;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private RepositorioUsuario repositorio;
	
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		List<Usuario> usuarios = repositorio.findAll();
		model.addAttribute("usuarios", usuarios);
		return "usuarios.listar.tiles";
	}
	
	@RequestMapping(value="/adicionar", method= RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("usuario", new Usuario());
		
		return "usuarios.adicionar.tiles";
	}
	
	
	@RequestMapping(value="/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult result) {
		if(result.hasErrors()) {
			return "usuarios.adicionar.tiles";
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); //classe respons�vel por criptografar a senha no spring security
		usuario.setPassword(encoder.encode(usuario.getPassword()));
		repositorio.save(usuario);
		
		return "redirect:/usuarios/listar";
	}
	
	@RequestMapping(value="/porNome", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Usuario> pesquisarPorNome(@RequestParam(name="nome",defaultValue="") String nome) {
		return repositorio.findByUsernameLista(nome);
	}
	

}
