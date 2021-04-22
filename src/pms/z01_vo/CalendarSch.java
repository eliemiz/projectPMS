package pms.z01_vo;

public class CalendarSch {
	// 검색조건
	private int projectId;
	private String taskName;
	private String status;
	private String name;

	public CalendarSch(int projectId, String taskName, String status, String name) {
		super();
		this.projectId = projectId;
		this.taskName = taskName;
		this.status = status;
		this.name = name;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
