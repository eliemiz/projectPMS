package pms.z02_util;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.LocaleResolver;

@Controller
public class LocaleManager {
	
	private static LocaleManager instance = new LocaleManager();
	private String _lang = "ko";
	
	private LocaleManager() {
	}
	
	public static LocaleManager getInstance() {
		return instance;
	}
	
	public String getLang() {
		return _lang;
	}
	
	public void setLang(String lang) {
		_lang = lang;
	}
	
	public void setLocale(HttpServletRequest request, HttpServletResponse response, LocaleResolver localeResolver) {
		Object str = request.getParameter("lang");
		if (str != null) {
			setLang(str.toString());
		}
		Locale locale = new Locale(getLang());
		localeResolver.setLocale(request, response, locale);
	}
}
