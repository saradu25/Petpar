package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Institution;
import br.edu.ifsp.arq.ads.ifitness.model.entities.SpecieType;
import br.edu.ifsp.arq.ads.ifitness.model.entities.StatusAdoption;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserSearchAnimalsHelper implements Helper {

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

		AnimalFilter filter = new AnimalFilter();
		filter.setType(specieType);
		filter.setInitialDate(initialDate);
		filter.setFinalDate(finalDate);
		filter.setStatusAdoption(StatusAdoption.PENDING);

		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> animals = null;
		try {
			animals = animalDao.getAnimalsByFilter(filter);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("filteredAnimals", animals);
		//TODO
		// qual seria a Home?
		return "/home.jsp";
	}

}
