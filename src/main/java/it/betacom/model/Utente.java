package it.betacom.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "utente")
public class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nome;
	private String cognome;
	private String username;
	private String email;
	private String telefono;
	private LocalDate dataNascita;
	private String password;
	private String ruolo;
	private String stato;
	private int tentativi;
	@OneToOne
	private Cliente cliente;
	
	public Utente() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Utente(String nome, String cognome, String email, String telefono, 
			LocalDate dataNascita, String password, String ruolo, String stato, int tentativi) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.password = password;
		this.ruolo = ruolo;
		this.stato = stato;
		this.tentativi = tentativi;
	}
	
	// COSTRUTTORE USATO IN EDIT SERVLET
	public Utente(int id, String nome, String cognome, String username, String email, String telefono,
			LocalDate dataNascita, String password, String ruolo, String stato, int tentativi) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.email = email;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.password = password;
		this.ruolo = ruolo;
		this.stato = stato;
		this.tentativi = tentativi;
	}

	public Utente(String nome, String cognome, String email, String telefono, 
			LocalDate dataNascita, Cliente cliente) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.cliente = cliente;
	}

	public Utente(String nome, String cognome, String username, String email, String telefono, LocalDate dataNascita,
			String password, String ruolo, String stato, int tentativi,Cliente cliente) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.email = email;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.password = password;
		this.ruolo = ruolo;
		this.stato = stato;
		this.tentativi = tentativi;
		this.cliente = cliente;
	}

	public Utente(int id, String nome, String cognome, String username, String email, String telefono,
			LocalDate dataNascita, String password, String ruolo, String stato, int tentativi, Cliente cliente) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.email = email;
		this.telefono = telefono;
		this.dataNascita = dataNascita;
		this.password = password;
		this.ruolo = ruolo;
		this.stato = stato;
		this.tentativi = tentativi;
		this.cliente = cliente;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public LocalDate getDataNascita() {
		return dataNascita;
	}
	public void setDataNascita(LocalDate dataNascita) {
		this.dataNascita = dataNascita;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRuolo() {
		return ruolo;
	}
	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}
	public String getStato() {
		return stato;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}

	public int getTentativi() {
		return tentativi;
	}
	public void setTentativi(int tentativi) {
		this.tentativi = tentativi;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	@Override
	public String toString() {
		return "Utente [id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", username=" + username + ", email="
				+ email + ", telefono=" + telefono + ", dataNascita=" + dataNascita + ", password=" + password
				+ ", ruolo=" + ruolo + ", stato=" + stato + ", tentativi=" + tentativi + "]";
	}

	
}
