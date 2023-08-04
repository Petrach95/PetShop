package it.betacom.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

import it.betacom.model.Animale;

public class AnimaleDao {

	Session s = new Configuration().configure("hb.cfg.xml").buildSessionFactory().openSession();
	
	@SuppressWarnings("unchecked")
	public List<Animale> findAll() {
		return (List<Animale>) s.createQuery("from Animale").list();
	}
	
	// RITORNA TUTTI GLI ANIMALI ORDINATI PER DATA CRESCENTE
	@SuppressWarnings("unchecked")
	public List<Animale> findAllDateAsc() {
		return (List<Animale>) s.createQuery("from Animale order by dataA asc").list();
	}
	// UTILIZZATO IN CATALOGO.JSP
	// RITORNA TUTTI GLI ANIMALI ORDINATI PER DATA CRESCENTE
	@SuppressWarnings("unchecked")
	public List<Animale> findAllInVendita() {
		return (List<Animale>) s.createQuery("from Animale where id_cliente = null").list();
	}

	public Animale findAnimaleById(int id) {
		
		return s.load(Animale.class, id);

	}

	public void save(Animale animale) {
        s.beginTransaction();
        s.save(animale);
        s.getTransaction().commit();
	}
	
	public void update(Animale animale) {
		s.beginTransaction();
		s.update(animale);
		s.getTransaction().commit();
	}
	
	public void delete(Animale animale) {
		s.beginTransaction();
		s.delete(animale);
		s.getTransaction().commit();
	}

}
