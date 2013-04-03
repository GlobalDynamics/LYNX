package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lynx.Manager;

public class Grade extends Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	public static void addGrade(int enrollmentID, String grade) throws SQLException
	{
	
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO grade(enrollmentID,courseID,studentID,grade)\r\n" + 
					"SELECT ?, enrollment.courseID, enrollment.studentID, ?\r\n" + 
					"FROM enrollment\r\n" + 
					"WHERE enrollment.enrollmentID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, enrollmentID);
			stmt.setString(2, grade);
			stmt.setInt(3,enrollmentID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}


		
	}
}
