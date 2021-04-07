package pms.z01_vo;

public class Project {
	private int id;
	private String name;
	private String description;
	private String identifier;
	private String homepage;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Project(int id, String name, String description, String identifier, String homepage) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.identifier = identifier;
		this.homepage = homepage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
}
