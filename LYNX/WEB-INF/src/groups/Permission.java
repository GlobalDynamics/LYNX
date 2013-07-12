package groups;

public class Permission {
	public int read;
	public int write;
	public int full;
	public int none;
	public String page;
	
	
	public Permission(int read, int write, int full, int none, String page)
	{
		this.read = read;
		this.write = write;
		this.full = full;
		this.none = none;
		this.page = page;
	}

}
