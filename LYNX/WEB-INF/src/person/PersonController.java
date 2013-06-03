package person;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import account.Authenticate;
import account.CreateAccount;
import lynx.ITypes.*;

public class PersonController extends lynx.Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;

	public PersonController() throws SQLException {

	}

	public static void addPerson(String fname, String lname, String mname,
			String suf, int aID, int adID, String gnr, String date,
			String password1, String password2, String username)
			throws SQLException, NoSuchAlgorithmException, IOException,
			ParseException

	{
		int test = CreateAccount.getAccountByUserName(username);
		System.out.println(test);
		if (checkByID(CreateAccount.getAccountByUserName(username),
				checkType.ACCOUNT) == 0) {
			CreateAccount.createAccount(password1, password2, username);

			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO person(accountID,addressID,lastName,firstName,middleName,suffix,gender,birthDate) "
					+ "VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, CreateAccount.getAccountByUserName(username));
			stmt.setInt(2, 1);
			stmt.setString(3, lname);
			stmt.setString(4, fname);
			stmt.setString(5, mname);
			stmt.setString(6, suf);
			stmt.setString(7, gnr);
			DateFormat DOB = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date convertedDate = new java.sql.Date(DOB.parse(date)
					.getTime());

			// java.sql.Date sqlToday = new java.sql.Date(convertedDate);
			stmt.setDate(8, convertedDate);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}
			postMod();
		}
	}

	public static void removePerson(int personID) throws SQLException,
			NoSuchAlgorithmException, IOException

	{
		if (checkByID(personID, checkType.PERSON) != 0
				&& CreateAccount.getAccountByPersonID(personID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM person WHERE personID = ? "
					+ "\nDELETE FROM accounts WHERE personID = ?"
					+ "\nDELETE FROM teacher WHERE personID = ?"
					+ "\nDELETE enrollment \r\n" + "FROM enrollment a\r\n"
					+ "INNER JOIN student s ON s.personID = ?"
					+ "\nDELETE FROM student WHERE personID = ?";

			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, personID);
			stmt.setInt(2, personID);
			stmt.setInt(3, personID);
			stmt.setInt(4, personID);
			stmt.setInt(5, personID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void editPerson(int personID, String fname, String lname,
			String mname, String suf, int aID, int adID, String gnr,
			String date, String password1, String password2, String userName)
			throws SQLException, NoSuchAlgorithmException, IOException,
			ParseException

	{
		if (checkByID(personID, checkType.PERSON) != 0
				&& CreateAccount.getAccountByPersonID(personID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "UPDATE person SET addressID = ?, lastName = ?,firstName = ?,middleName = ?,suffix = ?,gender = ?,birthDate = ? "
					+ "WHERE personID = ?"
					+ "\n UPDATE accounts SET hash = ?,salt = ? WHERE personID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, 1);
			stmt.setString(2, lname);
			stmt.setString(3, fname);
			stmt.setString(4, mname);
			stmt.setString(5, suf);
			stmt.setString(6, gnr);
			DateFormat DOB = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date convertedDate = new java.sql.Date(DOB.parse(date)
					.getTime());
			;
			stmt.setDate(7, convertedDate);
			stmt.setInt(8, personID);
			String[] finalpass = Authenticate.auth(password1, password2,
					userName);
			stmt.setString(9, finalpass[0]);
			stmt.setString(10, finalpass[1]);
			stmt.setInt(11, personID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	private static void postMod() throws SQLException {
		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "UPDATE accounts\r\n" + "SET accounts.personID = p.personID \n"
				+ "FROM accounts a\r\n"
				+ "INNER JOIN person p ON  p.accountID = a.accountID ";
		PreparedStatement stmt = con.prepareStatement(SQL);
		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}

	private static int checkByID(int id, checkType type) throws SQLException {
		SQL = null;
		con = cpds.getConnection();
		con.setAutoCommit(false);
		if (type == checkType.ACCOUNT) {
			SQL = "SELECT count(*) over (partition by 1) total_rows FROM person WHERE accountID = ?";
		} else if (type == checkType.PERSON) {
			SQL = "SELECT count(*) over (partition by 1) total_rows FROM person WHERE personID = ?";
		} else if (type == checkType.STUDENT) {
			SQL = "SELECT count(*) over (partition by 1) total_rows FROM student WHERE studentID = ?";
		} else if (type == checkType.TEACHER) {
			SQL = "SELECT count(*) over (partition by 1) total_rows FROM teacher WHERE teacherID = ?";
		}

		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, id);
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

	public static int getCount(countType type) throws SQLException {
		con = cpds.getConnection();
		if (type == countType.PEOPLE) {
			SQL = "SELECT COUNT(*) as total_rows FROM person";
		} else if (type == countType.STUDENTS) {
			SQL = "SELECT COUNT(*) as total_rows FROM student";
		} else if (type == countType.ENROLLED) {
			SQL = "SELECT COUNT(*) as total_rows FROM student \r\n"
					+ "WHERE EXISTS (SELECT enrollment.studentID FROM enrollment WHERE student.studentID = enrollment.studentID)";
		} else if (type == countType.STUDENT_GRADES) {
			SQL = "SELECT COUNT(*) AS total_rows  FROM student s\r\n"
					+ "INNER JOIN person p ON p.personID = s.personID\r\n"
					+ "INNER JOIN enrollment e ON e.studentID = s.studentID\r\n"
					+ "WHERE EXISTS (SELECT enrollment.studentID FROM enrollment WHERE enrollment.studentID = s.studentID)\r\n"
					+ "AND EXISTS(SELECT grade.enrollmentID FROM grade WHERE grade.enrollmentID = e.enrollmentID)";
		} else if (type == countType.TEACHERS) {
			SQL = "SELECT COUNT(*) as total_rows FROM teacher";
		} else if (type == countType.AVAILABLE_PEOPLE) {
			SQL = "SELECT COUNT(*) as total_rows FROM person p\r\n"
					+ "WHERE NOT EXISTS (SELECT personID FROM student s WHERE s.personID = p.personID)\r\n"
					+ "AND NOT EXISTS (SELECT personID FROM teacher t WHERE t.personID = p.personID)";
		}

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

	public static Person[] getPeople() throws SQLException {
		int totalPeople = getCount(countType.PEOPLE);
		System.out.println(totalPeople);
		Person[] people = new Person[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT personID,firstName,lastName FROM person";
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
					people[i] = new Person(rs.getString("firstName"),
							rs.getString("lastName"), rs.getInt("personID"));
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

	public static Person[] getPeopleWithoutStudent() throws SQLException {
		int totalPeople = getCount(countType.AVAILABLE_PEOPLE);
		if (totalPeople == 0) {
			return null;
		}
		System.out.println(totalPeople);
		Person[] people = new Person[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT p.personID,p.firstName,p.lastName FROM person p \r\n"
				+ "				WHERE NOT EXISTS (SELECT personID FROM student s WHERE s.personID = p.personID)\r\n"
				+ "AND NOT EXISTS (SELECT personID FROM teacher t WHERE t.personID = p.personID)";
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
					people[i] = new Person(rs.getString("firstName"),
							rs.getString("lastName"), rs.getInt("personID"));
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

	public static Student[] getStudents() throws SQLException {
		int totalPeople = getCount(countType.STUDENTS);
		System.out.println(totalPeople);
		Student[] stu = new Student[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT s.studentID,s.personID, s.accountID, p.firstName, p.lastName  FROM student s\r\n"
				+ "INNER JOIN person p ON p.personID = s.personID\r\n"
				+ "ORDER BY p.lastName";
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

					stu[i] = new Student(rs.getInt("studentID"),
							rs.getInt("personID"), rs.getInt("accountID"),
							rs.getString("firstName"), rs.getString("lastName"));

					System.out.println(stu[i].getName());
					i++;
				}

				return stu;

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}

	}

	public static Student[] getStudentsWithEnrollment() throws SQLException {
		int totalPeople = getCount(countType.ENROLLED);
		System.out.println(totalPeople);
		Student[] stu = new Student[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT s.studentID,s.personID, s.accountID, p.firstName, p.lastName  FROM student s\r\n"
				+ "				INNER JOIN person p ON p.personID = s.personID\r\n"
				+ "				WHERE EXISTS (SELECT enrollment.studentID FROM enrollment WHERE enrollment.studentID = s.studentID)\r\n"
				+ "				ORDER BY p.lastName";
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

					stu[i] = new Student(rs.getInt("studentID"),
							rs.getInt("personID"), rs.getInt("accountID"),
							rs.getString("firstName"), rs.getString("lastName"));

					System.out.println(stu[i].getName());
					i++;
				}

				return stu;

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}

	}

	public static Student[] getStudentWithGrades() throws SQLException {
		int totalPeople = getCount(countType.STUDENT_GRADES);
		System.out.println(totalPeople);
		Student[] stu = new Student[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT s.studentID,s.personID, s.accountID, p.firstName, p.lastName  FROM student s\r\n"
				+ "								INNER JOIN person p ON p.personID = s.personID\r\n"
				+ "								INNER JOIN enrollment e ON e.studentID = s.studentID\r\n"
				+ "							WHERE EXISTS (SELECT enrollment.studentID FROM enrollment WHERE enrollment.studentID = s.studentID)\r\n"
				+ "							AND EXISTS(SELECT grade.enrollmentID FROM grade WHERE grade.enrollmentID = e.enrollmentID)\r\n"
				+ "								ORDER BY p.lastName";
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

					stu[i] = new Student(rs.getInt("studentID"),
							rs.getInt("personID"), rs.getInt("accountID"),
							rs.getString("firstName"), rs.getString("lastName"));

					System.out.println(stu[i].getName());
					i++;
				}

				return stu;

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}

	}

	public static Teacher[] getTeachers() throws SQLException {
		int totalPeople = getCount(countType.TEACHERS);
		System.out.println(totalPeople);
		Teacher[] tc = new Teacher[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT t.teacherID,t.personID, t.accountID, p.firstName, p.lastName  FROM teacher t\r\n"
				+ "INNER JOIN person p ON p.personID = t.personID";
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

					tc[i] = new Teacher(rs.getInt("teacherID"),
							rs.getInt("personID"), rs.getString("lastName"),
							rs.getString("firstName"));
					i++;
				}

				return tc;

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}

	}

	public static Person getPerson(int personID) throws SQLException {
		Connection con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT person.personID, person.accountID,firstName,lastName,middleName,suffix,gender,birthDate, a.username FROM person \r\n"
				+ "INNER JOIN accounts a ON a.personID = person.personID\r\n"
				+ "WHERE person.personID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		System.out.println(SQL);
		stmt.setInt(1, personID);
		try {
			rs = stmt.executeQuery();
			con.commit();
			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.first();
				return new Person(rs.getString("firstName"),
						rs.getString("lastName"), rs.getString("middleName"),
						rs.getInt("personID"), rs.getString("suffix"),
						rs.getInt("accountID"), 1, rs.getString("gender"),
						rs.getString("birthDate"), rs.getString("username"));

			}
		} finally {
			stmt.close();
			con.close();
			rs.close();

		}

	}

	public static void linkToStudent(int personID) throws SQLException,
			NoSuchAlgorithmException, IOException

	{
		if (checkByID(personID, checkType.PERSON) != 0
				&& CreateAccount.getAccountByPersonID(personID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO student (personID,accountID) \n"
					+ "SELECT personID, accountID \n" + "FROM   person \n"
					+ "WHERE personID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, personID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void unlinkStudent(int studentID) throws SQLException,
			NoSuchAlgorithmException, IOException

	{
		if (checkByID(studentID, checkType.STUDENT) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM student WHERE studentID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, studentID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void updateLink(int studentID, int personID)
			throws SQLException, NoSuchAlgorithmException, IOException

	{
		if (checkByID(studentID, checkType.STUDENT) != 0
				&& checkByID(personID, checkType.PERSON) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "UPDATE student  SET student.personID = ?, student.accountID = p.accountID\r\n"
					+ "FROM student\r\n"
					+ "INNER JOIN person p ON p.personID = student.personID\r\n"
					+ "WHERE student.studentID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, personID);
			stmt.setInt(2, studentID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void addTeacher(int personID) throws SQLException,
			NoSuchAlgorithmException, IOException

	{
		if (checkByID(personID, checkType.PERSON) != 0
				&& CreateAccount.getAccountByPersonID(personID) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "INSERT INTO teacher (personID,accountID) \n"
					+ "SELECT personID, accountID \n" + "FROM   person \n"
					+ "WHERE personID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, personID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void removeTeacher(int teacherID) throws SQLException,
			NoSuchAlgorithmException, IOException

	{
		if (checkByID(teacherID, checkType.TEACHER) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM teacher WHERE teacherID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, teacherID);
			try {
				stmt.executeUpdate();
				con.commit();
			} finally {
				con.close();
				stmt.close();
			}

		}
	}

	public static void editTeacher(int teacherID, int personID)
			throws SQLException, NoSuchAlgorithmException, IOException

	{
		if (checkByID(teacherID, checkType.TEACHER) != 0
				&& checkByID(personID, checkType.PERSON) != 0) {
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "UPDATE teacher SET teacher.personID = ?, teacher.accountID = p.accountID\r\n"
					+ "FROM teacher\r\n"
					+ "INNER JOIN person p ON p.personID = teacher.personID\r\n"
					+ "WHERE teacher.teacherID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1, personID);
			stmt.setInt(2, teacherID);
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
