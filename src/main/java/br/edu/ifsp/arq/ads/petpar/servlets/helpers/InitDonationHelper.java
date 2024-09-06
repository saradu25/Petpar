package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InitDonationHelper implements Helper {


    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        Institution institution = new Institution();
        institution.setId(id);

        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(600);
        session.setAttribute("donateInstitution", institution);
        return "/donationUserRegister.jsp";
    }
}
