package br.edu.ifsp.arq.ads.petpar.model.entities.enums;

public enum PaymentMethod {
    PIX("PIX"),
    CARTAO("CARTAO");

    private String method;

    PaymentMethod(String method) {
        this.method = method;
    }

    public String getDescription() {
        return method;
    }
}
