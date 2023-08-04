package it.betacom.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import it.betacom.service.ExcelDataService;

/**
 * Servlet implementation class ImportServlet
 */
public class ImportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath = null;
        

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        // Genera un nome univoco per il file caricato
                        String fileName = item.getName();
                        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                        
                        // Salva il file nella posizione temporanea del server
                        File uploadDir = new File("/ArchivioExcell");
                        File uploadedFile = new File(uploadDir, uniqueFileName);
                        item.write(uploadedFile);

                        // Ottieni il percorso completo del file
                        filePath = uploadedFile.getAbsolutePath();
                        ExcelDataService eds = new ExcelDataService();
                        eds.setDbByFile(filePath);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("vendite.jsp");
		requestDispatcher.forward(request, response);
	}

}
