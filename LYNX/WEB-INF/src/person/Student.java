package person;

import lynx.Manager;

public class Student extends Manager {
	private   int personID;
	private   int studentID;
	private   int accountID;
	private   String firstName;
	private   String lastName;
	
	public Student(int sid,int pid, int aid,String fname, String lname)
	{
		personID = pid;
		studentID = sid;
		accountID = aid;
		firstName = fname;
		lastName = lname;
	}
	public int getPerson()
	{
		return personID;
	}
	public int getStudent()
	{
		return studentID;
	}
	public int getAccount()
	{
		return accountID;
	}
	public String getName()
	{
		return firstName + " " + lastName;
	}
}
