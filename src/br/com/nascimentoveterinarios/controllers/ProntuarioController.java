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


import br.com.nascimentoveterinarios.dominios.Prontuario;
import br.com.nascimentoveterinarios.repositorios.RepositorioAnimal;
import br.com.nascimentoveterinarios.repositorios.RepositorioProntuarios;
import br.com.nascimentoveterinarios.repositorios.RepositorioVeterinario;

@Controller 
@RequestMapping("/prontuarios")
public class ProntuarioController {
	@Autowired
	private RepositorioAnimal repositorioAnimais;
	@Autowired
	private RepositorioVeterinario repositorioVeterinario;
	@Autowired
	private RepositorioProntuarios repositorioProntuarios;
	
	@RequestMapping(value="/adicionar", method=RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("prontuario", new Prontuario());	
		model.addAttribute("animal", repositorioAnimais.findAll());
		model.addAttribute("veterinario", repositorioVeterinario.findAll());
		return "prontuario.adicionar.tiles";
	}
	
	@RequestMapping(value="/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("prontuario") @Valid Prontuario prontuario,BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("animal", repositorioAnimais.findAll());
			model.addAttribute("veterinario", repositorioVeterinario.findAll());
			return "prontuario.adicionar.tiles";
		}
		repositorioProntuarios.save(prontuario);
		return "redirect:/prontuarios/listar";
	}
	
	@RequestMapping(value="/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable("id")Long id,Model model) {
		Prontuario prontuario = repositorioProntuarios.findOne(id);
		model.addAttribute("prontuario", prontuario);
		model.addAttribute("animal", repositorioAnimais.findAll());
		model.addAttribute("veterinario", repositorioVeterinario.findAll());
		return "prontuario.alterar.tiles";
	}
	
	@RequestMapping(value="/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("prontuario") @Valid Prontuario prontuario, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("animal", repositorioAnimais.findAll());
			model.addAttribute("veterinario", repositorioVeterinario.findAll());
			return "prontuario.alterar.tiles";
		}
		repositorioProntuarios.save(prontuario);
		return "redirect:/prontuarios/listar";
		
	}
	
	@RequestMapping(value="/excluir/{id}", method = RequestMethod.GET)
	public String excluir(@PathVariable("id")Long id) {
		Prontuario prontuario = repositorioProntuarios.findOne(id);
		prontuario.setAnimal(null);
		prontuario.setVeterinario(null);
		repositorioProntuarios.delete(prontuario);
		return "redirect:/prontuarios/listar";
	}
	
	@RequestMapping(value="/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		List<Prontuario> prontuarios=repositorioProntuarios.findAll();
		model.addAttribute("prontuario", prontuarios);
		return "prontuario.listar.tiles";
	}
	
	@RequestMapping(value="/porNome", method = RequestMethod.GET, produces ="application/json")
	public @ResponseBody List<Prontuario> pesquisarPorNome(@RequestParam(name="nome",defaultValue="") String nomeVeterinario){
		return repositorioProntuarios.findByVeterinario(nomeVeterinario);
	}
	
	
}
