package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.a02_service.A18_AttachmentService;
import pms.z01_vo.Account;
import pms.z01_vo.Attachment;
import pms.z01_vo.Project;
import pms.z01_vo.Task;

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
	/*
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	*/
	
	
	// http://localhost:7080/projectPMS/task.do?method=list
	@RequestMapping(params = "method=list")
	public String taskList(@ModelAttribute("sch") Task sch, Model d) {
		d.addAttribute("tasklist", service.getTaskList(sch));
		return "a12_task\\a01_taskList";
	}
	/*
	public String taskList(HttpServletRequest request, HttpServletResponse response, Model d) {

		// Set Locale 
		if (request.getParameter("lang") != null) {
			LocaleManager.setLang(request, response, localeResolver);
		}
	}
	*/
		
	// http://localhost:7080/projectPMS/task.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("task") Task task) {
		return "a12_task\\a02_taskInsert";
	}

	// http://localhost:7080/projectPMS/task.do?method=insert
	@RequestMapping(params = "method=insert")
	public String insertTask(Task ins, Model d) {
		System.out.println("등록:" + ins.getSubject());		
		System.out.println("파일:"+ins.getReport()[0].getOriginalFilename()); 
		service.insertTask(ins);
		d.addAttribute("proc", "ins");
	//	Attachment t = new Attachment();
	//	t.set document_type = "task";
		
	//	serviceT.insertAttachment(t);
		return "a12_task\\a02_taskInsert";
	}
	
	// http://localhost:7080/projectPMS/task.do?method=detail
	@RequestMapping(params = "method=detail")
	public String detail(@ModelAttribute("task") Task task, Model d) {
		System.out.println("id:"+task.getId());
		d.addAttribute("task", service.getTask(task.getId()));
		
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
	
	// 화면단 클릭시 다운로드
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
