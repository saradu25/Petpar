package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.InstitutionDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Optional;

public class InstitutionLoginHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		String password = req.getParameter("texPassword");
		InstitutionDao userDao = new InstitutionDao(SearcherDataSource.getInstance().getDataSource());
		Optional<Institution> optional = userDao.getUserByEmailAndPassword(email, password);
		if(optional.isPresent()) {
			Institution institution = optional.get();
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(600);
			session.setAttribute("institution", institution);
			//TODO
			// ir pra tela de listar animais em adoção da instituição
			//return "/ControllerServlet?action=institutionSearchAnimals";
			return "/paginaRecebimento.jsp";
		}else {
			req.setAttribute("result", "loginError");
			return "/LoginInstitution.jsp";
		}
	}

}
