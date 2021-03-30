package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A15_NoticeService;

@Controller
@RequestMapping("notice.do")
public class A15_NoticeController {
	@Autowired(required = false)
	private A15_NoticeService service;
	
	// http://localhost:6080/projectPMS/notice.do?method=list
	// http://localhost:7080/projectPMS/notice.do?method=list
	@GetMapping(params="method=list")
	public String NoticeList() {
		return "a15_notice\\a01_notice";
	}
}
