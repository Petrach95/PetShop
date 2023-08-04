package it.betacom.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "animale")
public class Animale {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String tipo;
	private String nomeA;
	private int matricola;
	private LocalDate dataA;
	private double costo;
	@ManyToOne
	@JoinColumn(name="id_cliente", referencedColumnName="id")
	private Cliente cliente;
	
	
	public Animale() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Animale(String tipo, String nomeA, int matricola, LocalDate dataA, double costo) {
		this.tipo = tipo;
		this.nomeA = nomeA;
		this.matricola = matricola;
		this.dataA = dataA;
		this.costo = costo;
	}
	public Animale(String tipo, String nomeA, int matricola, LocalDate dataA, double costo, Cliente cliente) {
		this.tipo = tipo;
		this.nomeA = nomeA;
		this.matricola = matricola;
		this.dataA = dataA;
		this.costo = costo;
		this.cliente = cliente;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNomeA() {
		return nomeA;
	}
	public void setNomeA(String nomeA) {
		this.nomeA = nomeA;
	}
	public int getMatricola() {
		return matricola;
	}
	public void setMatricola(int matricola) {
		this.matricola = matricola;
	}
	public LocalDate getDataA() {
		return dataA;
	}
	public void setDataA(LocalDate dataA) {
		this.dataA = dataA;
	}
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
}
