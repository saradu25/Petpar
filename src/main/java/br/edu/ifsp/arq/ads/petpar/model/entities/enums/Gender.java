package br.edu.ifsp.arq.ads.petpar.model.entities.enums;

public enum Gender {

	MASCULINO("MASCULINO"),
	FEMININO("FEMININO"),
	OUTRO("OUTRO"),
	PREFIRO_NAO_DIZER("PREFIRO_NAO_DIZER");
	
	private String description;
	
	private Gender(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
