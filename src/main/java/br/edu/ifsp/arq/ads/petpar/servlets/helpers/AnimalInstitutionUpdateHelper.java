package br.edu.ifsp.arq.ads.petpar.servlets.helpers;

import br.edu.ifsp.arq.ads.petpar.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.petpar.model.entities.Animal;
import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.model.entities.User;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.Gender;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.SpecieType;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.StatusAdoption;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;

public class AnimalInstitutionUpdateHelper implements Helper {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        Long userId = Long.valueOf(req.getParameter("user"));
        Long institutionId = Long.valueOf(req.getParameter("institution"));
        String name = String.valueOf(req.getParameter("name"));
        String description = String.valueOf(req.getParameter("description"));
        StatusAdoption statusAdoption = StatusAdoption.valueOf(req.getParameter("statusAdoption"));
        Gender gender = Gender.valueOf(req.getParameter("gender"));
        LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));
        SpecieType type = SpecieType.valueOf(req.getParameter("type"));
        LocalDate postedAt = LocalDate.now();

        HttpSession session = req.getSession(false);
        //Institution institution = (Institution)session.getAttribute("institution");

        AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
        Animal animal = new Animal();
        animal.setId(id);
        animal.setName(name);
        animal.setDescription(description);
        animal.setStatusAdoption(statusAdoption);
        animal.setGender(gender);
        animal.setBirthDate(birthDate);
        animal.setType(type);
        animal.setPostedAt(postedAt);
        Institution institution = new Institution();
        institution.setId(institutionId);
        animal.setInstitution(institution);
        User user = new User();
        user.setId(userId == 0 ? null: userId);
        animal.setUser(user);
        if(statusAdoption == StatusAdoption.DONE){
            animal.setAdoptedAt(LocalDate.now());
        }else if(statusAdoption == StatusAdoption.IN_PROGRESS){
            animal.setUser(null);
        }


        if(animalDao.update(animal)) {
            req.setAttribute("animal", animal);
            return "/institutionAnimalList.jsp";
        }else {
            req.setAttribute("result", "notRegistered");
            return "/animalInstitutionProfile.jsp";
        }
    }

}
