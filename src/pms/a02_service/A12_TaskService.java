package pms.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a03_dao.A12_TaskDao;
import pms.z01_vo.Attachment;
import pms.z01_vo.Calendar;
import pms.z01_vo.GanttChart;
import pms.z01_vo.Task;
import pms.z01_vo.TaskResult;
import pms.z02_util.TimeManager;

@Service
public class A12_TaskService {

	@Autowired(required = false)
	private A12_TaskDao dao;

	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;

	// task 리스트 조회
	public ArrayList<Task> getTaskList(Task sch) {
		// 검색
		if (sch.getSubject() == null)
			sch.setSubject("");
		if (sch.getDescription() == null)
			sch.setDescription("");
		if (sch.getTracker() == null)
			sch.setTracker("");
		if (sch.getStatus() == null)
			sch.setStatus("");
		return dao.getTaskList(sch);
	}

	// task 조회(id이용)
	public Task getTask(int id) {
		Task task = dao.getTask(id);
		 task.setFileInfo(dao.fileInfo(id));
		// return dao.getTask(id);
		return task;
	}

	// task 등록
	public void insertTask(Task ins) {
		System.out.println("upload:" + upload);
		System.out.println("uploadTmp:" + uploadTmp);
		
		ins.setStart_date(TimeManager.getInstance().SimpleToIso(ins.getStart_date()));
		ins.setDue_date(TimeManager.getInstance().SimpleToIso(ins.getDue_date()));
		
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
					/* ToDo: filename이 중복되면 문자열(예-123)을 넣을건데, 중복될 때에만 넣으려면? (if문을 어떻게 써야할까요?) */								
					dao.uploadFile(new Attachment("Task",filename, filename+"123", upload, filesize+"KB"));
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

	// task 수정
	public void updateTask(Task upt) {
		upt.setStart_date(TimeManager.getInstance().SimpleToIso(upt.getStart_date()));
		upt.setDue_date(TimeManager.getInstance().SimpleToIso(upt.getDue_date()));
		int id = upt.getId();
		if(upt.getFilenames()!=null && upt.getFilenames().length>0) {
			String filename = null;
			String orgFilename = null;
			File tmpFile = null;
			File orgFile = null;
			Attachment uptFile = null;
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
					hs.put("id", ""+id);
					hs.put("filename", filename);
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

	// Calendar List
	public ArrayList<Calendar> calenList(int projectId) {
		return dao.calenList(projectId);
	}

	// Gantt List
	public ArrayList<GanttChart> ganttList(int projectId) {
		ArrayList<GanttChart> list = dao.ganttList(projectId);
		for (GanttChart gc : list) {
			/* String > ISO */
			gc.setStart_date(TimeManager.getInstance().SimpleToIso(gc.getStart_date()));
			/* ISO > UTC */
			gc.setStart_date(TimeManager.getInstance().isoToGantt(gc.getStart_date()));
		}
		return list;
	}

	// 산출물 리스트 조회
	public ArrayList<TaskResult> getTaskResult(int projectId) {
		return dao.getTaskResult(projectId);
	}

}
