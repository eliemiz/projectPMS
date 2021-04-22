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

import pms.a03_dao.A16_RiskDao;
import pms.z01_vo.Attachment;
import pms.z01_vo.Risk;
import pms.z02_util.TimeManager;

@Service
public class A16_RiskService {
	@Autowired(required = false)
	private A16_RiskDao dao;
	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;
	
	public ArrayList<Risk> getRiskList(Risk sch){
		
		
		return dao.getRiskList(sch);
	}
	
	public void insertRisk(Risk ins) {
		System.out.println("upload:"+upload);
		System.out.println("uploadTmp:"+uploadTmp);
		
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
	
	public Risk getRisk(int id) {
		Risk risk = dao.getRisk(id);
	
		risk.setFileInfo(dao.fileInfo(id));
		//dao.uptReadCnt(no);
		return risk;
	}
	
	public void updateRisk(Risk upt) {
		
	
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
	
	public ArrayList<Risk> getRecentRiskListByProject(int projectId) {
		ArrayList<Risk> riskList = dao.getRecentRiskListByProject(projectId);
		
		for (Risk risk : riskList) {
			risk.setStart_date(TimeManager.getInstance().datetimeToSimple(risk.getStart_date()));
			risk.setEnd_date(TimeManager.getInstance().datetimeToSimple(risk.getEnd_date()));
		}
		
		return riskList;
	}
}
