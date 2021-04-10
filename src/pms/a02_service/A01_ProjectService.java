package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A01_ProjectDao;
import pms.z01_vo.Project;

@Service
public class A01_ProjectService {

	@Autowired(required = false)
	private A01_ProjectDao dao;

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
	
	public void projectIns(Project insert) {
		
		dao.projectIns(insert);
	}
	public void projectDel(int id) {
		
		dao.projectDel(id);
	}
}
