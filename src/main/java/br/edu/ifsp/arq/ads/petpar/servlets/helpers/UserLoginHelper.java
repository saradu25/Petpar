package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import java.util.Optional;

import br.edu.ifsp.arq.ads.petpar.model.daos.UserDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.User;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		String password = req.getParameter("texPassword");
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		Optional<User> optional = userDao.getUserByEmailAndPassword(email, password);
		if(optional.isPresent()) {
			User user = optional.get();
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(600);
			session.setAttribute("user", user);
			//TODO
			// ir pra tela de listar animais em adoção disponiveis
			// return "/ControllerServlet?action=userSearchAnimals";
			return "/paginaRecebimento.jsp";
		}else {
			req.setAttribute("result", "loginError");
			return "/userLogin.jsp";
		}
	}

}
