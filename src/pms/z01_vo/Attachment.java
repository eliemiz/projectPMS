package pms.z01_vo;
// pms.z01_vo.Attachment

import java.util.Date;

public class Attachment {
	private int id;
	private String document_type;
	private int document_id;
	private String filename;
	private String disk_filename;
	private String pathname;
	private String filesize;
//	private Date created_on;
	private String created_on;
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Attachment(String filename, String pathname) {
		super();
		this.filename = filename;
		this.pathname = pathname;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getDisk_filename() {
		return disk_filename;
	}
	public void setDisk_filename(String disk_filename) {
		this.disk_filename = disk_filename;
	}
	public String getPathname() {
		return pathname;
	}
	public void setPathname(String pathname) {
		this.pathname = pathname;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
/*
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
*/
	public String getCreated_on() {
		return created_on;
	}
	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}

}
