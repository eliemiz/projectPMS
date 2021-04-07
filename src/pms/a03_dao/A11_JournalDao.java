package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Journal;

@Repository
public interface A11_JournalDao {
	
	public ArrayList<Journal> getJournalList();
	
	public Journal getJournal(int id);
}
