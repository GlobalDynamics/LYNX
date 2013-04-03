package course;

public class Subject {
	private  int subjectID;
	private  String name;
	private  int calendarID;
	
	public Subject(String n, int s, int c)
	{
		name = n;
		subjectID = s;
		calendarID = c;
	}
	
	public String getName()
	{
		return name;
	}
	
	public String getSubject()
	{
		return String.valueOf(subjectID);
	}
	
	public String getCalendar()
	{
		return String.valueOf(calendarID);
	}
}
