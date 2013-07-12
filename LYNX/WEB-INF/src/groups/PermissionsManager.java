package groups;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lynx.Manager;

public class PermissionsManager extends Manager {
		private static Connection con;
		private static String SQL;
		private static ResultSet rs;
		public static boolean checkPermission(int accountID, String module, String requestingType) throws SQLException
		{
			int moduleID = getModuleID(module);
			con = cpds.getConnection();
			con.setAutoCommit(false);
			
			SQL = "SELECT accountID,moduleID,usergroupID, accessType FROM permissions WHERE usergroupID = ? AND moduleID = ?";		
			System.out.println(accountID);
			System.out.println(module);
			System.out.println(requestingType);
			PreparedStatement stmt = con.prepareStatement(SQL,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println(SQL);	
			stmt.setInt(1, accountID);
			stmt.setInt(2, moduleID);
			try {
				rs = stmt.executeQuery();
			} finally {
				if (!rs.isBeforeFirst()) {
					stmt.close();
					con.close();	
					rs.close();
				} else {
					rs.first();
					int accessType = convertPermission(requestingType);
					int actualType = rs.getInt("accessType");
					stmt.close();
					con.close();
					rs.close();
					if(actualType >= accessType)
						return true;
					
					
				}
			}
			return false;
		}
		
		public static List<Permission> getPermissions(int usergroupID, int divisionID) throws SQLException
		{
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "SELECT * FROM permissions p\r\n" + 
					"INNER JOIN module m ON m.divisionID = ? ANd p.moduleID = m.moduleID\r\n" + 
					"WHERE usergroupID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.setInt(1, divisionID);
			stmt.setInt(2, usergroupID);
			try
			{
				rs = stmt.executeQuery();
			}
			finally
			{
				List<Permission> perms = new ArrayList<Permission>();
				if (!rs.isBeforeFirst()) {
					stmt.close();
					con.close();	
					rs.close();
				} else {
					rs.beforeFirst();
					while (rs.next())
					{
						int permissionType = rs.getInt("accessType");
						int read = 0;
						int write = 0;
						int full = 0;
						int none = 1;
						if(permissionType == 1)
						{
							read = 1;
							none = 0;
							write = 0;
							full = 0;
						}
							
						else if(permissionType == 2)
						{
							read = 1;
							write = 1;
							full = 0;
							none = 0;
						}
						else if(permissionType == 3)
						{
							read = 1;
							write = 1;
							full = 1;
							none = 0;
						}
						perms.add(new Permission(read, write, full, none, rs.getString("title")));
					}	
					stmt.close();
					con.close();	
					rs.close();
					return perms;
					
					
				}
				
				
			}
			return null;
		}
		
		private static int getModuleID(String module) throws SQLException
		{
			con = cpds.getConnection();
			con.setAutoCommit(false);

			SQL = "SELECT TOP 1 moduleID, url FROM module WHERE url = ?";		
			
			PreparedStatement stmt = con.prepareStatement(SQL,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println(SQL);	
			stmt.setString(1, module);
			try
			{
				rs = stmt.executeQuery();
			}
			finally
			{
				if (!rs.isBeforeFirst()) {
					stmt.close();
					con.close();	
					rs.close();
				} else {
					rs.first();
					int moduleID = rs.getInt("moduleID");
					stmt.close();
					con.close();
					rs.close();
					return moduleID;			
					
				}
			}
			
			return -2;
			
		}
		private static int convertPermission(String requestingType)
		{
			if(requestingType.equals("none"))
				return 0;
			
			else if(requestingType.equals("read"))
				return 1;
			else if(requestingType.equals("write"))
				return 2;
			else if(requestingType.equals("full"))
				return 3;
			else
			{
				return -1;
			}
		}
		
		
		
}

