package pms.a03_dao;
// pms.a03_dao.A12_TaskDao

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Attachment;
import pms.z01_vo.Calendar;
import pms.z01_vo.Comment;
import pms.z01_vo.GanttChart;
import pms.z01_vo.GanttSearch;
import pms.z01_vo.Task;
import pms.z01_vo.TaskResult;
import pms.z01_vo.TaskSch;

@Repository
public interface A12_TaskDao {
	public ArrayList<Task> taskList(TaskSch sch);
	public ArrayList<Task> getTaskListByProjectId(int projectId);	// 프로젝트ID로 Task리스트 조회
	public Task getTask(int id); // task 조회
	public ArrayList<Task> getTaskList(Task sch);
	public void insertTask(Task ins); // task 등록
	public void updateTask(Task upt); // task 수정	
	public void deleteTask(int id); // task 삭제
	
	public void uploadFile(Attachment atins); // 파일업로드
	public ArrayList<Attachment> fileInfo(int document_id); // 파일정보 조회
	public void updateFile(HashMap<String, String> hs); // 파일 수정
	public void deleteFile(int id);	 // 파일 삭제
	
	public void insertComment(Comment insc); // 댓글 입력
	public ArrayList<Comment> commentInfo(int document_id); // 댓글 조회
	/*
	public void updateComment(Comment uptc); // 댓글 수정
	public void deleteComment(int id); // 댓글 삭제
	*/
	
	// Calendar DAO
	public ArrayList<Calendar> calenList(int projectId);
	
	// Gantt Chart DAO
	public ArrayList<GanttChart> ganttList(int projectId);
	public ArrayList<GanttChart> ganttSch(GanttSearch sch);
	
	public ArrayList<TaskResult> getTaskResult(int projectId); // 산출물 리스트 조회
	
	public ArrayList<Task> getTaskUser(int id);
}
