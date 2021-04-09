package br.com.dashmon.dao;

import org.springframework.data.repository.CrudRepository;

import br.com.dashmon.model.Alarme;

public interface AlarmeDAO extends CrudRepository<Alarme,Integer>{	
	

}