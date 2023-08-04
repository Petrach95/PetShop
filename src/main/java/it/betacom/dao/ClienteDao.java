package it.betacom.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import it.betacom.model.Cliente;

public class ClienteDao {
	Session s = new Configuration().configure("hb.cfg.xml").buildSessionFactory().openSession();
	
	@SuppressWarnings("unchecked")
	public List<Cliente> findAll() {
		return s.createQuery("from Cliente").list();
	}

	public Cliente findClienteById(int id) {
		return s.load(Cliente.class, id);
	}

	public Cliente findClienteByName(String nome, String cognome) {
		try {
			return (Cliente) s.createQuery("from Cliente where nome = '" + nome + "' and cognome = '" + cognome + "'").list().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	public Cliente findClienteByName(Cliente cliente) {
		try {
			return (Cliente) s.createQuery("from Cliente where "
					+ "nome = '" + cliente.getNome() + "' and "
					+ "cognome = '" + cliente.getCognome() + "' and "
					+ "citta = '" + cliente.getCitta() + "' and "
					+ "indirizzo = '" + cliente.getIndirizzo() + "' and "
					+ "telefono = '" + cliente.getTelefono()+"'").list().get(0);
		} catch (Exception e) {
			return null;
		}
	}
	public void save(Cliente cliente) {
		s.beginTransaction();
		s.save(cliente);
		s.getTransaction().commit();
	}
	public void update(Cliente cliente) {
		s.beginTransaction();
		s.update(cliente);
		s.getTransaction().commit();
	}
	public void delete(Cliente cliente) {
		s.beginTransaction();
		s.delete(cliente);
		s.getTransaction().commit();
	}

}
