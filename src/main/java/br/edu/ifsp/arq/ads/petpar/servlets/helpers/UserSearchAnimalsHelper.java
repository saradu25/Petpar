package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.petpar.model.entities.Animal;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.SpecieType;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.StatusAdoption;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;
import com.mysql.jdbc.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSearchAnimalsHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String type = req.getParameter("type");
		SpecieType specieType = null;
		String initialDateString = req.getParameter("initial-date");
		LocalDate initialDate = null;
		String finalDateString = req.getParameter("final-date");
		LocalDate finalDate = null;

		if(!StringUtils.isNullOrEmpty(type)) {
			specieType = SpecieType.valueOf(type);
		}
		if(!StringUtils.isNullOrEmpty(initialDateString)) {
			initialDate = LocalDate.parse(initialDateString);
		}
		if(!StringUtils.isNullOrEmpty(finalDateString)) {
			finalDate = LocalDate.parse(finalDateString);
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
		return "/userAnimalList.jsp";
	}

}
