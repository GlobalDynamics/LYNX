package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lynx.Manager;

public class EnrollmentController extends Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	
	public static void enrollCourse(int courseID, int studentID) throws SQLException
	{
		
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "INSERT INTO enrollment(courseID,studentID,calendarID)\r\n" + 
				"SELECT  DISTINCT ?,?, [subject].calendarID\r\n" + 
				"FROM    [subject], course\r\n" + 
				"WHERE   course.subjectID = [subject].subjectID";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, courseID);
		stmt.setInt(2,studentID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}
	}
	
	public static int checkStudentEnroll(int courseID, int studentId) throws SQLException
	{
		

			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "SELECT c.courseID,c.subjectID,c.teacherID,c.name,c.shortName, s.name AS subjectName \r\n" + 
					"FROM course c\r\n" + 
					"INNER JOIN [subject] s ON s.subjectID = c.subjectID\r\n" + 
					"WHERE EXISTS (SELECT enrollment.courseID, enrollment.studentID FROM enrollment WHERE enrollment.courseID = c.courseID AND enrollment.studentID = ?) AND courseID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, studentId);
			stmt.setInt(2, courseID);
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
	
	public static void unenrollCourse(int enrollmentID) throws SQLException
	{
		
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "DELETE FROM enrollment WHERE enrollmentID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, enrollmentID);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}
	}
}
