package br.edu.ifsp.arq.ads.ifitness.model.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Animal implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String description;
	private Gender gender;
	private LocalDate birthDate;
	private SpecieType type;
	private StatusAdoption statusAdoption;
	private LocalDate postedAt;
	private LocalDate adoptedAt;
	private User user;
	private Institution institution;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public SpecieType getType() {
		return type;
	}

	public void setType(SpecieType type) {
		this.type = type;
	}

	public StatusAdoption getStatusAdoption() {
		return statusAdoption;
	}

	public void setStatusAdoption(StatusAdoption statusAdoption) {
		this.statusAdoption = statusAdoption;
	}

	public LocalDate getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(LocalDate postedAt) {
		this.postedAt = postedAt;
	}

	public LocalDate getAdoptedAt() {
		return adoptedAt;
	}

	public void setAdoptedAt(LocalDate adoptedAt) {
		this.adoptedAt = adoptedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Institution getInstitution() {
		return institution;
	}

	public void setInstitution(Institution institution) {
		this.institution = institution;
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
		Animal other = (Animal) obj;
		return Objects.equals(id, other.id);
	}

}
