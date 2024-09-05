package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.Animal;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.StatusAdoption;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;


public class InstitutionAnimalAdoptionHelper implements Helper {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        //passar o id ou pegar do selecionado na sessao?
        Long id = Long.valueOf(req.getParameter("id"));
        StatusAdoption statusAdoption = StatusAdoption.valueOf(req.getParameter("statusAdoption"));

        AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
        Animal animal = animalDao.getAnimalById(id);
        animal.setStatusAdoption(statusAdoption);
        if(StatusAdoption.DONE == statusAdoption){
            animal.setAdoptedAt(LocalDate.now());
        }else{
            animal.setUser(null);
        }

        if(animalDao.update(animal)) {
            //TODO oq setar no atributo?
            req.setAttribute("result", "registered");
        }
        //TODO tela de animal em adoção pendente?
        return "/activity-userRegister.jsp";
    }
}
