package pms.z01_vo;

import java.util.Date;

public class Journal {
	private int id;
	private String document_type;
	private int document_id;
	private int account_id;
	private Date created_on;
	private String created_on_s;
	public Journal() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Journal(int id, String document_type, int document_id, int account_id, Date created_on) {
		super();
		this.id = id;
		this.document_type = document_type;
		this.document_id = document_id;
		this.account_id = account_id;
		this.created_on = created_on;
	}
	public Journal(int id, String document_type, int document_id, int account_id, String created_on_s) {
		super();
		this.id = id;
		this.document_type = document_type;
		this.document_id = document_id;
		this.account_id = account_id;
		this.created_on_s = created_on_s;
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
}
