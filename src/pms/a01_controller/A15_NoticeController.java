package pms.a01_controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A15_NoticeService;
import pms.z01_vo.Account;
import pms.z01_vo.Notice;


@Controller
@RequestMapping("notice.do")
public class A15_NoticeController {
	@Autowired(required = false)
	private A15_NoticeService service;
	@Autowired(required = false)
	private A00_AccountService service2;
	
	// http://localhost:6080/projectPMS/notice.do?method=list
	// http://localhost:7080/projectPMS/notice.do?method=list
	@RequestMapping(params="method=list")
	public String Notice_list(@ModelAttribute("sch") Notice sch, Model d) {
		d.addAttribute("noticeList", service.getNoticeList(sch));
		return "a15_notice\\a01_notice";
	}
	// http://localhost:6080/projectPMS/notice.do?method=insForm
	// http://localhost:7080/projectPMS/notice.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("notice") Notice notice) {
		return "a15_notice\\a01_noticeInsert";
	}
	// http://localhost:6080/projectPMS/notice.do?method=insert
	// http://localhost:7080/projectPMS/notice.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertNotice(Notice ins, Model d) {
		service.insertNotice(ins);
		d.addAttribute("proc", "ins");
		return "a15_notice\\a01_noticeInsert";
	}
	// http://localhost:6080/projectPMS/notice.do?method=detail
	// http://localhost:7080/projectPMS/notice.do?method=detail
	@RequestMapping(params="method=detail")
	public String NoticeDetail(@RequestParam("id") int id, Model d) {
		System.out.println("id체크:"+id);
		d.addAttribute("notice", service.getNotice(id));
		return "a15_notice\\a01_noticeDetail";
	}
	// http://localhost:6080/projectPMS/notice.do?method=update
	// http://localhost:7080/projectPMS/notice.do?method=update
	@GetMapping(params="method=update")
	public String NoticeUpdate() {
		return "a15_notice\\a01_noticeUpdate";
	}
	
	@ModelAttribute("accounts")
	public ArrayList<Account> getAccountList(){
		return service2.getAccountList();
	}
}
