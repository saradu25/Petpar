package br.edu.ifsp.arq.ads.ifitness.servlets.helpers;

import br.edu.ifsp.arq.ads.ifitness.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Animal;
import br.edu.ifsp.arq.ads.ifitness.model.entities.Institution;
import br.edu.ifsp.arq.ads.ifitness.model.entities.StatusAdoption;
import br.edu.ifsp.arq.ads.ifitness.model.entities.User;
import br.edu.ifsp.arq.ads.ifitness.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;


public class UserAnimalAdoptionHelper implements Helper {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //passar o id ou pegar do selecionado na sessao?
        Long id = Long.valueOf(req.getParameter("id"));

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
        Animal animal = animalDao.getAnimalById(id);
        animal.setStatusAdoption(StatusAdoption.IN_PROGRESS);
        animal.setUser(user);
        if(animalDao.update(animal)) {
            //TODO oq setar no atributo?
            req.setAttribute("result", "registered");
        }
        //TODO tela de animal em adoção pendente?
        return "/activity-register.jsp";
    }
}
