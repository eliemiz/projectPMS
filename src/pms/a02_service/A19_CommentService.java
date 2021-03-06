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
	
	public ArrayList<Comment> getCommentList2(Comment comment){		
		return dao.getCommentList2(comment);
	}
	
	public ArrayList<Comment> getCommentList(int document_id){
		ArrayList<Comment> commentList = dao.getCommentList(document_id);
		return commentList;
	}
	
	public Comment getComment(int document_id) {
		Comment comment = dao.getComment(document_id);
		return comment;
	}
	
	// 등록
	public void insComment(Comment insc) {
		dao.insComment(insc);
	}
	public void insertComment(Comment insc) {
		dao.insertComment(insc);
	}
	
		
	// 수정
	public void updateComment(Comment uptc) {
		dao.updateComment(uptc);
	}
	// 삭제
	public void deleteComment(int id) {
		dao.deleteComment(id);
	}
}
