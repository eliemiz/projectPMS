package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A11_JournalDao;
import pms.z01_vo.JournalEx;
import pms.z01_vo.JournalSch;

@Service
public class A11_ActivityService {

	@Autowired(required = false)
	private A11_JournalDao dao;

	public ArrayList<JournalEx> getJournalListAll(JournalSch sch) {

		return dao.getJournalListAll(sch);
	}

	public ArrayList<JournalEx> getJournalListTask(JournalSch sch) {

		return dao.getJournalListTask(sch);
	}

	public ArrayList<JournalEx> getJournalListRisk(JournalSch sch) {

		return dao.getJournalListRisk(sch);
	}
}
