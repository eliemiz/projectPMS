package pms.z01_vo;

public class Risk {
	private int id;
	private int project_id;
	private int account_id;
	private String subject;
	private String description;
	private String status;
	private String category;
	
	private String created_on;
	
	private String updated_on;
	
	private String start_date;
	
	private String end_date;
	private int probability;
	private int impact;
	private String strategy;
	private String treatment;
	public Risk() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Risk(int id, int project_id, int account_id, String subject, String description, String status,
			String category, String created_on, String updated_on, String start_date, String end_date, int probability,
			int impact, String strategy, String treatment) {
		super();
		this.id = id;
		this.project_id = project_id;
		this.account_id = account_id;
		this.subject = subject;
		this.description = description;
		this.status = status;
		this.category = category;
		this.created_on = created_on;
		this.updated_on = updated_on;
		this.start_date = start_date;
		this.end_date = end_date;
		this.probability = probability;
		this.impact = impact;
		this.strategy = strategy;
		this.treatment = treatment;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}
	public String getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(String updated_on) {
		this.updated_on = updated_on;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getProbability() {
		return probability;
	}
	public void setProbability(int probability) {
		this.probability = probability;
	}
	public int getImpact() {
		return impact;
	}
	public void setImpact(int impact) {
		this.impact = impact;
	}
	public String getStrategy() {
		return strategy;
	}
	public void setStrategy(String strategy) {
		this.strategy = strategy;
	}
	public String getTreatment() {
		return treatment;
	}
	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}
	
	
	
}
