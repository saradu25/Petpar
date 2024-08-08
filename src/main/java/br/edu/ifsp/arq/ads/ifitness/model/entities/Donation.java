package br.edu.ifsp.arq.ads.ifitness.model.entities;

import jdk.vm.ci.meta.Local;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Donation implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Double ammount;
	private LocalDate data;
	private Institution institution;
	private User donor;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getAmmount() {
		return ammount;
	}

	public void setAmmount(Double ammount) {
		this.ammount = ammount;
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

	public User getDonor() {
		return donor;
	}

	public void setDonor(User donor) {
		this.donor = donor;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
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
