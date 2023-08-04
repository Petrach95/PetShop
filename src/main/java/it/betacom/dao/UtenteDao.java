package it.betacom.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import it.betacom.model.Utente;

public class UtenteDao {
	Session s = new Configuration().configure("hb.cfg.xml").buildSessionFactory().openSession();
	

	@SuppressWarnings("unchecked")
	public List<Utente> findAll() {
		return s.createQuery("from Utente").list();
	}

	public Utente findUtenteById(int id) {
		return s.load(Utente.class, id);
	}

	public Utente findUtenteByUsername(String username) {
		try {
			return (Utente) s.createQuery("from Utente where username = '" + username + "'")
					.list().get(0);
		} catch (Exception e) {
			return null;
		}
	}
	public Utente findUtenteByEmail(String email) {
		try {
			return (Utente) s.createQuery("from Utente where  email = '" + email + "'")
					.list().get(0);
		} catch (Exception e) {
			return null;
		}
	}
	public Utente findUtenteByEmailUsername(String ue) {
		try {
			return (Utente) s.createQuery("from Utente where ("
					+ "username = '" + ue + "' or email = '" + ue + "')")
					.list().get(0);
		} catch (Exception e) {
			return null;
		}
	}

	public void save(Utente utente) {
		s.beginTransaction();
		s.save(utente);
		s.getTransaction().commit();
	}
	
	public void update(Utente utente) {
		s.beginTransaction();
		s.update(utente);
		s.getTransaction().commit();
	}
	
	public void delete(Utente utente) {
		s.beginTransaction();
		s.delete(utente);
		s.getTransaction().commit();
	}

}
