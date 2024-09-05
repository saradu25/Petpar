package br.edu.ifsp.arq.ads.petpar.model.entities.enums;

public enum StatusAdoption {

    IN_PROGRESS("IN_PROGRESS"),
    PENDING("PENDING"),
    DONE("DONE");

    private String value;

    StatusAdoption(String description) {
        this.value = description;
    }

    public String getValue() {
        return value;
    }
}
