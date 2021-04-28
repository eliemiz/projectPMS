package pms.z01_vo;

public class TaskSch {
	private int projectId;
	private String subject;
	private String tracker;
	private String status;
	private String writer;

	public TaskSch(int projectId, String subject, String tracker, String status, String writer) {
		super();
		this.projectId = projectId;
		this.subject = subject;
		this.tracker = tracker;
		this.status = status;
		this.writer = writer;
	}

	public TaskSch(int projectId, String status) {
		super();
		this.projectId = projectId;
		this.status = status;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
