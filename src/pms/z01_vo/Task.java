package pms.z01_vo;
// pms.z01_vo.Task

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Task {
	private int id;
	private int parent_id;
	private int project_id;
	private int user_id;
	private String subject;
	private String description;
	private String tracker;
	private String status;
	private int priority;
	private Date created_on;
	private String created_on_s;
	private Date updated_on;
	private String updated_on_s;
	private Date start_date;
	private String start_date_s;
	private Date due_date;
	private String due_date_s;
	private int estimated;
	private int done_ratio;
	private Date completed_on;
	private String completed_on_s;
//	private MultipartFile[] report; // 업로드시 필요(파일 수정시 업로드)
//	private String[] filename; // 파일 수정시 사용
//	private ArrayList<Attachment> fileInfo;
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Task(int id, int parent_id, int project_id, int user_id, String subject, String description, String tracker, String status,
			int priority, Date created_on, Date updated_on, Date start_date, Date due_date, int estimated,
			int done_ratio, Date completed_on) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.project_id = project_id;
		this.user_id = user_id;
		this.subject = subject;
		this.description = description;
		this.tracker = tracker;
		this.status = status;
		this.priority = priority;
		this.created_on = created_on;
		this.updated_on = updated_on;
		this.start_date = start_date;
		this.due_date = due_date;
		this.estimated = estimated;
		this.done_ratio = done_ratio;
		this.completed_on = completed_on;
	}
	public Task(int id, int parent_id, int project_id, int user_id, String subject, String description, String tracker, String status,
			int priority, String created_on_s, String updated_on_s, String start_date_s, String due_date_s,
			int estimated, int done_ratio, String completed_on_s) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.project_id = project_id;
		this.user_id = user_id;
		this.subject = subject;
		this.description = description;
		this.tracker = tracker;
		this.status = status;
		this.priority = priority;
		this.created_on_s = created_on_s;
		this.updated_on_s = updated_on_s;
		this.start_date_s = start_date_s;
		this.due_date_s = due_date_s;
		this.estimated = estimated;
		this.done_ratio = done_ratio;
		this.completed_on_s = completed_on_s;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTracker() {
		return tracker;
	}
	public void setTracker(String tracker) {
		this.tracker = tracker;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
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
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getStart_date_s() {
		return start_date_s;
	}
	public void setStart_date_s(String start_date_s) {
		this.start_date_s = start_date_s;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getDue_date_s() {
		return due_date_s;
	}
	public void setDue_date_s(String due_date_s) {
		this.due_date_s = due_date_s;
	}
	public int getEstimated() {
		return estimated;
	}
	public void setEstimated(int estimated) {
		this.estimated = estimated;
	}
	public int getDone_ratio() {
		return done_ratio;
	}
	public void setDone_ratio(int done_ratio) {
		this.done_ratio = done_ratio;
	}
	public Date getCompleted_on() {
		return completed_on;
	}
	public void setCompleted_on(Date completed_on) {
		this.completed_on = completed_on;
	}
	public String getCompleted_on_s() {
		return completed_on_s;
	}
	public void setCompleted_on_s(String completed_on_s) {
		this.completed_on_s = completed_on_s;
	}
	/*
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public String[] getFilename() {
		return filename;
	}
	public void setFilename(String[] filename) {
		this.filename = filename;
	} 
	public ArrayList<Attachment> getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(ArrayList<Attachment> fileInfo) {
		this.fileInfo = fileInfo;
	}
	 */
	
}
