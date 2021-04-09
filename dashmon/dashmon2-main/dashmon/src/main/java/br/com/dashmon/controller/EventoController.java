package br.com.dashmon.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import br.com.dashmon.dao.EventoDAO;
import br.com.dashmon.model.Evento;

@RestController
@CrossOrigin("*")

public class EventoController {
	
	@Autowired
	private EventoDAO dao;
	
	@GetMapping("/eventos/{ini}/{fim}")
	public ResponseEntity<List<Evento>> getIntervalo(@PathVariable String ini, @PathVariable String fim){
		try {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		Date vini = formato.parse(ini);
		Date vfim = formato.parse(fim);
		
		List<Evento> lista = dao.findByDataBetween(vini, vfim);
		
		if (lista.size()==0) {
			return ResponseEntity.status(404).build();
		}else {
			return ResponseEntity.ok(lista);
		}
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).build();
		}
		
	}
	

}
