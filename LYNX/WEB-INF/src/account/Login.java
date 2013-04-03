package account;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import account.Authenticate;

public class Login extends lynx.Manager {
	private static String hashedPassword;
	private static String compare;
	private static String salt;
	private static String login = "0";
	//0 = inactive
	//1 = true
	//2 = incorrect
	//3 = error

	public static String login(String pass, String username)
			throws SQLException, UnsupportedEncodingException,
			NoSuchAlgorithmException {
		Connection con = cpds.getConnection();
		Statement stmt = con.createStatement();
		SQL = "SELECT TOP 1 hash,salt FROM dbo.Accounts WHERE username = '"
				+ username + "'";
		try {
			ResultSet rs = stmt.executeQuery(SQL);

			if (rs.next()) {
				salt = rs.getString(2);
				compare = rs.getString(1);
			}

		} finally {
			con.close();
		}
		if (salt != null) {
			hashedPassword = Authenticate.login(pass, salt);
		}
		if(compare.equals(hashedPassword) && (compare != null && hashedPassword !=null))
		{
			login = "1";
		}
		else if(compare == "" && salt == "")
		{
			login = "3";
		}
		else if(!compare.equals(hashedPassword))
		{
			login = "2";
		}
		else
		{
			login = "0";
		}
		System.out.println(login);
		return login;
	}

}
