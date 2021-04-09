package br.com.dashmon.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.dashmon.model.Evento;

public interface EventoDAO extends CrudRepository<Evento,Integer>{

	public List<Evento> findByDataBetween(Date inicio, Date fim);
	
}

