package pms.z01_vo;

import java.util.Date;

public class JournalEx {
	private int id;
	private String document_type;
	private int document_id;
	private String content;
	private int account_id;
//	private String created_on;
	private Date created_on;
	private String account_name;
	private String project_name;

	public JournalEx() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * public Journal(int id, String document_type, int document_id, int account_id,
	 * Date created_on) { super(); this.id = id; this.document_type = document_type;
	 * this.document_id = document_id; this.account_id = account_id; this.created_on
	 * = created_on; }
	 */
	public JournalEx(int id, String document_type, int document_id, String content, int account_id, Date created_on) {
		super();
		this.id = id;
		this.document_type = document_type;
		this.document_id = document_id;
		this.content = content;
		this.account_id = account_id;
		this.created_on = created_on;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	/*
	 * public String getCreated_on() { return created_on; } public void
	 * setCreated_on(String created_on) { this.created_on = created_on; }
	 */
	public Date getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

}
