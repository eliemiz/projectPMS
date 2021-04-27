package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A99_CommonService;
import pms.z01_vo.Language;
import pms.z01_vo.Temp;

@Controller
public class A99_CommonController {

	@Autowired(required = false)
	private A99_CommonService serviceCommon;

	// http://localhost:7080/projectPMS/temp.do
	@RequestMapping("temp.do")
	public String temp(Model d) {

		ArrayList<Temp> tempList = serviceCommon.getTempList();
		
		d.addAttribute("tempList", tempList);

		return "a00_common\\temp";
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		
		return "a00_common\\a03_chatting";
	}
	

	@RequestMapping("localize.do")
	public String localize(HttpServletRequest request, Model d){
		
		d.addAttribute("localize", serviceCommon.languageList());
		
		return "pageJsonReport";
	}
}
