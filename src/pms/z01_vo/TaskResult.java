package pms.z01_vo;

import java.util.Date;

public class TaskResult {
	private int id;
	private String subject;
	private String name;
	private String due_date;
	private Date completed_on;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public Date getCompleted_on() {
		return completed_on;
	}

	public void setCompleted_on(Date completed_on) {
		this.completed_on = completed_on;
	}

}
