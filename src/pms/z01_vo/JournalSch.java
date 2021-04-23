package pms.z01_vo;

public class JournalSch {

private int projectId;
private String document_type;
private int document_id;
	public JournalSch(int projectId, String document_type, int document_id) {
		super();
		this.projectId = projectId;
		this.document_type = document_type;
		this.document_id = document_id;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getDocument_type() {
		return document_type;
	}
	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
}
