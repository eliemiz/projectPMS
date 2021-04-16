package pms.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A12_TaskService;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("gantt.do")
public class A13_GanttChartController {
	@Autowired(required = false)
	private A12_TaskService service;
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/gantt.do?method=list
	@RequestMapping(params = "method=list")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		return "a13_ganttChart\\a01_gantt";
	}
	
	// http://localhost:7080/projectPMS/gantt.do?method=data
	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("list", service.ganttList());
		return "pageJsonReport";
	}
}
