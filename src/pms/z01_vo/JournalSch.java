package pms.z01_vo;

public class JournalSch {

private int projectId;
private int document_id;
public JournalSch(int projectId, int document_id) {
	super();
	this.projectId = projectId;
	this.document_id = document_id;
}
public int getProjectId() {
	return projectId;
}
public void setProjectId(int projectId) {
	this.projectId = projectId;
}
public int getDocument_id() {
	return document_id;
}
public void setDocument_id(int document_id) {
	this.document_id = document_id;
}

}
