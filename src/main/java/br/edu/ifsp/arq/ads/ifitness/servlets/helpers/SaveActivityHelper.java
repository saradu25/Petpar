package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import java.time.LocalDate;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.model.entities.SpecieType;
import br.edu.ifsp.arq.ads.ifitness.model.entities.User;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveActivityHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long id = Long.parseLong(req.getParameter("id"));
		SpecieType type = SpecieType.valueOf(req.getParameter("type"));
		LocalDate date = LocalDate.parse(req.getParameter("date"));
		Double distance = Double.parseDouble(req.getParameter("distance"));
		Integer duration = Integer.parseInt(req.getParameter("duration"));

		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = new Animal();
		animal.setType(type);
		animal.setDate(date);
		animal.setDistance(distance);
		animal.setDuration(duration);
		animal.setUser(user);
		if(id == 0) {
			if(animalDao.save(animal)) {
				req.setAttribute("result", "registered");
			}
		}else {
			animal.setId(id);
			if(animalDao.update(animal)) {
				req.setAttribute("result", "registered");
			}
		}
		return "/activity-register.jsp";
	}

}
