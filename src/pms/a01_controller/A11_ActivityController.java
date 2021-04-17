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
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A11_ActivityService;
import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;
import pms.z01_vo.Journal;
import pms.z01_vo.Project;
import pms.z02_util.SessionManager;


@Controller
public class A11_ActivityController {

	@Autowired(required = false)
	private A11_ActivityService service;
	
	@Autowired(required = false) 
	private A01_ProjectService serviceProject;
	
	@Autowired(required = false)
	private A00_AccountService serviceAccount;
	
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	
	// http://localhost:7080/projectPMS/activity.do
	@RequestMapping("activity.do")
	public String Activity(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("jr") Journal jr,
			/* @ModelAttribute("accountId") int accountId, */ Model d) {
		
		/* Set Project Id */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}
		

		/* Get Project Id */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		
		d.addAttribute("activity", service.getJournalList(jr));
		/*
		d.addAttribute("activity", service.getJournalList1(jr));
		d.addAttribute("activity", service.getJournalList2(jr));
		d.addAttribute("activity", service.getJournalList3(jr));
		*/

		return "a11_activity\\activity2";
	}
	
	
}
