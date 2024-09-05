package br.edu.ifsp.arq.ads.petpar.model.daos;

import br.edu.ifsp.arq.ads.petpar.model.daos.filters.DonationFilter;
import br.edu.ifsp.arq.ads.petpar.model.entities.*;
import br.edu.ifsp.arq.ads.petpar.model.entities.enums.PaymentMethod;
import br.edu.ifsp.arq.ads.petpar.utils.SearcherDataSource;

import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DonationDao {

	private DataSource dataSource;

	public DonationDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Boolean save(Donation donation){
		String sql = "insert into donations (amount, paymentMethod, data, institution_id, user_id)" +
				" values(?,?,?,?,?)";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setDouble(1, donation.getAmount());
			ps.setString(2,donation.getPaymentMethod().toString());
			ps.setDate(3, Date.valueOf(donation.getData()));
			ps.setLong(4, donation.getInstitution().getId());
			ps.setLong(5, donation.getUser().getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao inserir dados", sqlException);
		}
	}

	public List<Donation> getDonationByInstitution(Institution institution) {
		String sql = "select * from donations where institution_id=?";
		List<Donation> donations = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, institution.getId());
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Donation donation = new Donation();
					donation.setId(rs.getLong(1));
					donation.setAmount(rs.getDouble(2));
					donation.setPaymentMethod(PaymentMethod.valueOf(rs.getString(3)));
					donation.setData(LocalDate.parse(rs.getDate(4).toString()));
					User user = new User();
					user.setId(rs.getLong(6));
					donation.setUser(user);
					donation.setInstitution(institution);

					donations.add(donation);
				}
			}
			return donations;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

	public List<Donation> getDonationByUser(User user) {
		String sql = "select * from donations where user_id=?";
		List<Donation> donations = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, user.getId());
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Donation donation = new Donation();
					donation.setId(rs.getLong(1));
					donation.setAmount(rs.getDouble(2));
					donation.setPaymentMethod(PaymentMethod.valueOf(rs.getString(3)));
					donation.setData(LocalDate.parse(rs.getDate(4).toString()));
					Institution institution = new Institution();
					institution.setId(rs.getLong(5));
					donation.setInstitution(institution);
					donation.setUser(user);
					donations.add(donation);
				}
			}
			return donations;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta", sqlException);
		}
	}

	public List<Donation> getDonationByFilter(DonationFilter filter) throws SQLException {
		StringBuilder sql = 
				new StringBuilder("select * from donations where institution_id=?");
		List<Object> params = new ArrayList<>();
		params.add(filter.getInstitution().getId());

		if (filter.getInitialDate() != null) {
			sql.append(" and posted_at >= ?");
			params.add(filter.getInitialDate());
		}

		if (filter.getFinalDate() != null) {
			sql.append(" and posted_at <= ?");
			params.add(filter.getFinalDate());
		}

		return getDonationList(sql.toString(), params);
	}

	private List<Donation> getDonationList(String sql, List<Object> params) throws SQLException {
		List<Donation> donations = new ArrayList<>();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Donation donation = new Donation();

					donation.setId(rs.getLong(1));
					donation.setAmount(rs.getDouble(2));
					donation.setPaymentMethod(PaymentMethod.valueOf(rs.getString(3)));
					donation.setData(LocalDate.parse(rs.getDate(4).toString()));
					donation.setInstitution(getInstitution(rs.getLong(5)));
					donation.setUser(getUser(rs.getLong(6)));

					donations.add(donation);
				}
			}
		}
		return donations;
	}


	private Institution getInstitution(long id) {
		InstitutionDao institutionDao = new InstitutionDao(SearcherDataSource.getInstance().getDataSource());
		return institutionDao.getById(id).orElse(null);
	}

	private User getUser(long id) {
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		return userDao.getById(id).orElse(null);
	}
}