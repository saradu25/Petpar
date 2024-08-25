package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.DonationDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.*;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

public class UserDonateHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Double amount = Double.valueOf(req.getParameter("amount"));
		LocalDate date = LocalDate.now();

		HttpSession session = req.getSession(false);
		Institution institution = (Institution)session.getAttribute("institution");
		User user = (User)session.getAttribute("user");

		DonationDao donationDao = new DonationDao(SearcherDataSource.getInstance().getDataSource());
		Donation donation = new Donation();
		donation.setAmount(amount);
		donation.setData(date);
		donation.setUser(user);
		donation.setInstitution(institution);

		if(donationDao.save(donation)) {
			//TODO salvar doação na sessão?
			req.setAttribute("result", "registered");
		}
		//TODO tela de animal em adoção pendente?
		return "/activity-userRegister.jsp";
	}

}
