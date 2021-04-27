package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A99_CommonDao;
import pms.z01_vo.Language;
import pms.z01_vo.Temp;

@Service
public class A99_CommonService {

	@Autowired(required = false)
	private A99_CommonDao daoTemp;

	public ArrayList<Temp> getTempList() {
		return daoTemp.getTempList();
	}
	
	public ArrayList<Language> languageList(){
		return daoTemp.languageList();
	}
}
