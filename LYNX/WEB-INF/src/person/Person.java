package person;

import lynx.Manager;

public class Person extends Manager {
	private  String firstName;
	private  String lastName;
	private  String middleName;
	private String suffix;
	private int accountID;
	private int addressID;
	private String gender;
	private String birthDate;
	private  int personID;
	private String username;
	public Person(String fname, String lname, String mname, int pID, String suf, int aID, int adID, String gnr, String date,String usr)
	{
		  firstName = fname;
		  lastName = lname;
		  middleName = mname;
		  personID = pID;
		  suffix = suf;
		  accountID = aID;
		  addressID = adID;
		  gender = gnr;
		  birthDate = date;
		  username = usr;
	}
	public Person(String fname, String lname, int pID)
	{
		  firstName = fname;
		  personID = pID;
		  lastName = lname;
	}
	public  String getName()
	{
		return firstName + " " + lastName;
	}
	public  String getFirstName()
	{
		return firstName;
	}
	public  String getID()
	{
		return String.valueOf(personID);
	}
	public String getLastName()
	{
		return lastName;
	}
	public String getMiddleName()
	{
		return middleName;
	}
	public String getSuffix()
	{
		return suffix;
	}
	public String getGender()
	{
		return gender;
	}
	public String getBirth()
	{
		return birthDate;
	}
	public String getUser()
	{
		return username;
		
	}
}
