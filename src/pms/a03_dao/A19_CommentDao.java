package pms.a03_dao;

import java.util.ArrayList;

import pms.z01_vo.Comment;
import pms.z01_vo.Task;

public interface A19_CommentDao {
	public ArrayList<Comment> getCommentList(Comment sch);
	public Comment getComment(int document_id); // 게시글마다 댓글조회
	public void insComment(Comment ins); // 등록
	public void updateComment(Comment upt); // 수정
	public void deleteComment(int id); // 삭제
}
