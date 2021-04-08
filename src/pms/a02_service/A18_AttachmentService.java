package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A18_AttachmentDao;
import pms.z01_vo.Attachment;

@Service
public class A18_AttachmentService {
	@Autowired(required = false)
	private A18_AttachmentDao dao;
	
	
	public ArrayList<Attachment> getAttachmentList(Attachment sch){
		return dao.getAttachmentList(sch);
	}
	// 등록
	public void insAttachment(Attachment ins) {
		dao.insAttachment(ins);
	}
	 // 수정
	public void updateAttachment(Attachment upt) {
		dao.updateAttachment(upt);
	}
	 // 삭제
	public void deleteAttachment(int id) {
		dao.deleteAttachment(id);
	}
}
