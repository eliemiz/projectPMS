package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A12_TaskDao;
import pms.z01_vo.Task;

@Service
public class A12_TaskService {
	@Autowired(required = false)
	private A12_TaskDao dao;
	public ArrayList<Task> getTaskList(){
		return dao.getTaskList();
	}
	public Task getTask(int task_id) {
		return dao.getTask(task_id);
	}
}

