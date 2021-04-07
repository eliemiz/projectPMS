package pms.z01_vo;

public class RiskRelation {
	private int risk_id;
	private int task_id;
	
	public RiskRelation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RiskRelation(int risk_id, int task_id) {
		super();
		this.risk_id = risk_id;
		this.task_id = task_id;
	}
	public int getRisk_id() {
		return risk_id;
	}
	public void setRisk_id(int risk_id) {
		this.risk_id = risk_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	
}
