package pms.a03_dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Journal;

@Repository
public interface A11_JournalDao {
	
	
	/* public ArrayList<Journal> getJournalList(Journal jr); */
	
	public ArrayList<Journal> getJournalList1(HashMap<String, Object> map);
	public ArrayList<Journal> getJournalList2(HashMap<String, Object> map);
	public ArrayList<Journal> getJournalList3(HashMap<String, Object> map);
	
	
	public Journal getJournal(int id);
}
