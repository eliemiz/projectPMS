package pms.z02_util;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A01_ProjectService;
import pms.z01_vo.Account;
import pms.z01_vo.Project;

@Controller
public class SessionManager {
	
	private static final String DEFAULT_LANG = "ko";
	
	/* Get Lang */
	public static String getLang(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session.getAttribute("lang") == null) {
			session.setAttribute("lang", DEFAULT_LANG);
		}
		
		return session.getAttribute("lang").toString();
	}
	
	/* Set Lang */
	public static void setLang(HttpServletRequest request, HttpServletResponse response, LocaleResolver localeResolver) {
		String lang = request.getParameter("lang");
		if (lang == null) {
			lang = DEFAULT_LANG;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("lang", lang);
		
		Locale locale = new Locale(session.getAttribute("lang").toString());
		localeResolver.setLocale(request, response, locale);
	}
	
	/* Get Account */
	public static Account getAccount(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Object accountObj = session.getAttribute("account");
		if (accountObj == null) {
			return null;
		}
		
		return (Account)accountObj;
	}
	
	/* Set Account */
	public static void setAccount(HttpServletRequest request, Account account) {
		
		HttpSession session = request.getSession();
		session.setAttribute("account", account);
	}
	
	/* Get ProjectId */
	public static int getProjectId(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Object projectIdObj = session.getAttribute("projectId");
		
		return Integer.parseInt(projectIdObj.toString());
	}
	
	/* Set ProjectId */
	public static void setProjectId(HttpServletRequest request, int projectId) {
		
		HttpSession session = request.getSession();
		session.setAttribute("projectId", projectId);
	}
}
