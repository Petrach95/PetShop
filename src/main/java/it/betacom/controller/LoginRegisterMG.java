package it.betacom.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.betacom.dao.ClienteDao;
import it.betacom.dao.UtenteDao;
import it.betacom.logger.MyLogger;
import it.betacom.model.Cliente;
import it.betacom.model.Utente;
import it.betacom.service.UtenteService;

/**
 * Servlet implementation class LoginRegister
 */
public class LoginRegisterMG extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginRegisterMG() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UtenteDao utenteDao = new UtenteDao();
		response.setContentType("text/html");
		RequestDispatcher requestDispatcher = null;

		// CASE TRUE PER LOGIN CASE FALSE REGISTRA UTENTE
		switch (request.getParameter("login")) {

// REGISTER
		case "False":

			Utente utente = new Utente(request.getParameter("nome"), request.getParameter("cognome"),
					request.getParameter("email"), request.getParameter("tel"),
					LocalDate.parse(request.getParameter("data")), request.getParameter("pw"), "G", "A", 3);

			utente.setUsername(UtenteService.createUsername(utente));

			String risultato = UtenteService.saveService(utente) ? "Registrato: effettua il login"
					: "Errore: Email non disponibile";

			if (risultato.equals("Registrato: effettua il login")) {
				MyLogger.info("Registrazione effettuata per l'utente " + utente.getNome() + " " + utente.getCognome());
				MyLogger.debug("Creata username " + utente.getUsername() + " per l'utente " + utente.getNome() + " "
						+ utente.getCognome());
			}

			request.setAttribute("risultato", risultato);
			requestDispatcher = request.getRequestDispatcher("formlogin.jsp");

			break;

// LOGIN
		case "True":
			// RICEVO LE CREDENZIALI E CERCO L'UTENTE
			String password = request.getParameter("pw");
			Utente u = utenteDao.findUtenteByEmailUsername(request.getParameter("emus"));

//ACCOUNT NON TROVATO
			if (u == null) {
				request.setAttribute("risultato", "Errore: Account non trovato");
				requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
//PASSWORD ERRATA
			} else if (!u.getPassword().equals(password)) {

				// OTTENGO I TENTATIVI E NE SOTTRAGGO UNO
				int tentativi = u.getTentativi() - 1;
				MyLogger.debug("Password errata per l'utente " + u.getNome() + " " + u.getCognome());

				// SE I TENTATIVI SCENDONO A ZERO DISATTIVO L'ACCOUNT
				if (tentativi == 0) {
					u.setStato("D");
					MyLogger.info("Utente " + u.getNome() + " " + u.getCognome() + " con username " + u.getUsername()
							+ " disabilitato");
					request.setAttribute("risultato", "Errore: password errata account disattivato");
				} else {
					request.setAttribute("risultato", "Errore: password errata tentativi rimanenti " + tentativi);
				}

				// AGGIORNO I TENTATIVI
				u.setTentativi(tentativi);

				// AGGIORNO IL DB
				utenteDao.update(u);

				requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");

//ACCOUNT DISABILITATO
			} else if (u.getStato().equals("D")) {

				request.setAttribute("risultato", "Errore: Il tuo account è stato disabilitato.");
				requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
//CREDENZIALI CORRETTE
			} else {

				// ASSEGNO LA SESSIONE
				HttpSession session = request.getSession();
				session.setAttribute("user", u);

				if (u.getTentativi() < 3) {
					u.setTentativi(3);
					utenteDao.update(u);
				}
				MyLogger.debug("Login effettuato per l'utente " + u.getNome() + " " + u.getCognome());

				requestDispatcher = request.getRequestDispatcher("index.jsp");
			}
			break;
		}

		requestDispatcher.forward(request, response);

	}

}
