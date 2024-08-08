package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateActivityHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long activityId = Long.parseLong(req.getParameter("activity-id"));
			
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = animalDao.getActivitiesById(activityId);
		if(animal != null) {
			req.setAttribute("activity", animal);
		}
		return "/activity-register.jsp";
	}

}
