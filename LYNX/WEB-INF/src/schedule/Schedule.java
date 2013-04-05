package schedule;

public class Schedule {
	private String name;
	private String courseName;
	private String shortName;
	private String subject;
	private String grade;
	private String calendarName;
	
	public Schedule(String n, String cname, String sname, String sub, String g, String c)
	{
		 name = n;
		 courseName = cname;
		 shortName = sname;
		 subject = sub;
		 grade = g;
		 calendarName = c;
	}
	public String getName()
	{
		return name;
	}
	public String getCourse()
	{
		return courseName + " (" + shortName + ")";
	}
	public String getSubject()
	{
		return subject;
	}
	public String getGrade()
	{
		return grade;
	}
	public String getCalendar()
	{
		return calendarName;
	}
}
