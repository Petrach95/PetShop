package it.betacom.service;

import it.betacom.dao.UtenteDao;
import it.betacom.model.Utente;

public class UtenteService {
		
	public static boolean saveService(Utente utente) {

		UtenteDao utenteDao = new UtenteDao();
		
		//  CERCA SE è PRESENTE L'EMAIL
		Utente u = utenteDao.findUtenteByEmail(utente.getEmail());
		if(u == null) {
				// SE NON SONO PRESENTI SALVA E RITORNA 1
			utenteDao.save(utente);
			return true;
		} else
			return false;
	}
	
	public static String createUsername(Utente utente) {
		UtenteDao utenteDao = new UtenteDao();
		String nome = utente.getNome().substring(0, 2);
		String cognome = utente.getCognome().substring(0, 2);
		String anno = Integer.toString(utente.getDataNascita().getYear());
		
		String username = nome + cognome + anno;
		int i = 1;
		while (true) {
			Utente u = utenteDao.findUtenteByUsername(username);
			if(u == null) {
				return username;
			} else {
				username = nome + cognome + anno + "_" + i;
				i++;
			}
		}
	}
}
