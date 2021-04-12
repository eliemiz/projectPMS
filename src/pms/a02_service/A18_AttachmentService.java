package pms.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a03_dao.A18_AttachmentDao;
import pms.z01_vo.Attachment;

@Service
public class A18_AttachmentService {
	@Autowired(required = false)
	private A18_AttachmentDao dao;
	
	/*
	 * @Value("${upload}") private String upload;
	 * 
	 * @Value("${uploadTmp}") private String uploadTmp;
	 */
	
	
	public ArrayList<Attachment> getAttachmentList(){
		return dao.getAttachmentList();
	}
	/*
	// 등록
	public void insAttachment(Attachment ins) {
		System.out.println("upload:"+upload);
		System.out.println("uploadTmp:"+uploadTmp);
		dao.insAttachment(ins);
		String filename = null;
		File tmpFile = null;
		File orgFile = null;
		File pathFile = new File(uploadTmp);
		for(File f:pathFile.listFiles()) {
			System.out.println("삭제할 파일:"+f.getName());
			f.delete();
		}
		for(MultipartFile mpf:ins.getReport()) {
			filename = mpf.getOriginalFilename();
			if(filename!=null&& !filename.trim().equals("")) {
				tmpFile = new File(uploadTmp+filename);
				try {
					mpf.transferTo(tmpFile);
					orgFile = new File(upload+filename);
					Files.copy(tmpFile.toPath(), orgFile.toPath(),
							StandardCopyOption.REPLACE_EXISTING);
					dao.insAttachment(new Attachment(filename, upload, ins.getSubject()));
				catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("#상태 예외 발생:"+e.getMessage());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("#파일 생성 에러:"+e.getMessage());
				} catch(Exception e) {
					System.out.println("#기타 에러:"+e.getMessage());
				}
			}
		}
	}
	*/
	 // 수정
	public void updateAttachment(Attachment upt) {
		dao.updateAttachment(upt);
	}
	 // 삭제
	public void deleteAttachment(int id) {
		dao.deleteAttachment(id);
	}
}
