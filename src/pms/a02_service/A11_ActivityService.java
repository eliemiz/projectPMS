package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A11_JournalDao;
import pms.z01_vo.Journal;

@Service
public class A11_ActivityService {

	@Autowired(required = false)
	private A11_JournalDao dao;
	
	public ArrayList<Journal> getJournalList(Journal jr){
		return dao.getJournalList(jr);
	}
}
