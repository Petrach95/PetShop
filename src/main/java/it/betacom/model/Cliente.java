package it.betacom.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "cliente")
public class Cliente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nome;
	private String cognome;
	private String citta;
	private String indirizzo;
	private String telefono;
	@OneToMany(mappedBy="cliente")
	private List<Animale> animali;
	
	
	public Cliente() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cliente(String nome, String cognome, String citta, String indirizzo, String telefono) {
		this.nome = nome;
		this.cognome = cognome;
		this.citta = citta;
		this.indirizzo = indirizzo;
		this.telefono = telefono;
	}
	
	public Cliente(int id, String nome, String cognome, String citta, String indirizzo, String telefono) {
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.citta = citta;
		this.indirizzo = indirizzo;
		this.telefono = telefono;
	}
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
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public List<Animale> getAnimali() {
		return animali;
	}
	public void setAnimali(List<Animale> animali) {
		this.animali = animali;
	}
	
}
