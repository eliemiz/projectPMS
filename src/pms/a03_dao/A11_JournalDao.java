package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Journal;

@Repository
public interface A11_JournalDao {
	
	
	public ArrayList<Journal> getJournalList(Journal jr);
	/*
	public ArrayList<Journal> getJournalList1(Journal jr);
	public ArrayList<Journal> getJournalList2(Journal jr);
	public ArrayList<Journal> getJournalList3(Journal jr);
	*/
	
	public Journal getJournal(int id);
}
