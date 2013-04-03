package person;

import lynx.Manager;

public class Teacher extends Manager {
	private int teacherID;
	private int personID;
	private String firstName;
	private String lastName;
	
	public Teacher(int tid, int pid,String lname, String fname)
	{
		teacherID = tid;
		personID = pid;
		firstName = fname;
		lastName = lname;
	}
	public int getTeacher()
	{
		return teacherID;
	}
	public int getPerson()
	{
		return personID;
	}
	public String getName()
	{
		return firstName + " " + lastName;
	}
}
