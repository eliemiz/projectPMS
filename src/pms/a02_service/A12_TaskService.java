package pms.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a03_dao.A00_AccountDao;
import pms.a03_dao.A01_ProjectDao;
import pms.a03_dao.A11_JournalDao;
import pms.a03_dao.A12_TaskDao;
import pms.z01_vo.Account;
import pms.z01_vo.Attachment;
import pms.z01_vo.Calendar;
import pms.z01_vo.CalendarSch;
import pms.z01_vo.Comment;
import pms.z01_vo.GanttChart;
import pms.z01_vo.GanttSearch;
import pms.z01_vo.Journal;
import pms.z01_vo.Project;
import pms.z01_vo.Task;
import pms.z01_vo.TaskResult;
import pms.z01_vo.TaskSch;
import pms.z02_util.TimeManager;

@Service
public class A12_TaskService {

	@Autowired(required = false)
	private A12_TaskDao dao;
	@Autowired(required = false)
	private A01_ProjectDao daoP;
	@Autowired(required = false)
	private A00_AccountDao daoA;

	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;

	// task 리스트 조회(검색)
	public ArrayList<Task> taskList(TaskSch sch) {
			
		/* Local 시간으로 변경 */
		ArrayList<Task> taskList = dao.taskList(sch);
		for (Task task : taskList) {
			task.setStart_date(TimeManager.getInstance().isoToSimple(task.getStart_date()));  
			task.setDue_date(TimeManager.getInstance().isoToSimple(task.getDue_date()));  
		}
		
		return taskList;
	}

	// task 조회(id이용)
	public Task getTask(int id) {		
		
		Task task = dao.getTask(id);
		
		/* Local 시간으로 변경 */
		task.setStart_date(TimeManager.getInstance().isoToSimple(task.getStart_date()));  
		task.setDue_date(TimeManager.getInstance().isoToSimple(task.getDue_date()));
		
		task.setFileInfo(dao.fileInfo(id));
		task.setCommentInfo(dao.commentInfo(id));
		// return dao.getTask(id);
		return task;
	}

	// task 등록
	public void insertTask(Task ins) {
		System.out.println("upload:" + upload);
		System.out.println("uploadTmp:" + uploadTmp);
		
		/* iso 시간으로 변경 */
		ins.setStart_date(TimeManager.getInstance().simpleToIso(ins.getStart_date()));
		ins.setDue_date(TimeManager.getInstance().simpleToIso(ins.getDue_date()));
		
		dao.insertTask(ins);

		String filename = null;
		long filesize = 0;
		File tmpFile = null;
		File orgFile = null;
		File pathFile = new File(uploadTmp);
		for (File f : pathFile.listFiles()) {
			System.out.println("삭제할 파일:" + f.getName());
			f.delete();
		}
		for (MultipartFile mpf : ins.getReport()) {
			filename = mpf.getOriginalFilename();
			filesize = mpf.getSize()/1024;
			if (filename != null && !filename.trim().equals("")) {
				tmpFile = new File(uploadTmp + filename);
				try {
					mpf.transferTo(tmpFile);
					orgFile = new File(upload + filename);
					Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);							
					dao.uploadFile(new Attachment("Task",filename, "(1)"+filename, upload, filesize+"KB"));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("#상태 예외 발생:" + e.getMessage());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("#파일 생성 에러:" + e.getMessage());
				} catch (Exception e) {
					System.out.println("#기타 에러:" + e.getMessage());
				}
			}
		}
	}
	
	public String getUpdated(Task oldTask, Task newTask) {

		oldTask.setStart_date(TimeManager.getInstance().simpleToIso(oldTask.getStart_date()));
		
		StringBuilder sb = new StringBuilder(); 
		if (!oldTask.getSubject().equals(newTask.getSubject())) {
			sb.append("[제목 변경] \n" + oldTask.getSubject() + "\n -> " + newTask.getSubject() + "\n");
		}
		if (!oldTask.getDescription().equals(newTask.getDescription())) {
			sb.append("[내용 변경] \n" + oldTask.getDescription() + "\n -> " + newTask.getDescription() + "\n");
		}
		if (!oldTask.getTracker().equals(newTask.getTracker())) {
			sb.append("[유형 변경]" + oldTask.getTracker() + " -> " + newTask.getTracker() + "\n");
		}
		if (!oldTask.getStatus().equals(newTask.getStatus())) {
			sb.append("[상태 변경]" + oldTask.getStatus() + " -> " + newTask.getStatus() + "\n");
		}
		// TODO: newTask.@@ ==> null로 뜸
		Project project = daoP.getProject(newTask.getProject_id());
		if (!oldTask.getProject_name().equals(project.getName())) {
			sb.append("[프로젝트 변경] " + oldTask.getProject_name() + " -> " + project.getName() + "\n");
		}
		Account account = daoA.getAccount(newTask.getAccount_id());
		if (!oldTask.getName().equals(account.getName())) {
			sb.append("[담당자 변경] " + oldTask.getName() + " -> " + account.getName() + "\n");
		}
		if (oldTask.getDone_ratio() != newTask.getDone_ratio()) {
			sb.append("[진행도 변경] " + oldTask.getDone_ratio() + " -> " + newTask.getDone_ratio() + "\n");
		}
		if (oldTask.getStart_date() != newTask.getStart_date()) {
			oldTask.setStart_date(TimeManager.getInstance().isoToSimple(oldTask.getStart_date()));
			sb.append("[시작일자 변경] " + oldTask.getStart_date() + " -> " + newTask.getStart_date() + "\n");
		}
		if (oldTask.getDue_date() != newTask.getDue_date()) {
			oldTask.setDue_date(TimeManager.getInstance().isoToSimple(oldTask.getDue_date()));
			sb.append("[완료기한 변경] " + oldTask.getDue_date() + " -> " + newTask.getDue_date() + "\n");
		}
//		if (oldTask.getAccount_id() != newTask.getAccount_id()) {
//			sb.append("[담당자 변경] " + oldTask.getAccount_id() + " -> " + newTask.getAccount_id() + "\n");
//		}
//		if (oldTask.getProject_id() != newTask.getProject_id()) {
//			sb.append("[프로젝트 변경] " + oldTask.getProject_id() + " -> " + newTask.getProject_id() + "\n");
//		}
		if (oldTask.getPriority() != newTask.getPriority()) {
			sb.append("[우선순위 변경] " + oldTask.getPriority() + " -> " + newTask.getPriority() + "\n");
		}
		if (oldTask.getEstimated() != newTask.getEstimated()) {
			sb.append("[추정시간 변경] " + oldTask.getEstimated() + " -> " + newTask.getEstimated() + "\n");
		}
		
		
		return sb.toString();
	}

	// task 수정
	public void updateTask(Task upt) {
		
		// 1. id로 기존 task 로드
		Task old = dao.getTask(upt.getId());
		String updated = getUpdated(old, upt);
		if (updated != null) {
			if (updated != "") {
				Journal journal = new Journal();
				journal.setDocument_type("task");
				journal.setDocument_id(upt.getId());
				journal.setAccount_id(upt.getAccount_id());
				journal.setContent(updated);
				dao.insertJournal(journal);
			}
		}
		

		/* iso 시간으로 변경 */
		upt.setStart_date(TimeManager.getInstance().simpleToIso(upt.getStart_date()));
		/* 등록 시에 due_date + 1 */
		upt.setDue_date(TimeManager.getInstance().simpleToIso(upt.getDue_date()));
		
		int id = upt.getId();
		if(upt.getFilenames()!=null && upt.getFilenames().length>0) {
			String filename = null;
			long filesize = 0;
			String orgFilename = null;
			File tmpFile = null;
			File orgFile = null;
//			Attachment uptFile = null;
			MultipartFile mpf = null;
			File pathFile = new File(uploadTmp);
			for(File f:pathFile.listFiles()) {
				System.out.println("삭제할 파일:"+f.getName());
				f.delete();
			}
			for(int idx=0;idx<upt.getReport().length;idx++) {
				mpf = upt.getReport()[idx];
				filename = mpf.getOriginalFilename();
				orgFilename = upt.getFilenames()[idx];
				if(filename!=null && !filename.trim().equals("")) {
					tmpFile = new File(uploadTmp+orgFilename);
					if(tmpFile.exists()) {
						tmpFile.delete();
					}
					orgFile = new File(upload+orgFilename);
					if(orgFile.exists()) {
						orgFile.delete();
					}
					tmpFile = new File(uploadTmp+filename);
					orgFile = new File(upload+filename);
					try {
						mpf.transferTo(tmpFile);
						
						Files.copy(tmpFile.toPath(), orgFile.toPath(),
								StandardCopyOption.REPLACE_EXISTING);
						
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 상태 에러"+e.getMessage());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("# 파일 에러:"+e.getMessage());
					} catch(Exception e) {
						System.out.println("# 기타 에러:"+e.getMessage());
					}
					HashMap<String, String> hs = new HashMap<String, String>();
					hs.put("document_id", ""+id);
					hs.put("filename", filename);
					hs.put("filesize", filesize+"KB");
					hs.put("disk_filename", "disk_"+filename);
					hs.put("orgFilename", upt.getFilenames()[idx]);
					dao.updateFile(hs);
				}
			}
		}
		dao.updateTask(upt);
	}

	// task 삭제
	public void deleteTask(int id) {
		dao.deleteTask(id);
		dao.deleteFile(id);
	}
	
	// Journal
	public ArrayList<Journal> getJournalList(int id){
		/* iso 시간으로 변경 */
//		Journal.setCreated_on(TimeManager.getInstance().isoToSimple(Journal.getCreated_on()));
		return dao.getJournalList(id);
	}
	public void insertJournal(Journal insj) {
		dao.insertJournal(insj);
	}
	
	// 댓글 입력
	public void insertComment(Comment insc) {
		dao.insertComment(insc);
	}
	
	
//	// 댓글 조회
//	public ArrayList<Comment> commentInfo(int document_id){
//		dao.commentInfo(document_id);
//		return commentInfo(document_id);
//	}
	
	
	
	

	/* Calendar */
	// Calendar List
	public ArrayList<Calendar> calenList(int projectId) {
		ArrayList<Calendar> list = dao.calenList(projectId);
		for (Calendar c : list) {
			c.setEnd(TimeManager.getInstance().isoPlusDay(c.getEnd()));

			System.out.println("시작시간: " + c.getStart());
			System.out.println("종료시간: " + c.getEnd());
		}
		return list;
	}
	public ArrayList<Calendar> calenSch(CalendarSch sch){
		ArrayList<Calendar> list = dao.calenSch(sch);
		for (Calendar c : list) {
			c.setEnd(TimeManager.getInstance().isoPlusDay(c.getEnd()));

			System.out.println("시작시간: " + c.getStart());
			System.out.println("종료시간: " + c.getEnd());
		}
		return list;
	}

	// Gantt List
	public ArrayList<GanttChart> ganttList(int projectId) {
		ArrayList<GanttChart> list = dao.ganttList(projectId);
		for (GanttChart gc : list) {
			gc.setStart_date(TimeManager.getInstance().isoToGantt(gc.getStart_date()));
			System.out.println("Gantt로 변경: "+gc.getStart_date());
		}
		return list;
	}
	public ArrayList<GanttChart> ganttSch(GanttSearch sch){
		ArrayList<GanttChart> list = dao.ganttSch(sch);
		for (GanttChart gc : list) {
			gc.setStart_date(TimeManager.getInstance().isoToGantt(gc.getStart_date()));
			System.out.println("Gantt로 변경: "+gc.getStart_date());
		}
		return list;
	}
	
	// 산출물 리스트 조회
	public ArrayList<TaskResult> getTaskResult(int projectId) {
		ArrayList<TaskResult> trList = dao.getTaskResult(projectId);
		for(TaskResult tr : trList) {
			tr.setDue_date(TimeManager.getInstance().isoToSimple(tr.getDue_date()));
		}
		
		return trList;
	}

	public ArrayList<Task> getTaskUser(int id){
		
		ArrayList<Task> taskUser = dao.getTaskUser(id);
		
		/* Local 시간으로 변경 */
		for (Task task : taskUser) {
			task.setStart_date(TimeManager.getInstance().isoToSimple(task.getStart_date()));  
			task.setDue_date(TimeManager.getInstance().isoToSimple(task.getDue_date()));
		
		}
		return taskUser;
	}

	/* Line Chart */
	public void getLineChartList(int projectId, ArrayList<String> labels, ArrayList<Double> data1, ArrayList<Double> data2){
		
		/* 업무 목록 로드 */
		ArrayList<Task> taskList = dao.getTaskListByProjectId(projectId);
		if (taskList == null) {
			return;
		} else if (taskList.size() == 0) {
			return;
		}

		/* 시작일, 종료일 검색 */
		Date firstDate = null;
		Date lastDate = null;
		for (Task task : taskList) {
			Date startDate = TimeManager.getInstance().isoToDate(task.getStart_date());
			if (firstDate == null) {
				firstDate = startDate;
			} else if (startDate.before(firstDate)) {
				firstDate = startDate;
			}
			
			Date dueDate = TimeManager.getInstance().isoToDate(task.getDue_date());
			if (lastDate == null) {
				lastDate = dueDate;
			} else if (dueDate.after(lastDate)) {
				lastDate = dueDate;
			}
		}
		
		int count = 0;
		double stack1 = 0.0;
		double stack2 = 0.0;
		ArrayList<Double> arr1 = new ArrayList<Double>();
		ArrayList<Double> arr2 = new ArrayList<Double>();
		
		/* 시작일부터 종료일까지 순회 */
		while(!firstDate.after(lastDate)) {
			labels.add(TimeManager.getInstance().dateToSimple(firstDate));
			
			/* 업무가 해당 범위 내에 있으면 날짜와 진행도 추가 */
			for (Task task : taskList) {
				count++;
				
				Date startDate = TimeManager.getInstance().isoToDate(task.getStart_date());
				Date dueDate = TimeManager.getInstance().isoToDate(task.getDue_date());
				
				stack1 += 100;
				
				if (!firstDate.before(startDate) && !firstDate.after(dueDate)) {
					stack2 += task.getDone_ratio();
				} else {
					stack2 += 100;
				}
			}
			
			arr1.add(stack1);
			arr2.add(stack2);
			
			/* index date 하루 추가 */
			firstDate = new Date(firstDate.getTime() + 1000 * 60 * 60 * 24);
		}
		
		for (double i : arr1) {
			data1.add(i/count);
		}
		
		for (double i : arr2) {
			data2.add(i/count);
		}
	}
}
