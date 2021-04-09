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
@Table(name="itmn_alarme")
public class Alarme {

	@Id					//indica que o atributo é chave-primaria
	@GeneratedValue(strategy=GenerationType.IDENTITY) // informo que é AUTO_INCREMENTE
	@Column(name="id_alarme") // informa o nome da coluna no banco de dados
	private int id;
	
	@Column(name="nome", length =100, nullable = false, unique = false)
	private String nome;
	
	@Column(name="descricao", length =200, nullable = false, unique = false)
	private String descricao;
	
	@OneToMany(mappedBy="alarme", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("alarme")
	private List<Evento> eventos;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public List<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}

	public Alarme(int id, String nome, String descricao, List<Evento> eventos) {
		super();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.eventos = eventos;
	}

	public Alarme() {
		super();
	}	
		
}
