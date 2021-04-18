package pms.a02_service;

import java.text.SimpleDateFormat;
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
		if(jr.getDocument_type()==null) jr.setDocument_type(""); 
		
		return dao.getJournalList(jr);
	}
	
	
	/*
	public ArrayList<Journal> getJournalList1(Journal jr){
		 if(jr.getDocument_type()==null) jr.setDocument_type(""); 
		return dao.getJournalList1(jr);
	}
	public ArrayList<Journal> getJournalList2(Journal jr){
		if(jr.getDocument_type()==null) jr.setDocument_type(""); 
		return dao.getJournalList2(jr);
	}
	public ArrayList<Journal> getJournalList3(Journal jr){
		if(jr.getDocument_type()==null) jr.setDocument_type(""); 
		return dao.getJournalList3(jr);
	}
	*/
	
	/*
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("document_type",document_type);
	map.put("projectId",projectId);
*/
}
