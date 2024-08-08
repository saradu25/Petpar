package br.edu.ifsp.arq.ads.ifitness.model.entities;

public enum StatusAdoption {

    IN_PROGRESS("EM PROGRESSO"),
    PENDING("PENDENTE"),
    DONE("CONCLUIDA");

    private String value;

    StatusAdoption(String description) {
        this.value = description;
    }

    public String getValue() {
        return value;
    }
}
