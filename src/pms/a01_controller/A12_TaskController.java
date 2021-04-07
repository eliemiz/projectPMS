package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A12_TaskService;
import pms.z01_vo.Task;

@Controller
@RequestMapping("task.do")
public class A12_TaskController {
	@Autowired(required = false)
	private A12_TaskService service;
	
	// http://localhost:7080/projectPMS/task.do?method=list
	@RequestMapping(params = "method=list")
	public String taskList(@ModelAttribute("sch") Task sch, Model d) {
		d.addAttribute("tasklist", service.getTaskList(sch));
		return "a12_task\\a01_taskList";
	}
	// http://localhost:7080/projectPMS/task.do?method=insForm
	@GetMapping(params = "method=insForm")
	public String insForm() {
		return "a12_task\\a02_taskInsert";
	}
	// http://localhost:7080/projectPMS/task.do?method=detail
	@GetMapping(params = "method=detail")
	public String detail() {
		return "a12_task\\a03_taskDetail";
	}	
	// http://localhost:7080/projectPMS/task.do?method=update
	@GetMapping(params = "method=update")
	public String update() {
		return "a12_task\\a04_taskUpdate";
	}	
}
