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
import pms.z01_vo.AccountTask;
import pms.z02_util.LocaleManager;

@Controller
public class A10_DashboardController {

	@Autowired(required = false)
	private A00_AccountService serviceAccount;

	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model d) {

		// get parameter
		String projectId = request.getParameter("projectId");
		HttpSession session = request.getSession();
		session.setAttribute("projectId", projectId);
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			LocaleManager.setLang(request, response, localeResolver);
		}

		/* Get Model */
		ArrayList<AccountTask> accountList = serviceAccount.getAccountTaskList();
		d.addAttribute("accountList", accountList);

		return "a10_dashboard\\dashboard";
	}
}
