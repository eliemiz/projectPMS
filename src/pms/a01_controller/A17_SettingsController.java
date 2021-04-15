package pms.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A01_ProjectService;
import pms.a02_service.A17_SettingsService;
import pms.z01_vo.Project;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("settings.do")
public class A17_SettingsController {

	@Autowired(required = false)
	private A17_SettingsService service;
	@Autowired(required = false)
	private A01_ProjectService pservice;
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/settings.do?method=project
	@RequestMapping( params = "method=project")
	public String Project(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("sch")Project sch, Model d) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		d.addAttribute("projectList", pservice.projectList(sch));
		return "a17_settings\\a00_project";
	}
	// http://localhost:7080/projectPMS/settings.do?method=detail
	@RequestMapping(params = "method=detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id, Model d) {
		//System.out.println("id:"+id);
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		d.addAttribute("project", pservice.getProject(id));
		
		return "a17_settings\\a01_update";
	}
	// http://localhost:7080/projectPMS/settings.do?method=update
	@RequestMapping( params = "method=update")
	public String update(HttpServletRequest request, HttpServletResponse response, Project upt) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		service.projectUpt(upt);
		return "forward:/settings.do?method=detail";
	}
	
	// http://localhost:7080/projectPMS/settings.do?method=delete
	   @RequestMapping(params="method=delete")
	   public String delete(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id) {
		   /* Set Locale */
			if (request.getParameter("lang") != null) {
				SessionManager.setLang(request, response, localeResolver);
			}
		   
		   service.projectDel(id);
		   return "a17_settings\\a01_update";
	   }

}
