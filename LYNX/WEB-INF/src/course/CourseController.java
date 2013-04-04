package course;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import course.Subject;

import lynx.Manager;

import account.CreateAccount;

public class CourseController extends lynx.Manager{
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
//	public static void addCourse()
//	{
//		{
//			if (checkPersonByID(personID) != 0
//					&& CreateAccount.getAccountByPersonID(personID) != 0) {
//				con = cpds.getConnection();
//				con.setAutoCommit(false);
//				SQL = "INSERT INTO student (personID,accountID) \n"
//						+ "SELECT personID, accountID \n" + "FROM   person \n"
//						+ "WHERE personID = ?";
//				PreparedStatement stmt = con.prepareStatement(SQL);
//				System.out.println(SQL);
//				stmt.setInt(1, personID);
//				try {
//					stmt.executeUpdate();
//					con.commit();
//				} finally {
//					con.close();
//					stmt.close();
//				}
//
//			}
//		}
//	}
	
	public static void addSubject(String name, int calendarID) throws SQLException
	{
	
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO [subject] (name,calendarID)\r\n" + 
					"VALUES (?,?)";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setString(1, name);
			stmt.setInt(2,calendarID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}


		
	}
	
	public static void removeSubject(int subjectID)
			throws SQLException, ParseException {
		
		if(checkSubjectByID(subjectID) != 0)
		{
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM [subject] WHERE subjectID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1,subjectID);
			try {
				stmt.executeUpdate();
				con.commit();
				removeCourseBySubject(subjectID);
			} finally {
				con.close();
				stmt.close();
			}
		}
		

	}
	
	public static void removeSubjectFromCalendar(int calendarID)
			throws SQLException, ParseException {

			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM [subject] WHERE calendarID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1,calendarID);
			try {
				stmt.executeUpdate();
				con.commit();
				
			} finally {
				con.close();
				stmt.close();
			}
		
		

	}
	public static void removeCourseBySubject(int subjectID) throws SQLException
	{
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "DELETE FROM course WHERE subjectID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1,subjectID);
		try {
			stmt.executeUpdate();
			con.commit();
			
		} finally {
			con.close();
			stmt.close();
		}
	}
	
	
	
	public static int getSubjectCount() throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT COUNT(*) as total_rows FROM [subject]";
		System.out.println(SQL);
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
	
	public static int getCourseCount() throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT COUNT(*) as total_rows FROM Course";
		System.out.println(SQL);
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
	
	public static int getCourseCountEnrolled(int studentID) throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT COUNT(*) as total_rows FROM enrollment WHERE studentID = ?";
		System.out.println(SQL);
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, studentID);
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
	
	public static String getCourse(int enrollID) throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT c.name, c.shortName FROM enrollment e\r\n" + 
				"INNER JOIN course c ON c.courseID = e.courseID\r\n" + 
				"WHERE enrollmentID = ?";
		System.out.println(SQL);
		System.out.println(enrollID);
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, enrollID);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.first();
				return rs.getString("name") + " (" + rs.getString("shortName") + ")";
			}

		} finally {
			con.close();
			stmt.close();
		}

	}
	
	public static Subject[] getSubjects() throws SQLException {
		int totalPeople = getSubjectCount();
		System.out.println(totalPeople);
		Subject[] people = new Subject[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT subjectID,calendarID,name FROM subject";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Subject(rs.getString("name"), rs.getInt("subjectID"), rs.getInt("calendarID"));
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
	
	
	
	
	public static Course[] getCourses() throws SQLException {
		int totalPeople = getCourseCount();
		System.out.println(totalPeople);
		Course[] people = new Course[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT c.courseID,c.subjectID,c.teacherID,c.name,c.shortName, s.name AS subjectName\r\n" + 
				"FROM course c\r\n" + 
				"INNER JOIN [subject] s ON s.subjectID = c.subjectID";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Course(rs.getInt("courseID"), rs.getInt("subjectID"), rs.getString("name"), rs.getString("shortName"), rs.getInt("teacherID"), rs.getString("subjectName"));
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
	
	public static Course[] getCoursesNotEnrolled(int studentID) throws SQLException {
		int totalPeople = getCourseCount();
		System.out.println(totalPeople);
		Course[] people = new Course[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT c.courseID,c.subjectID,c.teacherID,c.name,c.shortName, s.name AS subjectName \r\n" + 
				"FROM course c\r\n" + 
				"INNER JOIN [subject] s ON s.subjectID = c.subjectID\r\n" + 
				"WHERE NOT EXISTS (SELECT enrollment.courseID, enrollment.studentID FROM enrollment WHERE enrollment.courseID = c.courseID AND enrollment.studentID = ?)";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, studentID);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Course(rs.getInt("courseID"), rs.getInt("subjectID"), rs.getString("name"), rs.getString("shortName"), rs.getInt("teacherID"), rs.getString("subjectName"));
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
	
	public static Enrollment[] getCoursesIsEnrolled(int studentID) throws SQLException {
		int totalPeople = getCourseCountEnrolled(studentID);
		System.out.println(totalPeople);
		Enrollment[] people = new Enrollment[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT c.courseID,c.subjectID,c.teacherID,c.name,c.shortName, s.name AS subjectName, e.enrollmentID, e.studentID, e.calendarID\r\n" + 
				"								FROM course c\r\n" + 
				"							INNER JOIN [subject] s ON s.subjectID = c.subjectID \r\n" + 
				"								INNER JOIN enrollment e ON e.courseID = c.courseID\r\n" + 
				"								WHERE EXISTS (SELECT enrollment.courseID, enrollment.studentID FROM enrollment WHERE enrollment.courseID = c.courseID) AND e.studentID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, studentID);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Enrollment(rs.getInt("enrollmentID"), rs.getInt("courseID"), rs.getInt("studentID"), rs.getInt("calendarID"), rs.getString("name"), rs.getString("shortName"));
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
	
	public static Enrollment[] getCoursesWithGrades(int studentID) throws SQLException {
		int totalPeople = getCourseCountEnrolled(studentID);
		System.out.println(totalPeople);
		Enrollment[] people = new Enrollment[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT c.courseID,c.subjectID,c.teacherID,c.name,c.shortName, s.name AS subjectName, e.enrollmentID, e.studentID, e.calendarID, g.gradeID   \r\n" + 
				"															FROM course c\r\n" + 
				"														INNER JOIN [subject] s ON s.subjectID = c.subjectID \r\n" + 
				"															INNER JOIN enrollment e ON e.courseID = c.courseID\r\n" + 
				"															INNER JOIN grade g ON g.enrollmentID = e.enrollmentID\r\n" + 
				"																WHERE EXISTS (SELECT enrollment.courseID, enrollment.studentID FROM enrollment WHERE enrollment.courseID = c.courseID) AND e.studentID = ?\r\n" + 
				"																AND EXISTS (SELECT grade.enrollmentID FROM grade WHERE grade.enrollmentID = e.enrollmentID)";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, studentID);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Enrollment(rs.getInt("enrollmentID"), rs.getInt("courseID"), rs.getInt("studentID"), rs.getInt("calendarID"), rs.getString("name"), rs.getString("shortName"), rs.getInt("gradeID"));
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
	
	private static int checkSubjectByID(int subjectID) throws SQLException {

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT count(*) over (partition by 1) total_rows FROM [subject] WHERE subjectID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, subjectID);
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
	
	private static int checkCourseByID(int courseID) throws SQLException {

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT count(*) over (partition by 1) total_rows FROM course WHERE courseID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, courseID);
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
	
	public static void editSubject(int subjectID, String name)
			throws SQLException, NoSuchAlgorithmException, IOException

	{
		if (checkSubjectByID(subjectID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "UPDATE [subject] SET name = ?\r\n" + 
					"WHERE subjectID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setString(1, name);
			stmt.setInt(2,subjectID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}
	
	
	public static void createCourse(String name, String shortName, int subjectID, int teacherID) throws SQLException
	{
	
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO course (name,shortName,subjectID,teacherID)\r\n" + 
					"VALUES (?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setString(1, name);
			stmt.setString(2, shortName);
			stmt.setInt(3,subjectID);
			stmt.setInt(4, teacherID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}


		
	}
	
	public static void removeCourse(int courseID)
			throws SQLException, ParseException {
		
		if(checkCourseByID(courseID) != 0)
		{
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM course WHERE courseID = ?" +
					"DELETE FROM enrollment WHERE courseID = ?";
			
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1,courseID);
			stmt.setInt(2,courseID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}
		}
		

	}
	
	
	
	public static void editCourse(int courseID, String name, String shortName, int subjectID, int teacherID)
			throws SQLException, NoSuchAlgorithmException, IOException

	{
		if (checkCourseByID(courseID) != 0 && checkSubjectByID(subjectID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "UPDATE COURSE SET subjectID = ?, teacherID = ?, name = ?, shortName = ?\r\n" + 
					"WHERE courseID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, subjectID);
			stmt.setInt(2,teacherID);
			stmt.setString(3, name);
			stmt.setString(4,shortName);
			stmt.setInt(5, courseID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}
	
	
	
	
	
	
}
