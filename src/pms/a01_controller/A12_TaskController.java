package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A12_TaskService;

@Controller
@RequestMapping("task.do")
public class A12_TaskController {
	@Autowired(required = false)
	private A12_TaskService service;
	
	// http://localhost:7080/projectPMS/task.do?method=list
	@RequestMapping(params = "method=list")
	public String taskList() {
		return "a12_task\\a01_taskList";
	}
}
