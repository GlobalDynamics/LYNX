package person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddressController extends lynx.Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;

	public static String validateAddress(int street, int zip, int city,
			int country, int direction, int state, int apt, int house, int phone) {
		System.out.println("Street: " + zip);
		if (street > 0 && street <= 100 && zip > 0 && zip <= 10
				&& direction > 0 && state > 0 && state <= 15 && city > 0
				&& city <= 20 && phone > 0 && phone <= 10 && country > 0
				&& country <= 20) {

			return "true";
		}
		return "The address data is invalid.";
	}

	public static int createAddress(String street, String zip, String city,
			String country, String direction, String state, String apt,
			String house, String phone, String email) throws SQLException

	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "INSERT INTO [address] (street, zipcode, city, country, direction, state, apt, house_no, phone, email) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(SQL,
				Statement.RETURN_GENERATED_KEYS);
		System.out.println(SQL);
		stmt.setString(1, street);
		stmt.setString(2, zip);
		stmt.setString(3, city);
		stmt.setString(4, country);
		stmt.setString(5, direction);
		stmt.setString(6, state);
		stmt.setString(7, apt);
		stmt.setString(8, house);
		stmt.setString(9, phone);
		stmt.setString(10, email);
		try {
			stmt.executeUpdate();
			con.commit();

			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				System.out.println("test " + rs.getInt(1));
				return rs.getInt(1);
			} else {
				return -1;
			}

		}

		finally {
			con.close();
			stmt.close();
		}

	}

	public static void editAddress(int addressID, String street, String zip,
			String city, String country, String direction, String state,
			String apt, String house, String phone, String email)
			throws SQLException {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "UPDATE address SET street = ?, zipcode = ?, city = ?, country = ?, direction = ?, state = ?, apt = ?, house_no = ?, phone = ?, email = ?"
				+ " WHERE addressID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, street);
		stmt.setString(2, zip);
		stmt.setString(3, city);
		stmt.setString(4, country);
		stmt.setString(5, direction);
		stmt.setString(6, state);
		stmt.setString(7, apt);
		stmt.setString(8, house);
		stmt.setString(9, phone);
		stmt.setString(10, email);
		stmt.setInt(11, addressID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}

	public static Address getAddress(int addressID) throws SQLException {
		Address ad = null;
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT * FROM address WHERE addressID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, addressID);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					System.out.println(rs.getString("street"));
					ad = new Address(rs.getString("street"),
							rs.getString("zipcode"), rs.getString("apt"),
							rs.getString("house_no"),
							rs.getString("direction"), rs.getString("state"),
							rs.getString("city"), rs.getString("phone"),
							rs.getString("country"), rs.getString("email"));
					i++;
				}
				return ad;

			}
		} finally {
			con.close();
			stmt.close();
		}

	}

	public static int getAddressFomPerson(int personID) throws SQLException {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT p.addressID FROM person p WHERE p.personID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, personID);
		try {
			rs = stmt.executeQuery();
			con.commit();
		} finally {
			if (!rs.isBeforeFirst()) {
				stmt.close();
				con.close();
				return -1;
			} else {
				stmt.close();
				con.close();
				rs.close();

			}

		}
		return rs.getInt("addressID");
	}

}
