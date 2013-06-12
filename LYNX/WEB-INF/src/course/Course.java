package course;

import lynx.Manager;

public class Course extends Manager {
	private int courseID;
	private int subjectID;
	private String name;
	private String shortName;
	private int teacherID;
	private String subjectName;
	private String enrollmentID;
	
	
	public Course(int c, int s, String n, String sname, int tid, String suname)
	{
		courseID = c;
		subjectID = s;
		name = n;
		shortName  = sname;
		teacherID = tid;
		subjectName = suname;
	}
	public Course(int c, int s, String n, String sname)
	{
		courseID = c;
		subjectID = s;
		name = n;
		shortName = sname;
	}
	public Course(int c, int s, String n, String sname, String eid)
	{
		courseID = c;
		subjectID = s;
		name = n;
		shortName = sname;
		enrollmentID = eid;
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
	public String getEnroll()
	{
		return enrollmentID;
	}
	
}
