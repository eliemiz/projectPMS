package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Project;

@Repository
public interface A01_ProjectDao {
	
	public ArrayList<Project> getProjectList();
	
	public Project getProject(int id);
}