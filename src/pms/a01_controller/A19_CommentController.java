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
	
	@RequestMapping(params = "method=delete")
	public String delete(@RequestParam("id") int id) {
		service.deleteComment(id);
		return "a12_task\\a05_taskComment";
	}
	
}
