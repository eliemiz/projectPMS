package pms.z01_vo;
// pms.z01_vo.Task_Relation

public class Task_Relation {
	private int task_id;
	private int related_id;
	public Task_Relation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Task_Relation(int task_id, int related_id) {
		super();
		this.task_id = task_id;
		this.related_id = related_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public int getRelated_id() {
		return related_id;
	}
	public void setRelated_id(int related_id) {
		this.related_id = related_id;
	}
	
}
