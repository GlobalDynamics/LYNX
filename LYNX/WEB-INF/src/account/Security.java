package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Security extends lynx.Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	private static String complexity = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})";

	public static String complexityTest(String pass1, String pass2) {
		if (pass1 != null && pass2 != null) {
			if (pass1.equals(pass2)) {
				Pattern pattern = Pattern.compile(complexity);
				Matcher matcher = pattern.matcher(pass1);

				if (matcher.matches()) {
					return "true";
				}

			}
			return "Password is not complex enough. ";
		}
		return "Passwords do not match. ";
	}

	public static boolean isEmpty(String pass1, String pass2) {
		return (pass1.isEmpty() && pass2.isEmpty() ? true : false);
	}
	
	public static String getAccountID(String username) throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT username,accountID from account WHERE username = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setString(1, username);
		try {
			try {
				rs = stmt.executeQuery();

				if (!rs.isBeforeFirst()) {
					return 0;

				} else {
					rs.first();
					return rs.getInt("total_rows");
				}

			} finally {
				con.close();
				stmt.close();
			}
		} finally {
			con.close();
			stmt.close();
		}
		return null;
	}
}
