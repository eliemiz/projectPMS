package pms.z01_vo;

public class ProjectUser {

	private int project_id;
	private int account_id;
	private String name;
	private String auth;
	private boolean member;

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public boolean isMember() {
		return member;
	}

	public void setMember(boolean member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "ProjectUser [project_id=" + project_id + ", account_id=" + account_id + ", name=" + name + ", auth="
				+ auth + ", member=" + member + "]";
	}

}
