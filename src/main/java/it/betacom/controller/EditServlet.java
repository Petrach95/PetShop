package it.betacom.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.dao.AnimaleDao;
import it.betacom.dao.ClienteDao;
import it.betacom.dao.UtenteDao;
import it.betacom.model.Animale;
import it.betacom.model.Cliente;
import it.betacom.model.Utente;

/**
 * Servlet implementation class EditServlet
 */
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDao utenteDao = new UtenteDao();
		String id = request.getParameter("idEdit")==null?request.getParameter("idDelete"):request.getParameter("idEdit");
		Utente u = utenteDao.findUtenteById(Integer.parseInt(id));
		
		RequestDispatcher requestDispatcher;
		
		
		if (request.getParameter("idEdit")==null) {
			
			utenteDao.delete(u);
			// SE IL RUOLO è CLIENTE ALLORA ELIMINA PRIMA GLI ANIMALI ACQUISTATI POI IL RECORD DEL CLIENTE
			if (u.getRuolo().equals("C")) {
				ClienteDao clienteDao = new ClienteDao();
				AnimaleDao animaleDao = new AnimaleDao();
				Cliente cliente = clienteDao.findClienteById(u.getCliente().getId());
				for (Animale a : cliente.getAnimali()) {
					animaleDao.delete(a);
				}
				clienteDao.delete(cliente);
			}
			requestDispatcher = request.getRequestDispatcher("utenti.jsp");

		} else {
			
			request.setAttribute("utente", u);
			requestDispatcher = request.getRequestDispatcher("edit.jsp");
			
		}
		requestDispatcher.forward(request, response);			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDao utenteDao = new UtenteDao();
		Cliente cliente;

		response.setContentType("text/html");
		
		Utente utente = new Utente(Integer.parseInt(request.getParameter("id")), request.getParameter("nome"),
				request.getParameter("cognome"), request.getParameter("username"), request.getParameter("email"),
				request.getParameter("tel"), LocalDate.parse(request.getParameter("data")), 
				request.getParameter("pw"), request.getParameter("ruolo"), request.getParameter("stato"),
				Integer.parseInt(request.getParameter("tentativi")));
		
		// SE IL RUOLO è CLIENTE ALLORA CONTIENTE ANCHE QUESTI DATI E LI MODIFICA ALTRIMENTI MODIFICA SOLO UTENTE
		if (utente.getRuolo().equals("C")) {
			ClienteDao clienteDao = new ClienteDao();
			cliente = new Cliente(Integer.parseInt(request.getParameter("idcliente")),request.getParameter("nome"), request.getParameter("cognome"),
					request.getParameter("citta"), request.getParameter("indirizzo"),request.getParameter("tel"));
			utente.setCliente(cliente);
			clienteDao.update(cliente);
		}
		
		if (utente.getStato().equals("A") && utente.getTentativi()==0)
			utente.setTentativi(3);
		utenteDao.update(utente);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage?p=U");
		requestDispatcher.forward(request, response);
	}

}
