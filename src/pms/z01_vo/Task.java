package pms.z01_vo;
// pms.z01_vo.Task

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Task {
	private int id;
	private int parent_id;
	private int project_id;
	private int account_id;
	private String subject;
	private String description;
	private String status;
	private int priority;
	private Date created_on;
	private Date updated_on;
	private String start_date;
	private String due_date;
	private int estimated;
	private int done_ratio;
	private Date completed_on;
	private String tracker; // 유형 추가
	private String backgroundColor; // 캘린더 색깔 추가 
	private String name; // 어카운트 이름 불러오기
	private String project_name;
	private MultipartFile[] report; // 업로드시 필요(파일 수정시 업로드)
	private String[] filenames; // 파일 수정시 사용
	private ArrayList<Attachment> fileInfo;
	private ArrayList<Comment> commentInfo;
	private String content; // journal content

	public Task() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public Date getUpdated_on() {
		return updated_on;
	}

	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
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

	public String getTracker() {
		return tracker;
	}

	public void setTracker(String tracker) {
		this.tracker = tracker;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public String[] getFilenames() {
		return filenames;
	}
	public void setFilename(String[] filenames) {
		this.filenames = filenames;
	} 

	public void setFilenames(String[] filenames) {
		this.filenames = filenames;
	}
	
	public ArrayList<Attachment> getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(ArrayList<Attachment> fileInfo) {
		this.fileInfo = fileInfo;
	}

	public ArrayList<Comment> getCommentInfo() {
		return commentInfo;
	}

	public void setCommentInfo(ArrayList<Comment> commentInfo) {
		this.commentInfo = commentInfo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
