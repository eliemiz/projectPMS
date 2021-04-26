package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.TaskResult;

@Repository
public interface A03_ProjectUserDao {

	public ArrayList<TaskResult> getTaskResultByProjectId(int project_id);
	
}
