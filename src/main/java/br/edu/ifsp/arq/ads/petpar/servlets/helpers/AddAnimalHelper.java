package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import java.time.LocalDate;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.*;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddAnimalHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String name = String.valueOf(req.getParameter("name"));
		String description = String.valueOf(req.getParameter("description"));
		Gender gender = Gender.valueOf(req.getParameter("gender"));
		LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));
		SpecieType type = SpecieType.valueOf(req.getParameter("type"));
		LocalDate postedAt = LocalDate.now();

		HttpSession session = req.getSession(false);
		Institution institution = (Institution)session.getAttribute("institution");
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = new Animal();
		animal.setName(name);
		animal.setDescription(description);
		animal.setGender(gender);
		animal.setBirthDate(birthDate);
		animal.setType(type);
		animal.setPostedAt(postedAt);
		animal.setInstitution(institution);
		animal.setStatusAdoption(StatusAdoption.PENDING);


		if(animalDao.save(animal)) {
			req.setAttribute("result", "registered");
			return "/paginaRecebimentoInstituicao.jsp.jsp";
		}else {
			req.setAttribute("result", "notRegistered");
			return "/userRegister.jsp";
		}
		//TODO tela de animal em adoção pendente?
	}

}
