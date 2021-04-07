package pms.z01_vo;

import java.util.Date;

public class Risk {
	private int id;
	private int Account_id;
	private String subject;
	private String description;
	private String status;
	private String category;
	private Date created_on;
	private String created_on_s;
	private Date updated_on;
	private String updated_on_s;
	private Date start_date;
	private String start_date_s;
	private Date end_date;
	private String end_date_s;
	private int probability;
	private int impact;
	private String strategy;
	private String treatment;
	public Risk() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Risk(int id, int account_id, String subject, String description, String status, String category,
			Date created_on, Date updated_on, Date start_date, Date end_date, int probability, int impact,
			String strategy, String treatment) {
		super();
		this.id = id;
		Account_id = account_id;
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
	public Risk(int id, int account_id, String subject, String description, String status, String category,
			String created_on_s, String updated_on_s, String start_date_s, String end_date_s, int probability,
			int impact, String strategy, String treatment) {
		super();
		this.id = id;
		Account_id = account_id;
		this.subject = subject;
		this.description = description;
		this.status = status;
		this.category = category;
		this.created_on_s = created_on_s;
		this.updated_on_s = updated_on_s;
		this.start_date_s = start_date_s;
		this.end_date_s = end_date_s;
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
	public int getAccount_id() {
		return Account_id;
	}
	public void setAccount_id(int account_id) {
		Account_id = account_id;
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
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public String getCreated_on_s() {
		return created_on_s;
	}
	public void setCreated_on_s(String created_on_s) {
		this.created_on_s = created_on_s;
	}
	public Date getUpdated_on() {
		return updated_on;
	}
	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}
	public String getUpdated_on_s() {
		return updated_on_s;
	}
	public void setUpdated_on_s(String updated_on_s) {
		this.updated_on_s = updated_on_s;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getStart_date_s() {
		return start_date_s;
	}
	public void setStart_date_s(String start_date_s) {
		this.start_date_s = start_date_s;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getEnd_date_s() {
		return end_date_s;
	}
	public void setEnd_date_s(String end_date_s) {
		this.end_date_s = end_date_s;
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
