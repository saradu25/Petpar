package br.edu.ifsp.arq.ads.petpar.model.daos;

import br.edu.ifsp.arq.ads.petpar.model.entities.*;
import br.edu.ifsp.arq.ads.petpar.utils.PasswordEncode;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Optional;

public class InstitutionDao {

	private DataSource dataSource;

	public InstitutionDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Optional<Institution> getUserByEmailAndPassword(String email, String password) {
		String passwordEncripted = PasswordEncode.encode(password);

		String sql = "select id,name,email from institutions where email=? and password=?";
		Optional<Institution> optional = Optional.empty();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.setString(2, passwordEncripted);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					Institution institution = new Institution();
					institution.setId(rs.getLong(1));
					institution.setName(rs.getString(2));
					institution.setEmail(rs.getString(3));
					optional = Optional.of(institution);
				}
			}
			return optional;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

	public Optional<Institution> getById(Long id){
		String sql = "select id,name,email from institutions where id=?";
		Optional<Institution> optional = Optional.empty();
		try(Connection conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setLong(1, id);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					Institution institution = new Institution();
					institution.setId(rs.getLong(1));
					institution.setName(rs.getString(2));
					institution.setEmail(rs.getString(3));
					optional = Optional.of(institution);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta", e);
		}
		return optional;
	}

	public Optional<Institution> getByCPForCNPJ(String cpfCnpj){
		String sql = "select id,name,email from institutions where cpf_or_cnpj=?";
		Optional<Institution> optional = Optional.empty();
		try(Connection conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, cpfCnpj);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					Institution institution = new Institution();
					institution.setId(rs.getLong(1));
					institution.setName(rs.getString(2));
					institution.setEmail(rs.getString(3));
					optional = Optional.of(institution);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta", e);
		}
		return optional;
	}

	public Boolean save(Institution institution){
		Optional<Institution> optional = getByCPForCNPJ(institution.getCpfOrCnpj());
		if(optional.isPresent()) {
			return false;
		}
		String sql = "insert into institutions (name, description, email, "
				+ " cpf_or_cnpj, phone_number, password, created_at) values (?,?,?,?,?,?,?)";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, institution.getName());
			ps.setString(2, institution.getDescription());
			ps.setString(3, institution.getEmail());
			ps.setString(4, institution.getCpfOrCnpj());
			ps.setString(5, institution.getPhoneNumber());
			ps.setString(6, institution.getPassword());
			ps.setDate(7, Date.valueOf(institution.getCreatedAt()));
			ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta", e);
		}
		return true;
	}
}