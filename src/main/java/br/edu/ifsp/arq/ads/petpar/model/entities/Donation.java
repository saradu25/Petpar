package br.edu.ifsp.arq.ads.petpar.model.entities;

import br.edu.ifsp.arq.ads.petpar.model.entities.enums.PaymentMethod;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Donation implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Double amount;
	private PaymentMethod paymentMethod;
	private LocalDate data;
	private Institution institution;
	private User user;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public Institution getInstitution() {
		return institution;
	}

	public void setInstitution(Institution institution) {
		this.institution = institution;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Donation other = (Donation) obj;
		return Objects.equals(id, other.id);
	}

}
