package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A01_ProjectDao;
import pms.a03_dao.A12_TaskDao;
import pms.z01_vo.Project;
import pms.z01_vo.Task;

@Service
public class A12_TaskService {

	@Autowired(required = false)
	private A12_TaskDao dao;

	/*
	 @Value("${upload}") 
	 private String upload;	  
	 @Value("${uploadTmp}") 
	 private String uploadTmp;
	 */
	// task 리스트 조회
	public ArrayList<Task> getTaskList(Task sch) {
		return dao.getTaskList(sch);
	}

	// task 조회(id이용)
	public Task getTask(int task_id) {

		return dao.getTask(task_id);
	}

	// task 등록
	public void insertTask(Task ins) {
		dao.insertTask(ins);
	}

	// task 수정
	public void updateTask(Task upt) {
		dao.updateTask(upt);
	}

	// task 삭제
	public void deleteTask(int task_id) {
		dao.deleteTask(task_id);
		dao.deleteFile(task_id);
	}

}
