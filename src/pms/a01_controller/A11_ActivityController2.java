
/*
package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A11_ActivityService;
import pms.z01_vo.JournalEx;
import pms.z01_vo.JournalSch;
import pms.z01_vo.Project;
import pms.z02_util.SessionManager;

@Controller
public class A11_ActivityController2 {

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
	public String Activity(HttpServletRequest request, HttpServletResponse response, Model d) {

		// Set Project Id
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		// Get Project Id
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}

		// Set Locale
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}

		ArrayList<JournalEx> jList = null;
		String type = request.getParameter("document_type");
		String document_idS = request.getParameter("document_id");
		if (document_idS == null)
			document_idS = "0";

		int document_id = 0;

		try {
			document_id = Integer.parseInt(document_idS);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		if (type == null) {
			// 모든 목록
			if (document_id == 0) {
				JournalSch sch = new JournalSch(projectId);
				jList = service.getJournalListAlld(sch);
			} else {
				JournalSch sch = new JournalSch(projectId, document_id);
				jList = service.getJournalListAll(sch);
			}
		} else {
			if (type.equals("task")) {
				// task만
				if (document_id == 0) {
					JournalSch sch = new JournalSch(projectId);
					jList = service.getJournalListTaskd(sch);
				} else {
					JournalSch sch = new JournalSch(projectId, document_id);
					jList = service.getJournalListTask(sch);
				}
			} else if (type.equals("risk")) {
				// risk만
				if (document_id == 0) {
					JournalSch sch = new JournalSch(projectId);
					jList = service.getJournalListRiskd(sch);
				} else {
					JournalSch sch = new JournalSch(projectId, document_id);
					jList = service.getJournalListRisk(sch);
				}
			} else {
				// 모든 목록
				if (document_id == 0) {
					JournalSch sch = new JournalSch(projectId);
					jList = service.getJournalListAlld(sch);
				} else {
					JournalSch sch = new JournalSch(projectId, document_id);
					jList = service.getJournalListAll(sch);
				}
			}
		}

		System.out.println("type: " + type);
		System.out.println("projectId: " + projectId);
		System.out.println("document_id: " + document_id);
		d.addAttribute("activity", jList);
		d.addAttribute("document_type", type);
		d.addAttribute("document_id", document_id);

		return "a11_activity\\activity";
	}

}
*/