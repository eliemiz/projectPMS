package pms.z01_vo;

public class JournalDetail {
	private int id;
	private int journal_id;
	private String property;
	private String prop_key;
	private String old_value;
	private String value;
	public JournalDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JournalDetail(int id, int journal_id, String property, String prop_key, String old_value, String value) {
		super();
		this.id = id;
		this.journal_id = journal_id;
		this.property = property;
		this.prop_key = prop_key;
		this.old_value = old_value;
		this.value = value;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJournal_id() {
		return journal_id;
	}
	public void setJournal_id(int journal_id) {
		this.journal_id = journal_id;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getProp_key() {
		return prop_key;
	}
	public void setProp_key(String prop_key) {
		this.prop_key = prop_key;
	}
	public String getOld_value() {
		return old_value;
	}
	public void setOld_value(String old_value) {
		this.old_value = old_value;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
