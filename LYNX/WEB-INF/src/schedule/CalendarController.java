package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import course.CourseController;

import person.Person;

import account.CreateAccount;
import lynx.Manager;

public class CalendarController extends Manager {
	private static Connection con;
	private static String SQL;
	private static ResultSet rs;
	
	public static void createCalendar(String name, String start, String end)
			throws SQLException, ParseException {

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "INSERT INTO calendar(name,startDate,endDate)\r\n"
				+ "VALUES (?,?,?)";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		DateFormat DOB = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date startDate = new java.sql.Date(DOB.parse(start).getTime());
		java.sql.Date endDate = new java.sql.Date(DOB.parse(end).getTime());
		stmt.setString(1, name);
		stmt.setDate(2, startDate);
		stmt.setDate(3, endDate);

		try {
			stmt.executeUpdate();
			con.commit();
		} finally {
			con.close();
			stmt.close();
		}

	}
	
	public static void removeCalendar(int calendarID)
			throws SQLException, ParseException {
		
		if(checkCalendarByID(calendarID) != 0)
		{
			con = cpds.getConnection();
			con.setAutoCommit(false);
			SQL = "DELETE FROM calendar WHERE calendarID = ?";
			PreparedStatement stmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			stmt.setInt(1,calendarID);
			try {
				stmt.executeUpdate();
				con.commit();
				CourseController.removeSubjectFromCalendar(calendarID);
			} finally {
				con.close();
				stmt.close();
			}
		}
		

	}
	private static int checkCalendarByID(int calendarID) throws SQLException {

		con = cpds.getConnection();
		con.setAutoCommit(false);
		SQL = "SELECT count(*) over (partition by 1) total_rows FROM calendar WHERE calendarID = ?";
		PreparedStatement stmt = con.prepareStatement(SQL);
		System.out.println(SQL);
		stmt.setInt(1, calendarID);
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
	public static int getCalendarCount() throws SQLException {
		con = cpds.getConnection();

		SQL = "SELECT COUNT(*) as total_rows FROM calendar";
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
	
	public static Calendar[] getCalendars() throws SQLException {
		int totalPeople = getCalendarCount();
		System.out.println(totalPeople);
		Calendar[] people = new Calendar[totalPeople];
		Connection con = cpds.getConnection();

		SQL = "SELECT calendarID,name,startDate,endDate FROM calendar";
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
					people[i] = new Calendar(rs.getString("name"), rs.getString("startDate"), rs.getString("endDate"), rs.getInt("calendarID"));
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
	
	public static Calendar[] getCalendarsNotByID(int calendarID) throws SQLException {
		int totalPeople = getCalendarCount();
		System.out.println(totalPeople);
		Calendar[] people = new Calendar[totalPeople-1];
		Connection con = cpds.getConnection();

		SQL = "SELECT calendarID,name,startDate,endDate FROM calendar WHERE calendarID <> ?";
		PreparedStatement stmt = con.prepareStatement(SQL,
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		stmt.setInt(1, calendarID);
		System.out.println(SQL);
		try {
			rs = stmt.executeQuery();

			if (!rs.isBeforeFirst()) {
				return null;

			} else {
				rs.beforeFirst();

				int i = 0;
				while (rs.next()) {
					people[i] = new Calendar(rs.getString("name"), rs.getString("startDate"), rs.getString("endDate"), rs.getInt("calendarID"));
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
