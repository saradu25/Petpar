package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.UserDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.Gender;
import br.edu.ifsp.arq.ads.petpar.model.entities.User;
import br.edu.ifsp.arq.ads.petpar.utils.PasswordEncode;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.Locale;

public class AddUserHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String cpf = req.getParameter("cpf");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("senha");
		String dateOfBirth = req.getParameter("dateOfBirth");
		String phoneNumber = req.getParameter("phoneNumber");
		String gender = req.getParameter("gender");
		
		User user = new User();
		user.setCpf(cpf);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(PasswordEncode.encode(password));
		user.setDateOfBirth(LocalDate.parse(dateOfBirth));
		user.setCreatedAt(LocalDate.now());
		user.setPhoneNumber(phoneNumber);
		user.setGender(Gender.valueOf(gender.toUpperCase(Locale.ROOT)));
		
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		
		if(userDao.save(user)) {
			req.setAttribute("result", "registered");
			return "/userLogin.jsp";
		}else {
			req.setAttribute("result", "notRegistered");
			return "/userRegister.jsp";
		}
	}

}

