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

	public ArrayList<JournalEx> getJournalListAll(int project_id) {

		return dao.getJournalListAll(project_id);
	}

	public ArrayList<JournalEx> getJournalListTask(int project_id) {

		return dao.getJournalListTask(project_id);
	}

	public ArrayList<JournalEx> getJournalListRisk(int project_id) {

		return dao.getJournalListRisk(project_id);
	}
	/*
	public ArrayList<JournalEx> getJournalListAlld(JournalSch sch){
		return dao.getJournalListAlld(sch);
	}
	public ArrayList<JournalEx> getJournalListTaskd(JournalSch sch){
		return dao.getJournalListTaskd(sch);
	}
	public ArrayList<JournalEx> getJournalListRiskd(JournalSch sch){
		return dao.getJournalListRiskd(sch);
	}
	*/
}
