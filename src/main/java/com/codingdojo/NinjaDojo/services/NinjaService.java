package com.codingdojo.NinjaDojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.codingdojo.NinjaDojo.models.Ninja;
import com.codingdojo.NinjaDojo.repositories.NinjaRepository;

@Service
public class NinjaService {
	@Autowired
	NinjaRepository ninjaRepo;
	

	// get all ninjas
	public List<Ninja> allNinjas() {
		return ninjaRepo.findAll();
	}

	// create new ninja
	public Ninja newNinja(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
	// Get one Ninja
		public Ninja oneNinja(Long id) {
			    Optional<Ninja> Ninja = ninjaRepo.findById(id);
		        if(Ninja.isPresent()) {
		            return Ninja.get();
		        } else {
		            return null;
		        }
		}
		public void deleteNinja(Long id) {
			ninjaRepo.deleteById(id);
		}
		
		public Ninja updateNinja (Ninja ninja) {
			return ninjaRepo.save(ninja);
		}
}
