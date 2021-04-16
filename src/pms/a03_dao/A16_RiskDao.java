package pms.a03_dao;
// pms.a03_dao.A16_RiskDao
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Risk;
import pms.z01_vo.RiskSch;

@Repository
public interface A16_RiskDao {

	public ArrayList<Risk> getRiskList();

	public ArrayList<Risk> riskList(RiskSch sch);
	
	public Risk getRisk(int id);
	
	public void insertRisk(Risk ins);
	
	public void updateRisk(Risk upt);
	
	public void deleteRisk(int id);

	public ArrayList<Risk> getRecentRiskListByProject(int projectId); // 최근 5개 리스크 조회
}
