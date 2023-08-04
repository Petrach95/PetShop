package it.betacom.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import it.betacom.dao.AnimaleDao;
import it.betacom.dao.ClienteDao;
import it.betacom.model.Animale;
import it.betacom.model.Cliente;
//import it.betacom.service.ClienteService;

public class ExcelDataService {
	// ClienteService cs = new ClienteService();

	public List<List<String>> readFile(String path) {

		List<List<String>> righe = new ArrayList<>();
		// lista di lista di stringhe dove ogni lista di stringhe contiene le celle di
		// una riga del file
		try {
//			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(path));
//			HSSFWorkbook wb = new HSSFWorkbook(fs);
//			HSSFSheet sheet = wb.getSheetAt((short)0);
//			Iterator<Row> rowIterator = sheet.iterator();
			Iterator<Row> rowIterator = new HSSFWorkbook(new POIFSFileSystem(new FileInputStream(path)))
					.getSheetAt((short) 0).iterator();

			while (rowIterator.hasNext()) {

				Iterator<Cell> cellIterator = rowIterator.next().cellIterator();
				int i = 0;
				List<String> celle = new ArrayList<>();

				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_BLANK:
						celle.add(null);
						break;
					case Cell.CELL_TYPE_NUMERIC:
						if (i == 8) // INSERISCO IN QUESTA POSIZIONE LA DATA FORMATTATA
							celle.add(cell.getDateCellValue().toInstant().atZone(ZoneId.systemDefault())
									.toLocalDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
						else
							celle.add(Long.toString((long) cell.getNumericCellValue()));
						break;

					case Cell.CELL_TYPE_STRING:
						celle.add(cell.getStringCellValue());
						break;
					}
					i++;
				}
				righe.add(celle);
			}
			// rimuovo nell'array le due righe di intestazione del file excel
			righe.remove(0);
			righe.remove(0);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return righe;
	}

	public void setDbByFile(String path) {
		// SCANSIONO OGNI ELEMENTO DEL ESTRATTO DAL FILE
		ClienteDao cd = new ClienteDao();
		AnimaleDao ad = new AnimaleDao();

		for (List<String> l : readFile(path)) {

			// CONTROLLO SE IL CLIENTE è PRESENTE NEL DB
			Cliente c = cd.findClienteByName(l.get(0), l.get(1));

			// SE NON è PRESENTE VIENTE INSERITO
			if (c == null) {
				c = new Cliente(l.get(0), l.get(1), l.get(2), l.get(4), l.get(3));
				cd.save(c);
			}

			// INSERICO L'ANIMALE NEL DB
			Animale a = new Animale(l.get(5), l.get(6), Integer.parseInt(l.get(7)), LocalDate.parse(l.get(8)),
					Double.parseDouble(l.get(9)), c);
			ad.save(a);
		}
	}
}
