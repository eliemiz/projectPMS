package pms.z01_vo;

import java.util.Date;

public class Journal {
	private int id;
	private String document_type;
	private int document_id;
	private int account_id;
//	private String created_on;
	private Date created_on;
	private String content;
	
	public Journal(int account_id, String content) {
		super();
		this.account_id = account_id;
		this.content = content;
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

}
