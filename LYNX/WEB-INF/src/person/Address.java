package person;

import lynx.Manager;

public class Address extends Manager {
	public String street = "";
	public String zipcode = "";
	public String apt = "";
	public String house = "";
	public String direction = "";
	public String state = "";
	public String city = "";
	public String phone = "";
	public String country  = "";
	public String email = "";
	public Address(String street, String zipcode, String apt, String house, String direction, String state, String city, String phone, String country, String email)
	
	{
		this.street = street;
		this.zipcode = zipcode;
		this.apt = apt;
		this.house = house;
		this.direction = direction;
		this.state = state;
		this.city = city;
		this.phone = phone;
		this.country = country;
		this.email = email;
	}
	
}
