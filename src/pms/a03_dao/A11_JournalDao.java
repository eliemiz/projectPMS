package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Journal;
import pms.z01_vo.JournalEx;
import pms.z01_vo.JournalSch;

@Repository
public interface A11_JournalDao {
	
	public void insertJournal(Journal ins); // Journal 등록
	/* public ArrayList<Journal> getJournalList(Journal jr); */
	/*
	public ArrayList<JournalEx> getJournalListAll(JournalSch sch);
	public ArrayList<JournalEx> getJournalListTask(JournalSch sch);
	public ArrayList<JournalEx> getJournalListRisk(JournalSch sch);
	*/
	public ArrayList<JournalEx> getJournalListAll(int project_id);
	public ArrayList<JournalEx> getJournalListTask(int project_id);
	public ArrayList<JournalEx> getJournalListRisk(int project_id);
	
}
