package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.DonationDao;
import br.edu.ifsp.arq.ads.petpar.model.daos.filters.DonationFilter;
import br.edu.ifsp.arq.ads.petpar.model.entities.Donation;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class DonationSearchInstitutionHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String date = req.getParameter("initial-date");
		LocalDate initialDate = null;
		if(!date.isEmpty()) {
			initialDate = LocalDate.parse(date);
		}
		date = req.getParameter("final-date");
		LocalDate finalDate = null;
		if(!date.isEmpty()) {
			finalDate = LocalDate.parse(date);
		}
		
		HttpSession session = req.getSession(false);
		Institution institution = (Institution)session.getAttribute("institution");
		
		DonationFilter filter = new DonationFilter();
		filter.setInstitution(institution);
		filter.setInitialDate(initialDate);
		filter.setFinalDate(finalDate);
		DonationDao donationDao = new DonationDao(SearcherDataSource.getInstance().getDataSource());
		List<Donation> donations = null;
		try {
			donations = donationDao.getDonationByFilter(filter);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("institutionDonation", donations);
		//TODO
		// qual seria a Home?
		return "/donationInstitutionList.jsp";
	}

}
