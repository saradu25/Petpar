package br.edu.ifsp.arq.ads.petpar.model.daos.filters;

import java.time.LocalDate;

import br.edu.ifsp.arq.ads.petpar.model.entities.Institution;
import br.edu.ifsp.arq.ads.petpar.model.entities.SpecieType;
import br.edu.ifsp.arq.ads.petpar.model.entities.StatusAdoption;

public class AnimalFilter {

	private Institution institution;
	
	private SpecieType type;
	private StatusAdoption statusAdoption;
	
	private LocalDate initialDate;
	
	private LocalDate finalDate;

	public SpecieType getType() {
		return type;
	}

	public void setType(SpecieType type) {
		this.type = type;
	}

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

	public StatusAdoption getStatusAdoption() {
		return statusAdoption;
	}

	public void setStatusAdoption(StatusAdoption statusAdoption) {
		this.statusAdoption = statusAdoption;
	}
}