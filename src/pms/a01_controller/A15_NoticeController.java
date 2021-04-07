package pms.a01_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A15_NoticeService;
import pms.z01_vo.Notice;

@Controller
@RequestMapping("notice.do")
public class A15_NoticeController {
	@Autowired(required = false)
	private A15_NoticeService service;
	
	// http://localhost:6080/projectPMS/notice.do?method=list
	// http://localhost:7080/projectPMS/notice.do?method=list
	@RequestMapping
	public String Notice_list(@ModelAttribute("sch") Notice sch, Model d) {
		
		d.addAttribute("noticeList", service.getNoticeList(sch));
		
		return "a15_notice\\a01_notice";
	}
	/*
	@GetMapping(params="method=list")
	public String NoticeList(Model d) {
		ArrayList<Notice> noticeList = service.getNoticeList();
		
		d.addAttribute("noticeList", noticeList);
		return "a15_notice\\a01_notice";
	}*/
	// http://localhost:6080/projectPMS/notice.do?method=insert
	// http://localhost:7080/projectPMS/notice.do?method=insert
	@GetMapping(params="method=insert")
	public String NoticeInsert() {
		return "a15_notice\\a01_noticeInsert";
	}
	// http://localhost:6080/projectPMS/notice.do?method=detail
	// http://localhost:7080/projectPMS/notice.do?method=detail
	@GetMapping(params="method=detail")
	public String NoticeDetail() {
		return "a15_notice\\a01_noticeDetail";
	}
	// http://localhost:6080/projectPMS/notice.do?method=update
	// http://localhost:7080/projectPMS/notice.do?method=update
	@GetMapping(params="method=update")
	public String NoticeUpdate() {
		return "a15_notice\\a01_noticeUpdate";
	}
}
