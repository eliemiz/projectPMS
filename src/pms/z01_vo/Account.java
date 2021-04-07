package pms.z01_vo;

import java.util.Date;

public class Account {
	private int id;
	private String user;
	private String password;
	private String name;
	private String mail;
	private Date created_on;
	private String created_on_s;
	private Date last_login_on;
	private String last_login_on_s;
	private String auth;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(int id, String user, String password, String name, String mail, Date created_on, Date last_login_on,
			String auth) {
		super();
		this.id = id;
		this.user = user;
		this.password = password;
		this.name = name;
		this.mail = mail;
		this.created_on = created_on;
		this.last_login_on = last_login_on;
		this.auth = auth;
	}
	public Account(int id, String user, String password, String name, String mail, String created_on_s,
			String last_login_on_s, String auth) {
		super();
		this.id = id;
		this.user = user;
		this.password = password;
		this.name = name;
		this.mail = mail;
		this.created_on_s = created_on_s;
		this.last_login_on_s = last_login_on_s;
		this.auth = auth;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
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
	public String getCreated_on_s() {
		return created_on_s;
	}
	public void setCreated_on_s(String created_on_s) {
		this.created_on_s = created_on_s;
	}
	public Date getLast_login_on() {
		return last_login_on;
	}
	public void setLast_login_on(Date last_login_on) {
		this.last_login_on = last_login_on;
	}
	public String getLast_login_on_s() {
		return last_login_on_s;
	}
	public void setLast_login_on_s(String last_login_on_s) {
		this.last_login_on_s = last_login_on_s;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}


}