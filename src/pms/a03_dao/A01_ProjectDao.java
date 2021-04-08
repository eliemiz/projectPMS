package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Project;

@Repository
public interface A01_ProjectDao {
	// 리스트
	public ArrayList<Project> projectList(Project sch);
	public ArrayList<Project> getProjectList();
	public Project getProject(int id);
	// 생성
	public void projectIns(Project insert);
	// 삭제
	public void projectDel(int id);
	//setting
	public void projectUpt(Project upt);
}