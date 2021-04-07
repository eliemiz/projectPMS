package pms.z01_vo;
// pms.z01_vo.Time_Entry

import java.util.Date;

public class Time_Entry {
	private int id;
	private int task_id;
	private int account_id;
	private String comments;
	private int spent_hours;
	private Date created_on;
	private String created_on_s;
	public Time_Entry() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Time_Entry(int id, int task_id, int account_id, String comments, int spent_hours, Date created_on) {
		super();
		this.id = id;
		this.task_id = task_id;
		this.account_id = account_id;
		this.comments = comments;
		this.spent_hours = spent_hours;
		this.created_on = created_on;
	}
	public Time_Entry(int id, int task_id, int account_id, String comments, int spent_hours, String created_on_s) {
		super();
		this.id = id;
		this.task_id = task_id;
		this.account_id = account_id;
		this.comments = comments;
		this.spent_hours = spent_hours;
		this.created_on_s = created_on_s;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getSpent_hours() {
		return spent_hours;
	}
	public void setSpent_hours(int spent_hours) {
		this.spent_hours = spent_hours;
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
