package pms.z01_vo;

public class GanttSearch {
	// 검색용
	private int projectId;
	private String taskName;
	private String status;

	public GanttSearch(int projectId, String taskName, String status) {
		super();
		this.projectId = projectId;
		this.taskName = taskName;
		this.status = status;
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

}
