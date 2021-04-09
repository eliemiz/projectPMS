package pms.z01_vo;

import java.util.Date;

public class Notice {
	private int id;
	private int project_id;
	private int account_id;
	private String subject;
	private String content;
	
	private String created_on;

	private String updated_on;

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int id, int project_id, int account_id, String subject, String content, String created_on,
			String updated_on) {
		super();
		this.id = id;
		this.project_id = project_id;
		this.account_id = account_id;
		this.subject = subject;
		this.content = content;
		this.created_on = created_on;
		this.updated_on = updated_on;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated_on() {
		return created_on;
	}

	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}

	public String getUpdated_on() {
		return updated_on;
	}

	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	
}
