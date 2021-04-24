package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A11_JournalDao;
import pms.z01_vo.Journal;

@Service
public class A20_JournalService {
	@Autowired(required = false)
	private A11_JournalDao dao;
	
	public ArrayList<Journal> getJournalList(int document_id){
		return dao.getJournalList(document_id);
	}

}
