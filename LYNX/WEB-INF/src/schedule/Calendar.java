package schedule;

public class Calendar {
	private String name;
	private String start;
	private String end;
	private int calendarID;
	
	public Calendar(String n, String s, String e, int ID)
	{
		name = n;
		start = s;
		end = e;
		calendarID = ID;
	}
	public String getName()
	{
		return name;
	}
	public String getStart()
	{
		return start;
	}
	public String getEnd()
	{
		return end;
	}
	public String getID()
	{
		return String.valueOf(calendarID);
	}

}
