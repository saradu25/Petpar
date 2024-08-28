package br.edu.ifsp.arq.ads.petpar.model.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifsp.arq.ads.petpar.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.petpar.model.entities.*;

public class AnimalDao {

	private DataSource dataSource;

	public AnimalDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Boolean save(Animal animal){
		String sql = "insert into animals (name, description, gender, birth_date, type, status_adoption, posted_at, institution_id)" +
				" values(?,?,?,?,?,?,?,?)";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, animal.getName());
			ps.setString(2, animal.getDescription());
			ps.setString(3, animal.getGender().getDescription());
			ps.setDate(4, Date.valueOf(animal.getBirthDate()));
			ps.setString(5, animal.getType().getName());
			ps.setString(6, animal.getStatusAdoption().getValue());
			ps.setDate(7, Date.valueOf(animal.getPostedAt()));
			//ps.setDate(8, Date.valueOf(animal.getAdoptedAt()));
			ps.setLong(8, animal.getInstitution().getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao inserir dados", sqlException);
		}
	}

	public Boolean update(Animal animal) {
		String sql = "update animals set " + "name=?," + "description=?," + "gender=?," + "type=?,"+ "status_adoption=?,"+ "posted_at=?," + "adopted_at=?,"
				+ "institution_id=?," + "user_id=?" + " where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, animal.getName());
			ps.setString(2, animal.getDescription());
			ps.setString(3, animal.getGender().getDescription());
			ps.setDate(4, Date.valueOf(animal.getBirthDate()));
			ps.setString(5, animal.getType().getName());
			ps.setString(6, animal.getStatusAdoption().getValue());
			ps.setDate(7, Date.valueOf(animal.getPostedAt()));
			ps.setDate(8, Date.valueOf(animal.getAdoptedAt()));
			ps.setLong(9, animal.getInstitution().getId());
			ps.setLong(10, animal.getUser().getId());
			ps.setLong(10, animal.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao atualizar dados", sqlException);
		}
	}

	public List<Animal> getAnimalByInstitution(Institution institution) {
		String sql = "select * from animals where user_id=?";
		List<Animal> animals = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, institution.getId());
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Animal animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setName(rs.getString(2));
					animal.setDescription(rs.getString(3));
					animal.setGender(Gender.valueOf(rs.getString(4)));
					animal.setBirthDate(LocalDate.parse(rs.getDate(5).toString()));
					animal.setType(SpecieType.valueOf(rs.getString(6)));
					animal.setStatusAdoption(StatusAdoption.valueOf(rs.getString(7)));
					animal.setPostedAt(LocalDate.parse(rs.getDate(8).toString()));
					animal.setAdoptedAt(LocalDate.parse(rs.getDate(9).toString()));
					animal.setInstitution(institution);
					User user = new User();
					user.setId(rs.getLong(10));
					animal.setUser(user);

					animals.add(animal);
				}
			}
			return animals;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

	public Animal getAnimalById(Long id) {
		String sql = "select * from animals where id=?";
		Animal animal = null;
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setName(rs.getString(2));
					animal.setDescription(rs.getString(3));
					animal.setGender(Gender.valueOf(rs.getString(4)));
					animal.setBirthDate(LocalDate.parse(rs.getDate(5).toString()));
					animal.setType(SpecieType.valueOf(rs.getString(6)));
					animal.setStatusAdoption(StatusAdoption.valueOf(rs.getString(7)));
					animal.setPostedAt(LocalDate.parse(rs.getDate(8).toString()));
					animal.setAdoptedAt(LocalDate.parse(rs.getDate(9).toString()));

					User user = new User();
					user.setId(rs.getLong(10));
					animal.setUser(user);

					Institution institution = new Institution();
					institution.setId(rs.getLong(11));
					animal.setInstitution(institution);
				}
			}
			return animal;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

	public Boolean delete(Animal animal) {
		String sql = "delete from animals where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, animal.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao remover dados", sqlException);
		}
	}

	public List<Animal> getAnimalsByFilter(AnimalFilter filter) throws SQLException {
		StringBuilder sql = 
				new StringBuilder("select * from animals where 1=1");
		List<Object> params = new ArrayList<>();


		if (filter.getType() != null) {
			sql.append(" and institution_id=?");
			params.add(filter.getInstitution().getId());
		}

		if (filter.getType() != null) {
			sql.append(" and type=?");
			params.add(filter.getType().toString());
		}

		if (filter.getType() != null) {
			sql.append(" and status_adoption=?");
			params.add(filter.getStatusAdoption().getValue());
		}

		if (filter.getInitialDate() != null) {
			sql.append(" and posted_at >= ?");
			params.add(filter.getInitialDate());
		}

		if (filter.getFinalDate() != null) {
			sql.append(" and posted_at <= ?");
			params.add(filter.getFinalDate());
		}

		return getAnimalList(sql.toString(), params);
	}

	private List<Animal> getAnimalList(String sql, List<Object> params) throws SQLException {
		List<Animal> animals = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Animal animal = new Animal();
					animal.setId(rs.getLong(1));
					animal.setName(rs.getString(2));
					animal.setDescription(rs.getString(3));
					animal.setGender(Gender.valueOf(rs.getString(4)));
					animal.setType(SpecieType.valueOf(rs.getString(5)));
					animal.setStatusAdoption(StatusAdoption.valueOf(rs.getString(6)));
					animal.setPostedAt(LocalDate.parse(rs.getDate(7).toString()));
					animal.setAdoptedAt(LocalDate.parse(rs.getDate(8).toString()));
					User user = new User();
					user.setId(rs.getLong(9));
					animal.setUser(user);
					Institution institution = new Institution();
					institution.setId(rs.getLong(10));
					animal.setInstitution(institution);

					animals.add(animal);
				}
			}
		}
		return animals;
	}
}