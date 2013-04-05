package schedule;

public class Schedule {
	private String name;
	private String courseName;
	private String shortName;
	private String subject;
	private String grade;
	
	public Schedule(String n, String cname, String sname, String sub, String g)
	{
		 name = n;
		 courseName = cname;
		 shortName = sname;
		 subject = sub;
		 grade = g;
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
}
