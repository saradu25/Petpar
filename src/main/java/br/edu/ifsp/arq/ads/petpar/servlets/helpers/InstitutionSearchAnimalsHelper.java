package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.petpar.model.entities.Animal;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.model.entities.SpecieType;
import br.edu.ifsp.arq.ads.petpar.model.entities.StatusAdoption;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;
import com.mysql.jdbc.StringUtils;

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
		String initialDateString = req.getParameter("initial-date");
		LocalDate initialDate = null;
		String finalDateString = req.getParameter("final-date");
		LocalDate finalDate = null;
		String status = req.getParameter("statusAdoption");
		StatusAdoption statusAdoption =null;

		if(!StringUtils.isNullOrEmpty(type)) {
			specieType = SpecieType.valueOf(type);
		}
		if(!StringUtils.isNullOrEmpty(initialDateString)) {
			initialDate = LocalDate.parse(initialDateString);
		}
		if(!StringUtils.isNullOrEmpty(finalDateString)) {
			finalDate = LocalDate.parse(finalDateString);
		}
		if(!StringUtils.isNullOrEmpty(status)) {
			statusAdoption = StatusAdoption.valueOf(status);
		}


		HttpSession session = req.getSession(false);
		Institution institution = (Institution)session.getAttribute("institution");
		
		AnimalFilter filter = new AnimalFilter();
		filter.setInstitution(institution);
		filter.setType(specieType);
		filter.setInitialDate(initialDate);
		filter.setFinalDate(finalDate);
		filter.setStatusAdoption(statusAdoption);
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> animals = null;
		try {
			animals = animalDao.getAnimalsByFilter(filter);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("institutionFilteredAnimals", animals);
		return "/institutionAnimalList.jsp";
	}

}
