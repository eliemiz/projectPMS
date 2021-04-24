package pms.a03_dao;
// pms.a03_dao.A16_RiskDao
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Attachment;
import pms.z01_vo.Comment;
import pms.z01_vo.Risk;
import pms.z01_vo.RiskSch;

@Repository
public interface A16_RiskDao {

	//public ArrayList<Risk> getRiskList();

	public ArrayList<Risk> riskList(RiskSch sch);
	
	public Risk getRisk(int id);
	
	public ArrayList<Risk> getRiskList(Risk sch);
	
	public void insertRisk(Risk ins);
	
	public void updateRisk(Risk upt);
	
	public void deleteRisk(int id);
	
	public void uploadFile(Attachment atins); 
	
	public ArrayList<Attachment> fileInfo(int document_id);

	public void updateFile(HashMap<String, String> hs); 
	
	public void deleteFile(int id);	 

	public ArrayList<Risk> getRecentRiskListByProject(int projectId); // 최근 5개 리스크 조회
	
	//public ArrayList<Comment> getCommentList2(Comment sch);
}
