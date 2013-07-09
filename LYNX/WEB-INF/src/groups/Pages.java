package groups;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lynx.Manager;

public class Pages extends Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	public static List<Page> getPages(boolean category, int ID, int accountID) throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		if(category)
			SQL = "SELECT m.name, m.url, m.moduleID, m.title, m.active, p.accountID, d.divisionID FROM permissions p\r\n" + 
					"CROSS JOIN division d\r\n" + 
					"INNER JOIN module m ON m.divisionID = d.divisionID AND m.moduleID = p.moduleID\r\n" + 
					"WHERE d.divisionID = ? AND p.accessType  > 0 and m.active = 1 AND p.accountID = ?";		
		else
			SQL = "SELECT * FROM module WHERE active = 1";		
		
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);	
		if(category)
		{
			stmt.setInt(1,ID);
			stmt.setInt(2, accountID);
		}
			
		List<Page> pages = new ArrayList<Page>();
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
				  pages.add(new Page(rs.getString("name"), rs.getString("title"), rs.getString("url"),rs.getInt("active")));
				stmt.close();
				con.close();	
				rs.close();
				return pages;
				
				
			}
		}		
		return null;
		
	}
	
	public static List<Category> getCats() throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);

		SQL = "SELECT * FROM division WHERE active = 1";		
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);	
		List<Category> categories = new ArrayList<Category>();
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
					categories.add(new Category(rs.getString("name"), rs.getString("alternateID"), rs.getString("url"), rs.getInt("active")));	
				stmt.close();
				con.close();	
				rs.close();
				return categories;
				
				
			}
		}		
		return null;
		
	}
	
	public static List<String> getModules() throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);

		SQL = "SELECT Distinct name FROM module";		
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);	
		List<String> categories = new ArrayList<String>();
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
					categories.add(rs.getString("name"));	
				stmt.close();
				con.close();	
				rs.close();
				return categories;
				
				
			}
		}		
		return null;
		
	}
	
	public static boolean hasAccessiblePages(int divisionID, int usergroupID) throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT * FROM permissions p\r\n" + 
				"CROSS JOIN division d\r\n" + 
				"INNER JOIN module m ON m.divisionID = d.divisionID AND m.moduleID = p.moduleID\r\n" + 
				"WHERE d.divisionID = ? AND p.accessType  > 0 and m.active = 1 AND p.usergroupID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);	
		stmt.setInt(1, divisionID);
		stmt.setInt(2, usergroupID);
		System.out.println(divisionID);
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
				stmt.close();
				con.close();	
				rs.close();
				return true;
			}
		}	
		return false;
	}
}
