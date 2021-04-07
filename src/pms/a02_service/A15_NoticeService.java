package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A15_NoticeDao;
import pms.z01_vo.Notice;

@Service
public class A15_NoticeService {
	@Autowired(required = false)
	private A15_NoticeDao daoNotice;

	public ArrayList<Notice> getNoticeList(Notice sch) {
		return daoNotice.getNoticeList(sch);
	}
}
