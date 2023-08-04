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
public class LoginRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UtenteDao utenteDao = new UtenteDao();
		ClienteDao clienteDao = new ClienteDao();
		
		boolean vecchioCliente = request.getParameter("old")==null?false:true;
		Cliente cliente = new Cliente(request.getParameter("nome"), request.getParameter("cognome"),
				request.getParameter("citta"), request.getParameter("indirizzo"),request.getParameter("tel"));
		
		//  SE VECCHIOCLIENTE = TRUE ALLORA CERCA CORRISPONDENZA SU DB ALTRIMENTI C=CLIENTE
		Cliente	c = vecchioCliente?clienteDao.findClienteByName(cliente):cliente;
		
		// VIENE FATTP CONTROLLO ULTERIORE SU C PRIMA DI ASSEGNARLO A UTENTE.
		// SE NON VIENE TROVATA CORRISPONDENZA C è NULL E GLI VIENE ASSEGNATO IL VALORE CI CLIENTE
		Utente utente = new Utente(request.getParameter("nome"), request.getParameter("cognome"),
				request.getParameter("email"), request.getParameter("tel"),
				LocalDate.parse(request.getParameter("data")),c==null?cliente:c);
		
		// NON C'è CORRISPONDENZA
		if (c == null) {
			request.setAttribute("risultato", "Errore: Non abbiamo trovato nessun cliente " );
			request.setAttribute("next", false);
		// EMAIL NON PRESENTE NEL DB
		}  else if (utenteDao.findUtenteByEmail(utente.getEmail()) == null) {
			utente.setUsername(UtenteService.createUsername(utente));
			request.setAttribute("next", true);
		// EMAIL PRESENTE
		} else {
			request.setAttribute("risultato", "Errore: Email già presente " );
			request.setAttribute("next", false);
		}
		
		request.setAttribute("utente", utente);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
		requestDispatcher.forward(request, response);
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
			
//				Integer idCliente = request.getParameter("idcliente")==null?null:Integer.parseInt(request.getParameter("idcliente"));
//				Integer idCliente = null;
//				
//				if (request.getParameter("idcliente")!=null) 
//					idCliente = Integer.parseInt(request.getParameter("idcliente"));
				String id =(request.getParameter("idcliente")!=null)?request.getParameter("idcliente"):null;
				Cliente cliente;
				// SE ID DIVERSO DA NULL CLIENTE ESISTENTE
				if (id != null) {
					cliente = new Cliente(Integer.parseInt(id),request.getParameter("nome"), request.getParameter("cognome"),
						request.getParameter("citta"), request.getParameter("indirizzo"),request.getParameter("tel"));
				// SE NUOVO CLIENTE VIENE AGGIUNTO
				} else  {
					ClienteDao clienteDao = new ClienteDao();
					cliente = new Cliente(request.getParameter("nome"), request.getParameter("cognome"),
							request.getParameter("citta"), request.getParameter("indirizzo"),request.getParameter("tel"));
					clienteDao.save(cliente);
					cliente = clienteDao.findClienteByName(cliente);
				}
//				// SE ID DIVERSO DA NULL CLIENTE ESISTENTE
//				Cliente cliente = new Cliente((request.getParameter("idcliente")!=null)?Integer.parseInt(request.getParameter("idcliente")):null,
//						request.getParameter("nome"), request.getParameter("cognome"),
//						request.getParameter("citta"), request.getParameter("indirizzo"),request.getParameter("tel"));
//				
//				// SE NUOVO CLIENTE VIENE AGGIUNTO
//				if (cliente.getId() != null) {
//					ClienteDao clienteDao = new ClienteDao();
//					clienteDao.save(cliente);
//					cliente = clienteDao.findClienteByName(cliente);
//				}
					
				Utente utente = new Utente(request.getParameter("nome"), request.getParameter("cognome"),
						request.getParameter("username"),request.getParameter("email"), request.getParameter("tel"),
						LocalDate.parse(request.getParameter("data")), request.getParameter("pw"), "C", "A", 3,cliente);
				
				utenteDao.save(utente);
				MyLogger.info("Registrazione effettuata per l'utente " + utente.getNome() + " " + utente.getCognome());
				MyLogger.debug("Creata username " + utente.getUsername() + " per l'utente " + utente.getNome() + " "
						+ utente.getCognome());
				
				
				request.setAttribute("risultato", "Registrato: effettua il login");
				requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
			break;
			
// LOGIN
		case "True":
				// RICEVO LE CREDENZIALI E CERCO L'UTENTE
				String password = request.getParameter("pw");
				Utente u = utenteDao.findUtenteByEmailUsername(request.getParameter("emus"));
				
// ACCOUNT NON TROVATO
				if (u==null) {
					request.setAttribute("risultato", "Errore: Account non trovato");
					requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
// PASSWORD ERRATA
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
					
// ACCOUNT DISABILITATO
				} else if (u.getStato().equals("D")) {
					
					request.setAttribute("risultato", "Errore: Il tuo account è stato disabilitato.");
					requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
// CREDENZIALI CORRETTE
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
