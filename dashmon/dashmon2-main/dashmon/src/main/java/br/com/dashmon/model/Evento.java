package br.com.dashmon.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity 				        //indica que a classe Usuário é armazenável em BD
@Table(name="itmn_evento")
public class Evento {
	
	@Id					//indica que o atributo é chave-primaria
	@GeneratedValue(strategy=GenerationType.IDENTITY) // informo que é AUTO_INCREMENTE
	@Column(name="num_seq") // informa o nome da coluna no banco de dados
	private int numSeq;
	
	@Column(name="data_evt")
	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern="dd/MM/yyyy", shape=JsonFormat.Shape.STRING)
	private Date data;
	
	@ManyToOne
	@JsonIgnoreProperties("eventos")
	private Equipamento equip;
	
	@ManyToOne
	@JsonIgnoreProperties("eventos")
	private Alarme alarme;
	

	public int getNumSeq() {
		return numSeq;
	}

	public void setNumSeq(int numSeq) {
		this.numSeq = numSeq;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Equipamento getEquip() {
		return equip;
	}

	public void setEquip(Equipamento equip) {
		this.equip = equip;
	}

	public Alarme getAlarme() {
		return alarme;
	}

	public void setAlarme(Alarme alarme) {
		this.alarme = alarme;
	}

	public Evento(int numSeq, Date data, Equipamento equip, Alarme alarme) {
		super();
		this.numSeq = numSeq;
		this.data = data;
		this.equip = equip;
		this.alarme = alarme;
	}

	public Evento() {
		super();
	}	
	
	
}
