package it.betacom.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.betacom.dao.AnimaleDao;
import it.betacom.model.Animale;
import it.betacom.model.Utente;

/**
 * Servlet implementation class AcquistoServlet
 */
public class AcquistoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcquistoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		Utente utente = (Utente) s.getAttribute("user");
		
		RequestDispatcher requestDispatcher;
		if (utente != null) {
			AnimaleDao animaleDao = new AnimaleDao();
			Animale animale =  animaleDao.findAnimaleById(Integer.parseInt(request.getParameter("idAnimale")));
			animale.setCliente(utente.getCliente());
			animaleDao.update(animale);
			requestDispatcher = request.getRequestDispatcher("HomePage?p=C");
		} else {
			requestDispatcher = request.getRequestDispatcher("HomePage?p=L");
		}
		requestDispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			
		doGet(request, response);
	}

}
