package groups;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lynx.Manager;

public class UserGroups extends Manager {
	
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	
	public static void addGroup(String name)
			throws SQLException {

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "INSERT INTO [usergroups] (name,[default],[active]) VALUES (?,?,?)";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setString(1, name);
		stmt.setBoolean(2, false);
		stmt.setBoolean(3, false);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}
	
	public static int checkGroup(String name) throws SQLException
	{
		

			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "SELECT name FROM usergroups WHERE name = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setString(1, name);
			try {
				rs = stmt.executeQuery();
				con.commit();
			} finally {
				if (!rs.isBeforeFirst()) {
					stmt.close();
					con.close();
					return 0;
				} else {
					stmt.close();
					con.close();
					rs.close();
				}

			}

			return 1;
		
	}
	
	public static List<Group> getGroups() throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT * FROM usergroups WHERE [default] = 0";	
		
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);		
		List<Group> groups = new ArrayList<Group>();
		try {
			rs = stmt.executeQuery();
		}
		finally
		{
			
			if (!rs.isBeforeFirst()) {
				stmt.close();
				con.close();	
				rs.close();
			} else {
				rs.beforeFirst();
				while (rs.next())
					groups.add(new Group(rs.getString("name"), rs.getString("active")));
				stmt.close();
				con.close();	
				rs.close();
				return groups;
				
				
			}
		}		
		return null;
		
}
}
