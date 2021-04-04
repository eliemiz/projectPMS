package pms.z01_vo;

public class Project {

	private int projectId;
	private String subject;
	private String description;
	private String identifier;
	private String homepage;
	private boolean isPublic;
	private int parentProjectId;
	private boolean inheritMembers;

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(int projectId, String subject, String description, String identifier, String homepage,
			boolean isPublic, int parentProjectId, boolean inheritMembers) {
		super();
		this.projectId = projectId;
		this.subject = subject;
		this.description = description;
		this.identifier = identifier;
		this.homepage = homepage;
		this.isPublic = isPublic;
		this.parentProjectId = parentProjectId;
		this.inheritMembers = inheritMembers;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public int getParentProjectId() {
		return parentProjectId;
	}

	public void setParentProjectId(int parentProjectId) {
		this.parentProjectId = parentProjectId;
	}

	public boolean isInheritMembers() {
		return inheritMembers;
	}

	public void setInheritMembers(boolean inheritMembers) {
		this.inheritMembers = inheritMembers;
	}

}
