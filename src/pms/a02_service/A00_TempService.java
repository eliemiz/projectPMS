package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_TempDao;
import pms.z01_vo.Temp;

@Service
public class A00_TempService {

	@Autowired(required = false)
	private A00_TempDao daoTemp;

	public ArrayList<Temp> getTempList() {
		return daoTemp.getTempList();
	}
}
