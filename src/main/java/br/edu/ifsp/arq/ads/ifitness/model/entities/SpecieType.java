package br.edu.ifsp.arq.ads.ifitness.model.entities;

public enum SpecieType {

	CACHORRO("Cachorro"),
	GATO("Gato"),
	ROEDOR("Roedor"),
	PEIXE("Peixe");
	
	private String name;
	
	SpecieType(String type) {
		this.name = type;
	}
	
	public String getName() {
		return name;
	}
	
}
