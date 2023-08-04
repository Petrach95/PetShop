package it.betacom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.betacom.model.Utente;

/**
 * Servlet implementation class HomePage
 */
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomePage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// VERIFICO SE LA SESSIONE è NULL O ESISTE
		HttpSession session = request.getSession();
		Utente u = (Utente) (session.getAttribute("user") == null ? null : session.getAttribute("user"));
		RequestDispatcher requestDispatcher = null;
		String pagina = request.getParameter("p");
		String tipo = (request.getParameter("tipo")==null)?null:request.getParameter("tipo");
		
		switch (pagina) {
		case "I":requestDispatcher = request.getRequestDispatcher("index.jsp");break;
		case "C":			
			request.setAttribute("tipo", tipo);
			requestDispatcher = request.getRequestDispatcher("catalogo.jsp");break;
		case "L":requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");break;
		case "A":
			if (u == null) 
				requestDispatcher = request.getRequestDispatcher("formlogin2.jsp");
			else 
				requestDispatcher = request.getRequestDispatcher("areacliente.jsp");break;
		case "U":requestDispatcher = request.getRequestDispatcher("utenti.jsp");break;
		case "V":requestDispatcher = request.getRequestDispatcher("vendite.jsp");break;
		}

		requestDispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
