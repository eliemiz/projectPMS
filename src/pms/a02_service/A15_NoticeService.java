package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A15_NoticeDao;
import pms.z01_vo.Notice;

@Service
public class A15_NoticeService {
	@Autowired(required = false)
	private A15_NoticeDao dao;

	public ArrayList<Notice> getNoticeList(Notice sch) {
		return dao.getNoticeList(sch);
	}
	public void insertNotice(Notice ins) {
		dao.insertNotice(ins);
	}
	
	public Notice getNotice(int id) {
		Notice notice = dao.getNotice(id);
		return notice;
	}
}
