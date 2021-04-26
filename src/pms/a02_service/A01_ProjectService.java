package pms.a02_service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.a03_dao.A01_ProjectDao;
import pms.z01_vo.Account;
import pms.z01_vo.Project;
import pms.z01_vo.ProjectUser;
import pms.z02_util.SessionManager;

@Service
public class A01_ProjectService {

	@Autowired(required = false)
	private A01_ProjectDao dao;
	
	@Autowired(required = false)
	private A00_AccountDao daoAccount;

	public ArrayList<Project> projectList(Project sch){
		if(sch.getName()==null) sch.setName("");
		return dao.projectList(sch);
	}
	public ArrayList<Project> getProjectList() {

		return dao.getProjectList();
	}

	public Project getProject(int id) {

		return dao.getProject(id);
	}
	
	public void projectIns(HttpServletRequest request, Project insert) {
		
		
		dao.projectIns(insert);
		
		int projectId = dao.selectCurrentSeq();
		
		ProjectUser pu = new ProjectUser();
		pu.setProject_id(projectId);
		Account account = SessionManager.getAccount(request);
		pu.setAccount_id(account.getId());
		
		daoAccount.insertProjectUser(pu);
	}
	
}
