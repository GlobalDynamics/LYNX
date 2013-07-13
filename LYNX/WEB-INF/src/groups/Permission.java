package groups;

public class Permission {
	public int read;
	public int write;
	public int full;
	public int none;
	public String page;
	public String moduleID;
	
	
	public Permission(int read, int write, int full, int none, String page, String moduleID)
	{
		this.read = read;
		this.write = write;
		this.full = full;
		this.none = none;
		this.page = page;
		this.moduleID = moduleID;
	}

}
