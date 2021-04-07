package pms.z01_vo;
// pms.z01_vo.Comment

import java.util.Date;

public class Comment {
	private int id;
	private String document_type;
	private int document_id;
	private int account_id;
	private String content;
	private Date created_on;
	private String created_on_s;
	private Date updated_on;
	private String updated_on_s;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String document_type, int document_id, int account_id, String content, Date created_on,
			Date updated_on) {
		super();
		this.id = id;
		this.document_type = document_type;
		this.document_id = document_id;
		this.account_id = account_id;
		this.content = content;
		this.created_on = created_on;
		this.updated_on = updated_on;
	}
	public Comment(int id, String document_type, int document_id, int account_id, String content, String created_on_s,
			String updated_on_s) {
		super();
		this.id = id;
		this.document_type = document_type;
		this.document_id = document_id;
		this.account_id = account_id;
		this.content = content;
		this.created_on_s = created_on_s;
		this.updated_on_s = updated_on_s;
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
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public String getCreated_on_s() {
		return created_on_s;
	}
	public void setCreated_on_s(String created_on_s) {
		this.created_on_s = created_on_s;
	}
	public Date getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}
	public String getUpdated_on_s() {
		return updated_on_s;
	}
	public void setUpdated_on_s(String updated_on_s) {
		this.updated_on_s = updated_on_s;
	}
	
}
