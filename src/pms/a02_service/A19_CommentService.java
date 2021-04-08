package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A19_CommentDao;
import pms.z01_vo.Comment;

@Service
public class A19_CommentService {
	@Autowired(required = false)
	private A19_CommentDao dao;
	
	public ArrayList<Comment> getCommentList(Comment sch){
		return dao.getCommentList(sch);
	}
	/*
	// 등록
	public void insComment(Comment ins); {
		dao.insComment(ins);
	}
	*/
	// 수정
	public void updateComment(Comment upt) {
		dao.updateComment(upt);
	}
	// 삭제
	public void deleteComment(int id) {
		dao.deleteComment(id);
	}
}
