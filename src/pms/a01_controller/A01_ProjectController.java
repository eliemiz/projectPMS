package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A01_ProjectService;
import pms.z01_vo.Project;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("project.do")
public class A01_ProjectController {
	
	@Autowired(required = false)
	private A01_ProjectService service;
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/project.do
	@RequestMapping
	public String projectList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("sch")Project sch, Model d) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		d.addAttribute("projectList", service.projectList(sch));		
		return "a01_project\\a00_projects";
	}

	// http://localhost:7080/projectPMS/project.do?method=insForm
		@RequestMapping(params = "method=insForm")
		public String insForm(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("project") Project p) {
			/* Set Locale */
			if (request.getParameter("lang") != null) {
				SessionManager.setLang(request, response, localeResolver);
			}
			
			return "a01_project\\a03_projectIns";
		}
	// http://localhost:7080/projectPMS/project.do?method=insert
	@RequestMapping(params = "method=insert")
	public String projectIns(HttpServletRequest request, HttpServletResponse response, Project insert, Model d) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		service.projectIns(request, insert);		
		d.addAttribute("proc", "insert");		
		return "a01_project\\a03_projectIns";
	}
	
	

	
}
