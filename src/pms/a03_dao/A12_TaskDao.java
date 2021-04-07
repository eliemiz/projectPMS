package pms.a03_dao;
// pms.a03_dao.A12_TaskDao

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Attachment;
import pms.z01_vo.Task;
import pms.z01_vo.TaskSch;

@Repository
public interface A12_TaskDao {
	public ArrayList<Task> taskList(TaskSch sch);
	
	public void uploadFile(Attachment ins); // 파일업로드
	public Task getTask(int no); // task 조회
	public ArrayList<Attachment> fileInfo(int no); // 파일정보 조회
	public void insertTask(Task insert); // task 등록
	public void updateTask(Task upt); // task 수정
	public void updateFile(HashMap<String, String> hs); // 파일 수정
	public void deleteTask(int no); // task 삭제
	public void deleteFile(int no);	 // 파일 삭제
	
}
