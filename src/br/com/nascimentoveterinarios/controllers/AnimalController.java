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

import br.com.nascimentoveterinarios.dominios.Animal;
import br.com.nascimentoveterinarios.repositorios.RepositorioAnimal;

@Controller
@RequestMapping("/animais")
public class AnimalController {
	
	@Autowired
	private RepositorioAnimal repositorioAnimal;
	
	@RequestMapping(value="/adicionar", method = RequestMethod.GET)
	public String adicionar(Model model) {
		model.addAttribute("animal", new Animal());
		return "animal.adicionar.tiles";
	}
	
	@RequestMapping(value ="/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("animal") @Valid Animal novoAnimal,BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "animal.adicionar.tiles";
		}
		repositorioAnimal.save(novoAnimal);
		return "redirect:/animais/listar";
	}
	
	@RequestMapping(value="/listar", method = RequestMethod.GET)
	public String listar(Model model) {
		List<Animal> animais = repositorioAnimal.findAll();
		model.addAttribute("animal",animais);
		return "animal.listar.tiles";
	}
	
	@RequestMapping(value="/alterar/{id}", method = RequestMethod.GET)
	public String alterar(@PathVariable("id") Long id,Model model) {
		Animal animalAlteracao = repositorioAnimal.findOne(id);
		model.addAttribute("animal", animalAlteracao);
		return "animal.alterar.tiles";
	}
	
	@RequestMapping(value="/alterar", method = RequestMethod.POST)
	public String alterar(@ModelAttribute("animal") @Valid Animal animal, BindingResult result) {
		if(result.hasErrors()) {
			return "animal.alterar.tiles";
		}
		repositorioAnimal.save(animal);
		return"redirect:/animais/listar";
	}
	
	@RequestMapping(value="/excluir/{id}", method= RequestMethod.GET)
	public String excluir(@PathVariable("id") Long id) {
		repositorioAnimal.delete(id);
		return "redirect:/animais/listar";	
	}
	
	@RequestMapping(value="/porNome", method = RequestMethod.GET, produces ="application/json")
	public @ResponseBody List<Animal> pesquisarPorNome(@RequestParam(name="nome",defaultValue="") String nomeAnimal){
		return repositorioAnimal.findByNome(nomeAnimal);
	}
	
}