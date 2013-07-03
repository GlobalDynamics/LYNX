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

