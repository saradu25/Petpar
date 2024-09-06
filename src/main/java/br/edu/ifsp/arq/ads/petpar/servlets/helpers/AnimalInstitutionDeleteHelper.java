package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.Animal;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.Gender;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.SpecieType;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.StatusAdoption;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

public class AnimalInstitutionDeleteHelper implements Helper {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());

        if(animalDao.delete(id)) {
            req.setAttribute("result", "registered");
            return "/institutionAnimalList.jsp";
        }else {
            req.setAttribute("result", "notRegistered");
            return "/animalInstitutionProfile.jsp";
        }
    }

}
