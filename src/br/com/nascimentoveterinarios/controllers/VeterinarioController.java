package br.com.nascimentoveterinarios.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.nascimentoveterinarios.dominios.Veterinario;
import br.com.nascimentoveterinarios.repositorios.RepositorioVeterinario;


@Controller
@RequestMapping("/veterinarios")
public class VeterinarioController {
	
	@Autowired
	private RepositorioVeterinario repositorioVeterinario;

	@RequestMapping(value="/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("veterinario", new Veterinario());
		return "veterinario.adicionar.tiles";
	}
	
	@RequestMapping(value="/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		model.addAttribute("veterinario", repositorioVeterinario.findAll());
		return "veterinario.listar.tiles";
	}
	
	
	@RequestMapping(value="/adicionar", method = RequestMethod.POST)
	public String adcionar(@ModelAttribute("veterinario") @Valid Veterinario veterinario, BindingResult result, Model model) {
		if(result.hasErrors() ) {
			return "veterinario.adicionar.tiles";
		}
		repositorioVeterinario.save(veterinario);
		return "redirect:/veterinarios/listar";
	}
	
	@RequestMapping(value="/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable("id") Long id, Model model) {
		Veterinario veterinario = repositorioVeterinario.findOne(id);
		model.addAttribute("veterinario", veterinario);
		return "veterinario.alterar.tiles";
	}
	
	@RequestMapping(value="/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("veterinario") @Valid Veterinario veterinario, BindingResult result) {
		if(result.hasErrors()) {
			return "veterinario.alterar.tiles";	
		}
		repositorioVeterinario.save(veterinario);
		return "redirect:/veterinarios/listar";
	}
	
	@RequestMapping(value="/excluir/{id}", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Long id) {
		repositorioVeterinario.delete(id);
		return "redirect:/veterinarios/listar";
	}
	
	
	
	@RequestMapping(value="/porNome", method = RequestMethod.GET, produces ="application/json")
	public @ResponseBody List<Veterinario> pesquisarPorNome(@RequestParam(name="nome",defaultValue="") String nomeVeterinario){
		return repositorioVeterinario.findByNome(nomeVeterinario);
		
	}
	
}
