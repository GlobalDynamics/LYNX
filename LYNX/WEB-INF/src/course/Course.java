package course;

import lynx.Manager;

public class Course extends Manager {
	private int courseID;
	private int subjectID;
	private String name;
	private String shortName;
	private int teacherID;
	private String subjectName;
	
	
	public Course(int c, int s, String n, String sname, int tid, String suname)
	{
		courseID = c;
		subjectID = s;
		name = n;
		shortName  = sname;
		teacherID = tid;
		subjectName = suname;
	}
	public String getCourse()
	{
		return String.valueOf(courseID);
	}
	public String getName()
	{
		return name + " (" + shortName + ")";
	}
	public String getSubject()
	{
		return String.valueOf(subjectID);
	}
	public String getSubjectName()
	{
		return subjectName;
	}
	
}
