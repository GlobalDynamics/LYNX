package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import schedule.Schedule;

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
	
	public static int getCourses(int studentID, int calendarID) throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT COUNT(*) as total_rows FROM enrollment WHERE studentID = ? AND calendarID = ?";
		System.out.println(SQL);
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, studentID);
		stmt.setInt(2, calendarID);
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

	}
	
	public static Schedule[] getSchedule(int studentID, int calendarID) throws SQLException
	{
		int totalPeople = getCourses(studentID,calendarID);
		System.out.println(totalPeople);
		Schedule[] people = new Schedule[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT s.studentID, c.name AS courseName, c.shortName, su.name AS subjectName, ISNULL(g.grade,'') AS grade, p.firstName + ' '+ p.lastName AS personName, ca.name AS calendarName\r\n" + 
				"\r\n" + 
				"FROM student s\r\n" + 
				"INNER JOIN person p ON p.personID = s.personID\r\n" + 
				"INNER JOIN enrollment e ON e.studentID = s.studentID\r\n" + 
				"INNER JOIN course c ON c.courseID = e.courseID\r\n" + 
				"INNER JOIN [subject] su ON c.subjectID = su.subjectID\r\n" + 
				"INNER JOIN calendar ca ON ca.calendarID = e.calendarID\r\n" + 
				"LEFT OUTER JOIN grade g ON g.enrollmentID = e.enrollmentID\r\n" + 
				"WHERE e.calendarID = ? AND s.studentID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		System.out.println(SQL);
		stmt.setInt(1, calendarID);
		stmt.setInt(2, studentID);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Schedule(rs.getString("personName"), rs.getString("courseName"), rs.getString("shortName"), rs.getString("subjectName"), rs.getString("grade"), rs.getString("calendarName"));
					i++;
				}
				return people;

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}
	}
}
