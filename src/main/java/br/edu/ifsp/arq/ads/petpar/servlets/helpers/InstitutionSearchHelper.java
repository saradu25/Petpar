package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.InstitutionDao;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InstitutionSearchHelper implements Helper {


    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        InstitutionDao institutionDao = new InstitutionDao(SearcherDataSource.getInstance().getDataSource());
        req.setAttribute("institutionList", institutionDao.getAll());
        return "/donationUserList.jsp";
    }
}
