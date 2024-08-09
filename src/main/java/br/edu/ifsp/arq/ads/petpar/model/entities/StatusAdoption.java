package br.edu.ifsp.arq.ads.petpar.model.entities;

public enum StatusAdoption {

    IN_PROGRESS("EM_PROGRESSO"),
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
