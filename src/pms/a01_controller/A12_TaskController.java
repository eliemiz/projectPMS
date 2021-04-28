package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.a02_service.A18_AttachmentService;
import pms.a02_service.A19_CommentService;
import pms.a02_service.A20_JournalService;
import pms.z01_vo.Account;
import pms.z01_vo.Comment;
import pms.z01_vo.Journal;
import pms.z01_vo.Project;
import pms.z01_vo.Task;
import pms.z01_vo.TaskSch;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("task.do")
public class A12_TaskController {
	@Autowired(required = false)
	private A12_TaskService service;
	@Autowired(required = false)
	private A01_ProjectService serviceP;
	@Autowired(required = false)
	private A00_AccountService serviceA;
	@Autowired(required = false)
	private A18_AttachmentService serviceT;
	@Autowired(required=false)
	private A19_CommentService serviceC;
	@Autowired(required=false)
	private A20_JournalService serviceJ;
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	
	// http://localhost:7080/projectPMS/task.do?method=list
	@RequestMapping(params = "method=list")
	public String taskList(HttpServletRequest request, HttpServletResponse response, Model d) {
		/* Set Project Id : request에서 projectId가 넘어왔다면 자동으로 세선에 저장해준다. */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		/* Get Project Id : 세션에 값이 없다면, 즉 페이지 진입, 검색 등에 프로젝트 선택한 적이 없을 때 */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceP.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		/* 다른 검색값 가져오기 */
		String subject = request.getParameter("subject");
		if (subject == null || subject.trim().equals("")) {
			subject = "";
		}
		String tracker = request.getParameter("tracker");
		if(tracker == null || tracker.trim().equals("")) {
			tracker = "";
		}
		String status = request.getParameter("status");
		if(status == null || status.trim().equals("")) {
			status = "";
		}
		String writer = request.getParameter("writer");
		if(writer == null || writer.trim().equals("")) {
			writer = "";
		}
		System.out.println(projectId + ", " + subject + ", " + tracker + ", " + status + ", " + writer);
		
		/* Get Model */
		// Project Info
		Project project = serviceP.getProject(projectId);
		d.addAttribute("project", project);
		
		TaskSch sch = new TaskSch(projectId, subject, tracker, status, writer);
		d.addAttribute("tasklist", service.taskList(sch));
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		return "a12_task\\a01_taskList";
	}
		
	// http://localhost:7080/projectPMS/task.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("task") Task task) {
		/* Set Project Id : request에서 projectId가 넘어왔다면 자동으로 세선에 저장해준다. */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		/* Get Project Id : 세션에 값이 없다면, 즉 페이지 진입, 검색 등에 프로젝트 선택한 적이 없을 때 */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceP.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		return "a12_task\\a02_taskInsert";
	}

	// http://localhost:7080/projectPMS/task.do?method=insert
	@RequestMapping(params = "method=insert")
	public String insertTask(Task ins, Model d) {
		System.out.println("등록:" + ins.getSubject());		
		System.out.println("파일:"+ins.getReport()[0].getOriginalFilename()); 
		service.insertTask(ins);
		
		d.addAttribute("proc", "ins");
	
		return "a12_task\\a02_taskInsert";
	}
	
	// http://localhost:7080/projectPMS/task.do?method=detail
	@RequestMapping(params = "method=detail")
	public String detail(@ModelAttribute("task") Task task, Model d) {
		System.out.println("id:"+task.getId());
		d.addAttribute("task", service.getTask(task.getId()));
		d.addAttribute("journals", service.getJournalList(task.getId()));
		return "a12_task\\a03_taskDetail";
	}
	
	// http://localhost:7080/projectPMS/task.do?method=uptForm
	@RequestMapping(params = "method=uptForm")
	public String uptForm(@RequestParam("id") int id, Model d) {
		System.out.println("id@@: "+id);
		d.addAttribute("task", service.getTask(id));
		
		return "a12_task\\a04_taskUpdate";
	}
	
	// http://localhost:7080/projectPMS/task.do?method=update
	@RequestMapping(params = "method=update")
	public String update(Task upt) {
		service.updateTask(upt);		
		return "forward:/task.do?method=uptForm";
	}
	
	// http://localhost:7080/projectPMS/task.do?method=delete
	@RequestMapping(params = "method=delete")
	public String delete(@RequestParam("id") int id) {
		service.deleteTask(id);
		return "a12_task\\a04_taskUpdate";
	}
	
	// 파일 다운로드
	// http://localhost:7080/projectPMS/task.do?method=download&filename=파일명
	@RequestMapping(params="method=download")
	public String download(@RequestParam("filename") String filename, Model d) {
		System.out.println("파일명:"+filename);
		d.addAttribute("downloadFile", filename); 
		return "downloadviewer";
	}
	
	
	@ModelAttribute("projects")
	public ArrayList<Project> getProjectList(){
		return serviceP.getProjectList();
	}
	@ModelAttribute("accounts")
	public ArrayList<Account> getAccountList(){
		return serviceA.getAccountList();
	}

	/*
	@ModelAttribute("attachments")
	public ArrayList<Attachment> getAttachmentList(){
		return serviceT.getAttachmentList();
	}
	
	*/
}
