package pms.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A19_CommentService;
import pms.z01_vo.Comment;

@Controller
@RequestMapping("comment.do")
public class A19_CommentController {
	@Autowired(required = false)
	private A19_CommentService service;
	
	// http://localhost:7080/projectPMS/comment.do?method=list
	@RequestMapping(params = "method=list")
	public String commentList(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("sch") Comment sch, Model d) {
		return "a12_task\\a05_taskComment";
	}
	// http://localhost:7080/projectPMS/comment.do?method=commentlist
	@RequestMapping(params = "method=commentlist")
	public String CommentList2(@ModelAttribute("comment") Comment comment, Model d) {
		d.addAttribute("commentList2", service.getCommentList2(comment));
		return "a16_risk\\a01_riskComment";
	}
	/*
	// http://localhost:7080/projectPMS/comment.do?method=list2
	@RequestMapping(params = "method=list2")
	public String RiskComment(@ModelAttribute("comment") Comment comment, Model d) {
		System.out.println("id 확인:"+comment.getDocument_id());
		d.addAttribute("riskList", service.getComment(comment.getDocument_id()));
		
		return "a16_risk\\a01_riskComment";
	}*/
	
	@RequestMapping(params = "method=uptForm")
	public String uptForm(@RequestParam("id") int id, Model d) {
		System.out.println("댓글 id@@: "+id);
		d.addAttribute("comment", service.getComment(id));
		return "forward:/comment.do?method=uptForm";
	}
	
	@RequestMapping(params = "method=update")
	public String update(Comment upt) {
		service.updateComment(upt);
		return "forward:/comment.do?method=uptForm";
	}
	
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("comment") Comment comment) {
		return "a16_risk\\a01_riskComment";
	}
	@RequestMapping(params = "method=insert")
	public String insComment(Comment insc, Model d) {
		service.insertComment(insc);
		d.addAttribute("proc", "insc");
		return "a16_risk\\a01_riskComment";
	}
	@RequestMapping(params = "method=delete")
	public String delete(@RequestParam("id") int id) {
		service.deleteComment(id);
		return "a12_task\\a05_taskComment";
	}
	
}
