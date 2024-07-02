package com.codingdojo.NinjaDojo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.NinjaDojo.models.Dojo;
import com.codingdojo.NinjaDojo.models.Ninja;

import com.codingdojo.NinjaDojo.services.DojoService;
import com.codingdojo.NinjaDojo.services.NinjaService;


import jakarta.validation.Valid;

@Controller
public class HomeController {
	@Autowired
	DojoService dojos;

	@Autowired
	NinjaService ninjas;

	@GetMapping("/")
	public String index(@ModelAttribute("dojo") Dojo dojo, Model model) {
		model.addAttribute("dojos", dojos.findAllDojos());
		return "index.jsp";
	}

	@PostMapping("/newDojo")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dojos.findAllDojos());
			return "index.jsp";
		} else {
			dojos.create(dojo);
			return "redirect:/";
		}

	}
	
	@GetMapping("/addNinja")
	public String addNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", dojos.findAllDojos());
		return "NinjaForm.jsp";
	}
	

	@PostMapping("/newNinja")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dojos.findAllDojos());
			return "NinjaForm.jsp";
		} else {
			ninjas.newNinja(ninja);
			return "redirect:/";
		}

	}
	
	@GetMapping("/dojo/{id}")
	public String getDojoDetails( @PathVariable("id") Long id, Model model) {
			model.addAttribute("dojo", dojos.oneDojo(id));
			
		return "dojoDetails.jsp";
		
	}
	
	
	@DeleteMapping("dojo/delete/{id}")
	public String deleteDojo(@PathVariable("id") Long id) {
		dojos.deleteDojo(id);
		return "redirect:/";
	}
	
	@DeleteMapping("ninja/delete/{id}")
	public String deleteNinja(@PathVariable("id") Long id) {
		ninjas.deleteNinja(id);
		return "redirect:/";
	}
	
	
	 @GetMapping("/ninja/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Ninja ninja = ninjas.oneNinja(id);
	        model.addAttribute(ninja);
	        return "NinjaForm.jsp";
	    }
	 
	 @PutMapping("/ninja/{id}/update")
	    public String updateNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
	    	if (result.hasErrors()) {
				model.addAttribute("ninjas", ninja);
	            return "edit.jsp";
	        } else {
	            ninjas.updateNinja(ninja);
	            return "redirect:/";
	        }
	 }
	
}
