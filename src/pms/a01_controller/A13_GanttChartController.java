package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A13_GanttChartService;

@Controller
@RequestMapping("gantt.do")
public class A13_GanttChartController {
	@Autowired(required = false)
	private A13_GanttChartService service;
	
	// http://localhost:7080/projectPMS/gantt.do?method=list
	@RequestMapping(params = "method=list")
	public String test() {
		return "a13_ganttChart\\a01_gantt";
	}
}
