package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Institution;
import br.edu.ifsp.arq.ads.ifitness.model.entities.SpecieType;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class InstitutionSearchAnimalsHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String type = req.getParameter("type");
		SpecieType specieType = null;
		if(!type.isEmpty()) {
			specieType = SpecieType.valueOf(type);
		}
		String date = req.getParameter("initial-date");
		LocalDate initialDate = null;
		if(!date.isEmpty()) {
			initialDate = LocalDate.parse(date);
		}
		date = req.getParameter("final-date");
		LocalDate finalDate = null;
		if(!date.isEmpty()) {
			finalDate = LocalDate.parse(date);
		}
		
		HttpSession session = req.getSession(false);
		Institution institution = (Institution)session.getAttribute("institution");
		
		AnimalFilter filter = new AnimalFilter();
		filter.setInstitution(institution);
		filter.setType(specieType);
		filter.setInitialDate(initialDate);
		filter.setFinalDate(finalDate);
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> animals = null;
		try {
			animals = animalDao.getAnimalsByFilter(filter);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("institutionFilteredAnimals", animals);
		//TODO
		// qual seria a Home?
		return "/home.jsp";
	}

}
