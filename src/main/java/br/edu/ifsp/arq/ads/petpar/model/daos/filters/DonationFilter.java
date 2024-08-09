package br.edu.ifsp.arq.ads.petpar.model.daos.filters;

import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;

import java.time.LocalDate;

public class DonationFilter {

    private Institution institution;

    private LocalDate initialDate;

    private LocalDate finalDate;


    public LocalDate getInitialDate() {
        return initialDate;
    }

    public void setInitialDate(LocalDate initialDate) {
        this.initialDate = initialDate;
    }

    public LocalDate getFinalDate() {
        return finalDate;
    }

    public void setFinalDate(LocalDate finalDate) {
        this.finalDate = finalDate;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }
}
