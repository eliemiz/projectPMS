package pms.a03_dao;
// pms.a03_dao.A15_NoticeDao
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Notice;


@Repository
public interface A15_NoticeDao {

	public ArrayList<Notice> getNoticeList(Notice sch);
	
	public Notice getNotice(int id);
}
