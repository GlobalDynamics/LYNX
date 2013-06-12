package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class CreateAccount extends lynx.Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;

	public static void createAccount(String pass1, String pass2, String username)
			throws NoSuchAlgorithmException, IOException, SQLException {
		if (pass1.equals(pass2)) {
			String[] finalpass = Authenticate.auth(pass1, pass2, username);
			con = cpds.getConnection();
			Statement stmt = con.createStatement();
			String SQL = "INSERT INTO accounts VALUES('-1','" + username
					+ "','" + finalpass[0].toString() + "','"
					+ finalpass[1].toString() + "', " + "'')";
			System.out.println(SQL);
			try {
				stmt.executeUpdate(SQL);
			} finally {
				con.close();
			}

		}

	}

	public static int getAccountByUserName(String username) throws SQLException {
		Connection con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT accountID FROM accounts WHERE username = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setString(1, username);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();
			con.commit();
			if (!rs.isBeforeFirst()) {
				return 0;

			} else {
				rs.first();
				return rs.getInt("accountID");
			}
		} finally {
			stmt.close();
			con.close();
			rs.close();
		}

	}

	public static int getAccountByPersonID(int personID) throws SQLException {
		Connection con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT accountID FROM accounts WHERE personID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, personID);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();
			con.commit();
			if (!rs.isBeforeFirst()) {
				return 0;

			} else {
				rs.first();
				return rs.getInt("accountID");
			}
		} finally {
			stmt.close();
			con.close();
			rs.close();
		}

	}

	public static void editAccount(int personID, String password1,
			String password2, String userName) throws SQLException,
			UnsupportedEncodingException, NoSuchAlgorithmException {
		if (Security.isEmpty(password1, password2)
				|| Security.complexityTest(password1, password2) != "true")
			return;

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "UPDATE accounts SET hash = ?,salt = ? WHERE personID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		String[] finalpass = Authenticate.auth(password1, password2, userName);
		stmt.setString(1, finalpass[0]);
		stmt.setString(2, finalpass[1]);
		stmt.setInt(3, personID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}

}
