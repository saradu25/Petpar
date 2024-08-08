package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.model.entities.User;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListActivitiesHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> userActivities = animalDao.getActivitiesByUser(user);
		req.setAttribute("userActivities", userActivities);
		return "/home.jsp";
	}

}
