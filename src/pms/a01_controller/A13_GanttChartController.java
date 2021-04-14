package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A12_TaskService;

@Controller
@RequestMapping("gantt.do")
public class A13_GanttChartController {
	@Autowired(required = false)
	private A12_TaskService service;
	
	// http://localhost:7080/projectPMS/gantt.do?method=list
	@GetMapping(params = "method=list")
	public String test() {
		return "a13_ganttChart\\a01_gantt";
	}
	
	// http://localhost:7080/projectPMS/gantt.do?method=data
	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("data", service.ganttList());
		return "pageJsonReport";
	}
}
