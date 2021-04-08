package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.z01_vo.Account;
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

	// http://localhost:7080/projectPMS/task.do?method=list
	@RequestMapping(params = "method=list")
	public String taskList(@ModelAttribute("sch") Task sch, Model d) {
		d.addAttribute("tasklist", service.getTaskList(sch));
		return "a12_task\\a01_taskList";
	}

	// http://localhost:7080/projectPMS/task.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("task") Task task) {
		return "a12_task\\a02_taskInsert";
	}

	// http://localhost:7080/projectPMS/task.do?method=insert
	@RequestMapping(params = "method=insert")
	public String insertTask(Task ins, Model d) {
		System.out.println("등록:" + ins.getSubject());
		service.insertTask(ins);
		d.addAttribute("proc", "ins");

		return "a12_task\\a02_taskInsert";
	}

	// http://localhost:7080/projectPMS/task.do?method=detail
	@RequestMapping(params = "method=detail")
	public String detail() {
		return "a12_task\\a03_taskDetail";
	}

	// http://localhost:7080/projectPMS/task.do?method=update
	@RequestMapping(params = "method=update")
	public String update() {
		return "a12_task\\a04_taskUpdate";
	}
	
	@ModelAttribute("projects")
	public ArrayList<Project> getProjectList(){
		return serviceP.getProjectList();
	}
	@ModelAttribute("accounts")
	public ArrayList<Account> getAccountList(){
		return serviceA.getAccountList();
	}
	
}
