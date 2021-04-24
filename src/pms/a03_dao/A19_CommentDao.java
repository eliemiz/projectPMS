package pms.a03_dao;

import java.util.ArrayList;

import pms.z01_vo.Comment;


public interface A19_CommentDao {
	public ArrayList<Comment> getCommentList2(Comment comment);
	public ArrayList<Comment> getCommentList(int document_id);
	public Comment getComment(int document_id);
	public void insComment(Comment insc); // 등록
	public void insertComment(Comment insc); // 등록
	public void updateComment(Comment uptc); // 수정
	public void deleteComment(int id); // 삭제
}
