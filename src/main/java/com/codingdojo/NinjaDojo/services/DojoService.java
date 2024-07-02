package com.codingdojo.NinjaDojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.NinjaDojo.models.Dojo;
import com.codingdojo.NinjaDojo.repositories.DojoRepository;


@Service
public class DojoService {
	@Autowired
	DojoRepository dojoRepo;

	// get all dojos
	public List<Dojo> findAllDojos() {
		return dojoRepo.findAll();
	}

	// create new dojo
	public Dojo create(Dojo dojo) {
		return dojoRepo.save(dojo);
	}

	// Get one Dojo
	public Dojo oneDojo(Long id) {
		    Optional<Dojo> Dojo = dojoRepo.findById(id);
	        if(Dojo.isPresent()) {
	            return Dojo.get();
	        } else {
	            return null;
	        }
	}
	public void deleteDojo(Long id) {
		dojoRepo.deleteById(id);
	}
	
	public Dojo updateDojo (Dojo dojo) {
		return dojoRepo.save(dojo);
	}
}
	

