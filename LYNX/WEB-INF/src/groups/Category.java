package groups;

public class Category {
	public String name;
	public String alternateID;
	public String url;
	public int active;
	public Category(String n, String aID, String url, int active)
	{
		name = n;
		alternateID = aID;
		this.url = url;
		this.active = active;
	}
}
