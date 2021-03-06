package pms.z01_vo;

import java.util.Date;

public class Account {
	private int id;
	private String user_id;
	private String password;
	private String name;
	private String mail;
	private Date created_on;
	private Date last_login_on;
	private String auth;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(int id, String user_id, String password, String name, String mail, Date created_on,
			Date last_login_on, String auth) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.mail = mail;
		this.created_on = created_on;
		this.last_login_on = last_login_on;
		this.auth = auth;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public Date getLast_login_on() {
		return last_login_on;
	}
	public void setLast_login_on(Date last_login_on) {
		this.last_login_on = last_login_on;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}


}