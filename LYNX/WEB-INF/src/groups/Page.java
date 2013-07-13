package groups;

public class Page {
	
	public String name;
	public String title;
	public String url;
	public int active;
	public String moduleID;
	
	public Page(String name, String title, String url, int active)
	
	{
		this.name = name;
		this.title = title;
		this.url = url;
		this.active = active;
	}
public Page(String name, String title, String url, int active, String moduleID)
	
	{
		this.name = name;
		this.title = title;
		this.url = url;
		this.active = active;
		this.moduleID = moduleID;
	}

}
