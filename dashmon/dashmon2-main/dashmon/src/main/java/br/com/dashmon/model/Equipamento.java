package br.com.dashmon.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity 				        //indica que a classe Usuário é armazenável em BD
@Table(name="itmn_equipamento")
public class Equipamento {

	@Id					//indica que o atributo é chave-primaria
	@GeneratedValue(strategy=GenerationType.IDENTITY) // informo que é AUTO_INCREMENTE
	@Column(name="id_equip") // informa o nome da coluna no banco de dados
	private int id;
	
	@Column(name="hostname", length =50, nullable = false, unique = false)
	private String hostname;
	
	@Column(name="ipaddr", length =15, nullable = false, unique = false)
	private String ipaddr;
	
	@OneToMany(mappedBy="equip", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("equip")
	private List<Evento> eventos;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getIpaddr() {
		return ipaddr;
	}

	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}

	public List<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}

	public Equipamento(int id, String hostname, String ipaddr, List<Evento> eventos) {
		super();
		this.id = id;
		this.hostname = hostname;
		this.ipaddr = ipaddr;
		this.eventos = eventos;
	}

	public Equipamento() {
		super();
	}
	
	
	
	
	
}
