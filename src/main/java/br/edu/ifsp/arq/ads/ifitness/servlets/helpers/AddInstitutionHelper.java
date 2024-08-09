package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import br.edu.ifsp.arq.ads.ifitness.model.daos.InstitutionDao;
import br.edu.ifsp.arq.ads.ifitness.model.daos.UserDao;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Gender;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Institution;
import br.edu.ifsp.arq.ads.ifitness.model.entities.User;
import br.edu.ifsp.arq.ads.ifitness.utils.PasswordEncode;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

public class AddInstitutionHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String description = req.getParameter("description");
		String cpfOrCnpj = req.getParameter("cpfOrCnpj");
		String phoneNumber = req.getParameter("phoneNumber");
		
		Institution institution = new Institution();
		institution.setName(name);
		institution.setEmail(email);
		institution.setCpfOrCnpj(cpfOrCnpj);
		institution.setPhoneNumber(phoneNumber);
		institution.setPassword(PasswordEncode.encode(password));
		institution.setDescription(description);
		institution.setCreatedAt(LocalDate.now());

		InstitutionDao institutionDao = new InstitutionDao(SearcherDataSource.getInstance().getDataSource());
		
		if(institutionDao.save(institution)) {
			req.setAttribute("result", "registered");
			return "/institutionLogin.jsp";
		}else {
			req.setAttribute("result", "notRegistered");
			return "/institution-register.jsp";
		}
	}

}
