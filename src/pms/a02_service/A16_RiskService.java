package pms.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a03_dao.A00_AccountDao;
import pms.a03_dao.A16_RiskDao;
import pms.z01_vo.Account;
import pms.z01_vo.Attachment;
import pms.z01_vo.Journal;
import pms.z01_vo.Risk;
import pms.z01_vo.RiskSch;
import pms.z02_util.TimeManager;

@Service
public class A16_RiskService {
	@Autowired(required = false)
	private A16_RiskDao dao;
	@Autowired(required = false)
	private A00_AccountDao daoA;
	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;
	
	public ArrayList<Risk> getRiskList(Risk sch){
		
		ArrayList<Risk> riskList = dao.getRiskList(sch);
		for (Risk risk : riskList) {
			risk.setStart_date(TimeManager.getInstance().datetimeToSimple(risk.getStart_date()));  
			risk.setEnd_date(TimeManager.getInstance().datetimeToSimple(risk.getEnd_date()));  
		}
		
		
		return riskList;
	}
	public ArrayList<Risk> riskList(RiskSch sch){
			
			ArrayList<Risk> riskList = dao.riskList(sch);
			for (Risk risk : riskList) {
				risk.setStart_date(TimeManager.getInstance().datetimeToSimple(risk.getStart_date()));  
				risk.setEnd_date(TimeManager.getInstance().datetimeToSimple(risk.getEnd_date()));  
			}
			
			
			return riskList;
		}
	
	public void insertRisk(Risk ins) {
		System.out.println("upload:"+upload);
		System.out.println("uploadTmp:"+uploadTmp);
		
		/*
		 * String start =
		 * TimeManager.getInstance().datetimeToSimple(ins.getStart_date());
		 * ins.setStart_date(start); String end =
		 * TimeManager.getInstance().datetimeToSimple(ins.getEnd_date());
		 * ins.setEnd_date(end);
		 */
		
		dao.insertRisk(ins);
		
		String filename=null;
		long filesize = 0;
		File tmpFile = null;
		File orgFile = null; 
		
		File pathFile = new File(uploadTmp); 
		
		for(File f : pathFile.listFiles()) {
			System.out.println("삭제할 파일:"+f.getName());
			f.delete();
		}
		
		for(MultipartFile mpf:ins.getReport()) {
			
			filename = mpf.getOriginalFilename();
			filesize = mpf.getSize()/1024;
			if(filename!=null&& !filename.trim().equals("")) {

				tmpFile = new File(uploadTmp+filename); 
				try {
					mpf.transferTo(tmpFile); 			
					orgFile = new File(upload+filename);					
					Files.copy(tmpFile.toPath(), orgFile.toPath(),
							StandardCopyOption.REPLACE_EXISTING);				
				dao.uploadFile(new Attachment("Risk", filename, filename+"(1)", upload, filesize+"KB"));
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("파일 생성 에러:"+e.getMessage());
				} catch (Exception e) {
					System.out.println("기타 에러 :"+e.getMessage());
				}
			}
		} 
	}
	
	public String getUpdated(Risk oldRisk, Risk newRisk) {
				
		StringBuilder sb = new StringBuilder(); 
		
		if (!oldRisk.getSubject().equals(newRisk.getSubject())) {
			sb.append("[제목 변경] \n" + oldRisk.getSubject() + "\n -> " + newRisk.getSubject() + "\n");
		}
		String oldDescription = oldRisk.getDescription();
		if (oldDescription == null) {
			oldDescription = "";
		}
		if (!oldDescription.equals(newRisk.getDescription())) {
			sb.append("[내용 변경] \n" + oldDescription + "\n -> " + newRisk.getDescription() + "\n");
		}
		
		if (!oldRisk.getStatus().equals(newRisk.getStatus())) {
			sb.append("[상태 변경] \n" + oldRisk.getStatus() + "\n -> " + newRisk.getStatus() + "\n");
		}
		Account account = daoA.getAccount(newRisk.getAccount_id());
		if (!oldRisk.getAccount_name().equals(account.getName())) {
			sb.append("[담당자 변경] " + oldRisk.getAccount_name() + " -> " + account.getName() + "\n");
		}
		if (oldRisk.getProbability() != newRisk.getProbability()) {
			sb.append("[발생가능성 변경] \n" + oldRisk.getProbability() + "\n -> " + newRisk.getProbability() + "\n");
		}
		if (oldRisk.getImpact() != newRisk.getImpact()) {
			sb.append("[영향도 변경] \n" + oldRisk.getImpact() + "\n -> " + newRisk.getImpact() + "\n");
		}
		String oldStart = TimeManager.getInstance().datetimeToSimple(oldRisk.getStart_date());
		String oldEnd = TimeManager.getInstance().datetimeToSimple(oldRisk.getEnd_date());
		if (!oldStart.equals(newRisk.getStart_date())) {
			sb.append("[예상시작일자 변경] " + oldStart + " -> " + newRisk.getStart_date() + "\n");
		}
		if (!oldEnd.equals(newRisk.getEnd_date())) {
			sb.append("[예상완료일 변경] " + oldEnd + " -> " + newRisk.getEnd_date() + "\n");
		}
		if (!oldRisk.getStrategy().equals(newRisk.getStrategy())) {
			sb.append("[전략 변경] \n" + oldRisk.getStrategy() + "\n -> " + newRisk.getStrategy() + "\n");
		}
		if (!oldRisk.getTreatment().equals(newRisk.getTreatment())) {
			sb.append("[해결방안 변경] \n" + oldRisk.getTreatment() + "\n -> " + newRisk.getTreatment() + "\n");
		}
		
		ArrayList<Attachment> files = dao.fileInfo(newRisk.getId());
		Attachment oldfile = files.get(0);
		if(oldfile != null) {
			System.out.println(oldfile.getFilename());
		}
		MultipartFile[] newfiles = newRisk.getReport();
		MultipartFile newfile = newfiles[0];
		if(newfile != null) {
			System.out.println(newfile.getOriginalFilename());
		}
		if (!oldfile.getFilename().equals(newfile.getOriginalFilename())) {
			sb.append("[파일 변경] \n" + oldfile.getFilename() + "\n -> " + newfile.getOriginalFilename() + "\n");
		}
		return sb.toString();
	}
	
	public Risk getRisk(int id) {
		Risk risk = dao.getRisk(id);
		String start = TimeManager.getInstance().datetimeToSimple(risk.getStart_date());
		risk.setStart_date(start);
		String end = TimeManager.getInstance().datetimeToSimple(risk.getEnd_date());
		risk.setEnd_date(end);
		
		risk.setFileInfo(dao.fileInfo(id));
		//dao.uptReadCnt(no);
		return risk;
	}
	
	public void updateRisk(Risk upt) {
		
		Risk old = dao.getRisk(upt.getId());
		/*
		ArrayList<Attachment> files = dao.fileInfo(upt.getId());
		Attachment oldfile = files.get(0);
		if(oldfile != null) {
			System.out.println(oldfile.getFilename());
		}
		
		MultipartFile[] newfiles = upt.getReport();
		MultipartFile newfile = newfiles[0];
		if(newfile != null) {
			System.out.println(newfile.getOriginalFilename());
		}*/
		
		String updated = getUpdated(old, upt);
		if(updated != null) {
			if (updated != "") {
				Journal journal = new Journal();
				journal.setDocument_type("risk");
				journal.setDocument_id(upt.getId());
				journal.setAccount_id(upt.getAccount_id());
				journal.setContent(updated);
				dao.insertJournal(journal);
			}
		}
		
		/*
		 * upt.setStart_date(TimeManager.getInstance().datetimeToSimple(upt.
		 * getStart_date()));
		 * upt.setEnd_date(TimeManager.getInstance().datetimeToSimple(upt.getEnd_date())
		 * );
		 */
		
		int id = upt.getId();
		if(upt.getFilenames()!= null &&
				upt.getFilenames().length>0) {
		
			String filename = null;	
			long filesize = 0;
			String orgFilename = null; 
			File tmpFile = null; 
			File orgFile = null; 
			//Attachment uptFile = null;
			MultipartFile mpf = null;
			File pathFile = new File(uploadTmp); // 폴드 객체 생성.
			for(File f:pathFile.listFiles()) {
				System.out.println("삭제할 파일:"+f.getName());
				f.delete();
			}		
			for(int idx=0; idx<upt.getReport().length; idx++) {
				mpf=upt.getReport()[idx]; // 대체할 파일 가져오기
				filename= mpf.getOriginalFilename(); // 대체할 파일명 가져오기.

				orgFilename=upt.getFilenames()[idx]; // 수정할 파일명

				if(filename!=null&&!filename.trim().equals("")) {
					
					tmpFile = new File(uploadTmp+orgFilename);
					if(tmpFile.exists()) {
						tmpFile.delete();
					}
					
					orgFile = new File(upload+orgFilename);
					if(orgFile.exists()) {
						orgFile.delete();
					}
					
					tmpFile = new File(uploadTmp+filename);
					orgFile = new File(upload+filename);
					try {
						mpf.transferTo(tmpFile);
						
						Files.copy(tmpFile.toPath(), orgFile.toPath(),
								StandardCopyOption.REPLACE_EXISTING);
						
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 상태 에러:"+e.getMessage());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 파일 에러:"+e.getMessage());
					} catch(Exception e) {
						System.out.println("# 기타 에러:"+e.getMessage());
					}
					
					HashMap<String, String> hs = new HashMap<String, String>();
					hs.put("document_id", ""+id);
					hs.put("filename", filename);
					hs.put("filesize", filesize+"KB");
					hs.put("disk_filename", "disk_"+filename);
					hs.put("orgFilename", upt.getFilenames()[idx]);
					dao.updateFile(hs);
				}
			}
		}
		
		dao.updateRisk(upt);
	}
	
	public void deleteRisk(int id) {
		dao.deleteRisk(id);
		dao.deleteFile(id);
	}
	public ArrayList<Journal> getJournalList(int id){
		
		return dao.getJournalList(id);
	}
	public void insertJournal(Journal insj) {
		dao.insertJournal(insj);
	}
	
	public ArrayList<Risk> getRecentRiskListByProject(int projectId) {
		ArrayList<Risk> riskList = dao.getRecentRiskListByProject(projectId);
		
		for (Risk risk : riskList) {
			risk.setStart_date(TimeManager.getInstance().datetimeToSimple(risk.getStart_date()));
			risk.setEnd_date(TimeManager.getInstance().datetimeToSimple(risk.getEnd_date()));
		}
		
		return riskList;
	}
	/*
	 * public ArrayList<Comment> getCommentList2(Comment sch){ return
	 * dao.getCommentList2(sch); }
	 */
	
	
}
