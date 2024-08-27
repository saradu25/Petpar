package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.InstitutionDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.utils.PasswordEncode;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;

public class AddInstitutionHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("texPassword");
		String description = req.getParameter("description");
		String cpfOrCnpj = req.getParameter("cpfCnpj");
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
			return "/institution-userRegister.jsp";
		}
	}

}
