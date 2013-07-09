package groups;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import account.Authenticate;
import account.Security;

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
		stmt.setBoolean(3, true);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}
	
	public static void removeGroup(int groupID) throws SQLException,
	ParseException {

	if (checkGroupByID(groupID) != 0) {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "DELETE FROM usergroups WHERE usergroupID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, groupID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}
		
		batchGroupUpdate(groupID);
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
	public static int checkGroupByID(int ID) throws SQLException
	{
		

			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "SELECT usergroupID FROM usergroups WHERE usergroupID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, ID);
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
					groups.add(new Group(rs.getString("name"), rs.getString("active"), rs.getString("usergroupID")));
				stmt.close();
				con.close();	
				rs.close();
				return groups;
				
				
			}
		}		
		return null;
		
}
	
	public static List<Group> getAllGroups() throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT * FROM usergroups";	
		
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
					groups.add(new Group(rs.getString("name"), rs.getString("active"), rs.getString("usergroupID")));
				stmt.close();
				con.close();	
				rs.close();
				return groups;
				
				
			}
		}		
		return null;
		
}
	
	public static void updateuserGroup(int groupID, int personID) throws SQLException {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "UPDATE accounts SET usergroupID = ? WHERE personID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, groupID);
		stmt.setInt(2, personID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}
	
	public static void batchGroupUpdate(int groupID) throws SQLException {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "UPDATE accounts SET usergroupID = ? WHERE usergroupID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, 1);
		stmt.setInt(2, groupID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}
}
