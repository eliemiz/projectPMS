package pms.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a03_dao.A16_RiskDao;
import pms.z01_vo.Risk;

@Service
public class A16_RiskService {
	@Autowired(required = false)
	private A16_RiskDao dao;
	
	public ArrayList<Risk> getRiskList(Risk sch){
		return dao.getRiskList();
	}
	
	public void insertRisk(Risk ins) {
		/*
		System.out.println("upload:"+upload);
		System.out.println("uploadTmp:"+uploadTmp);
		
		dao.insertRisk(ins);
		
		String fname=null;
		File tmpFile = null;
		File orgFile = null; 
		
		File pathFile = new File(uploadTmp); 
		
		for(File f:pathFile.listFiles()) {
			System.out.println("삭제할 파일:"+f.getName());
			f.delete();
		}
		
		for(MultipartFile mpf:insert.getReport()) {
			
			fname = mpf.getOriginalFilename();
			
			if(fname!=null&& !fname.trim().equals("")) {

				
				tmpFile = new File(uploadTmp+fname); 
				try {
					mpf.transferTo(tmpFile); 			
					orgFile = new File(upload+fname);					
					Files.copy(tmpFile.toPath(), orgFile.toPath(),
							StandardCopyOption.REPLACE_EXISTING);				
				dao.uploadFile(new BoardFile(fname, upload,
											insert.getSubject()));
					
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
		} */
		dao.insertRisk(ins);
	}
	
	public Risk getRisk(int id) {
		Risk risk = dao.getRisk(id);
		
		//risk.setFileInfo(dao.fileInfo(no));
		//dao.uptReadCnt(no);
		return risk;
	}
	
	public void updateRisk(Risk upt) {
		/*
		System.out.println("##기존파일 갯수:"+upt.getFnames().length);
		System.out.println("##수정할 파일 갯수:"+
				upt.getReport().length);
		int no = upt.getNo();
		if(upt.getFnames()!= null &&
				upt.getFnames().length>0) {
		
			String fname = null;	
			String orgFname = null; 
			File tmpFile = null; 
			File orgFile = null; 
		
			MultipartFile mpf = null;
			File pathFile = new File(uploadTmp); // 폴드 객체 생성.
			for(File f:pathFile.listFiles()) {
				System.out.println("삭제할 파일:"+f.getName());
				f.delete();
			}		
			for(int idx=0; idx<upt.getReport().length; idx++) {
				mpf=upt.getReport()[idx]; // 대체할 파일 가져오기
				fname= mpf.getOriginalFilename(); // 대체할 파일명 가져오기.

				orgFname=upt.getFnames()[idx]; // 수정할 파일명

				if(fname!=null&&!fname.trim().equals("")) {
					
					tmpFile = new File(uploadTmp+orgFname);
					if(tmpFile.exists()) {
						tmpFile.delete();
					}
					
					orgFile = new File(upload+orgFname);
					if(orgFile.exists()) {
						orgFile.delete();
					}
					
					tmpFile = new File(uploadTmp+fname);
					orgFile = new File(upload+fname);
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
					hs.put("no", ""+no);
					hs.put("fname", fname);
					hs.put("orgFname", upt.getFnames()[idx]);
					dao.updateFile(hs);
				}
			}
		}
		*/
		dao.updateRisk(upt);
	}
	
	public void deleteRisk(int id) {
		dao.deleteRisk(id);
	}
	
	public ArrayList<Risk> getRecentRiskListByProject(int projectId) {
		return dao.getRecentRiskListByProject(projectId);
	}
}
