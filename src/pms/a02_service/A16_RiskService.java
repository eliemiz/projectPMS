package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A16_RiskDao;
import pms.z01_vo.Risk;

@Service
public class A16_RiskService {
	@Autowired(required = false)
	private A16_RiskDao dao;
	
	public ArrayList<Risk> getRiskList(Risk sch){
		return dao.getRiskList();
	}
	
	public void insertRisk(Risk ins) {
		dao.insertRisk(ins);
	}
	
	public Risk getRisk(int id) {
		Risk risk = dao.getRisk(id);
		return risk;
	}
	
	public void updateRisk(Risk upt) {
		dao.updateRisk(upt);
	}
	
	public void deleteRisk(int id) {
		dao.deleteRisk(id);
	}
	
	public ArrayList<Risk> getRecentRiskListByProject(int projectId) {
		return dao.getRecentRiskListByProject(projectId);
	}
}
