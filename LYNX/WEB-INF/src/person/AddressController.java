package person;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressController extends lynx.Manager{
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	public static String validateAddress(int street,int  zip, int city, int country, int direction, int state, int apt, int house, int phone)
	{
		if(street > 0 && street <=100 && zip >0 && zip <=10 && direction >0 && state >0 && state <= 15 && city >0 && city <=20 && phone >0 && phone <=10 && country >0 && country <=20)
		{
			return "true";
		}
		return "The address data is invalid.";
	}
	
	public static void createAddress(String street, String zip, String city, String country,String  direction, String state, String apt,String  house,String  phone, String email) throws SQLException
	
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "INSERT INTO [address] (street, zipcode, city, country, direction, state, apt, house_no, phone, email)\r\n" + "VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(SQL);
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
		} finally {
			con.close();
			stmt.close();
		}
	}
	
	public static Address[] getAddress(int addressID)
	{
		return null;
		
	}
}
