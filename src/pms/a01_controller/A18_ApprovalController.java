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

import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.z01_vo.Project;
import pms.z01_vo.Task;
import pms.z01_vo.TaskSch;
import pms.z02_util.SessionManager;

@Controller
public class A18_ApprovalController {
	@Autowired(required = false)
	private A12_TaskService service;
	@Autowired(required = false)
	private A01_ProjectService serviceP;
	@Autowired(required = false)
	private LocaleResolver localeResolver;

	@RequestMapping("approval.do")
	public String approvalList(HttpServletRequest request, HttpServletResponse response, Model d) {
		/* Set Project Id : request에서 projectId가 넘어왔다면 자동으로 세선에 저장해준다. */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		/* Get Project Id : 세션에 값이 없다면, 즉 페이지 진입, 검색 등에 프로젝트 선택한 적이 없을 때 */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceP.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		/* 다른 검색값 가져오기 */
		String status = request.getParameter("status");
		if(status == null || status.trim().equals("")) {
			status = "결재대기";
		}

		/* Get Model */
		// Project Info
		Project project = serviceP.getProject(projectId);
		d.addAttribute("project", project);
		
		TaskSch sch = new TaskSch(projectId, status);
		d.addAttribute("tasklist", service.getTaskList(sch));
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}

		return "a18_approval\\a01_approvalMain";
	}
	
	@RequestMapping(params = "method=accept")
	public String accept(HttpServletRequest request, HttpServletResponse response, Task upt) {
		String proc = request.getParameter("proc");
		if(proc=="accept") {
			upt.setStatus("결재완료");
			System.out.println("승인"+upt.getId());
		} else if(proc.equals("reject")) {
			upt.setStatus("결재반려");
		}
		service.updateStatus(upt);
		return "forward:/approval.do";
	}
}
