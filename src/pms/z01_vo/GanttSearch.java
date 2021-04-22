package pms.z01_vo;

public class GanttSearch {
	// 검색용
	private int projectId;
	private String taskName;

	public GanttSearch(int projectId, String taskName) {
		super();
		this.projectId = projectId;
		this.taskName = taskName;
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

}
