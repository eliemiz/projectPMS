package pms.a03_dao;

import java.util.ArrayList;

import pms.z01_vo.Attachment;

public interface A18_AttachmentDao {
	public ArrayList<Attachment> getAttachmentList(Attachment sch);
	public void insAttachment(Attachment ins); // 등록
	public void updateAttachment(Attachment upt); // 수정
	public void deleteAttachment(int id); // 삭제
}
