package pms.z02_util;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class LocaleManager {
	
	private static final String DEFAULT_LANG = "ko";
	
	
	public static String getLang(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if (session.getAttribute("lang") == null) {
			session.setAttribute("lang", DEFAULT_LANG);
		}
		
		return session.getAttribute("lang").toString();
	}
	
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
}
