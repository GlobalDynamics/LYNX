package course;

public class Enrollment {
	private int enrollmentID;
	private int courseID;
	private int studentID;
	private int calendarID;
	private String courseName;
	private String shortName;
	private int gradeID;
	
	public Enrollment(int eid,int cid, int sid, int caid, String name, String sname)
	{
		 enrollmentID = eid;
		 courseID = cid;
		 studentID = sid;
		 calendarID = caid;
		 courseName = name;
		 shortName = sname;
	}
	
	public Enrollment(int eid,int cid, int sid, int caid, String name, String sname, int gid)
	{
		 enrollmentID = eid;
		 courseID = cid;
		 studentID = sid;
		 calendarID = caid;
		 courseName = name;
		 shortName = sname;
		 gradeID = gid;
	}
	
	public String getName()
	{
		return courseName + " (" + shortName + ")";
	}
	
	public String getEnroll()
	{
		return String.valueOf(enrollmentID);
	}
	public String getCourse()
	{
		return String.valueOf(courseID);
	}
	public String getGrade()
	{
		return String.valueOf(gradeID);
	}

}
