<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 	$("#CinsBtn").click(function(){
// 		$.ajax({
// 			url:"/commentIn.do",
// 			type:"POST",
// 			data:{
<%-- 				num:'<%=vo.getB_sq()%>', --%>
// 				content:$("#cmtCnt").val()
// 			},
// 			success:function(){
// 				console.log("보내기 성공");
// 				location.reload()
// 			},
// 		});
//	});
</script>
<script type="text/javascript">
	var proc = "${proc}";
	if(proc=="ins"){
		alert("댓글 등록 완료\n리스트로 이동합니다.");
		location.href = "${path}\comment.do?method=list";
	}
	$(document).ready(function(){
		$("#CinsBtn").on("click",function(){
			
			$("form").submit();
		});
	});
</script>
</head>
<body>
<div class="card-body">

 	<form class="form-horizontal" method="post"> 
		<div class="comment-txt">
			<i class="far fa-comment-dots"></i>&nbsp;&nbsp;이력입력
			<input class="form-control" placeholder="이력을 작성해주세요" id="cmtCnt" name="content">&nbsp;
			<input type = "button" id="CinsBtn" class="btn btn-success" value="등록"/>&nbsp;
            <input type = "button" id="CBtn" class="btn btn-danger" value="취소"/>            
        </div><br>
    </form> 
    <div class="card-body repliesDiv">
    <!-- 이력 목록 출력 -->
    	<c:forEach var="journal" items="journal">
    	${journal.content}&nbsp;&nbsp;${journal.created_on}
    	</c:forEach>
    </div>         
                
<!--                 <div align="center">2021-04-03</div> -->
<!--               	<div class="form-group" style="width:700px;"><br> -->
<!--               		<div class="form control" id="round1" style="padding:10px; background-Color:lightgreen; float:right;"> -->
<!--               		김철수&nbsp;&nbsp;팀장<br>수정사항 확인 바랍니다 -->
<!--               		</div><br><br><br> -->
<!--               		<div class="form control" id="round1" style="padding:10px; background-Color:lightpink; float:left;"> -->
<!--               		홍길동&nbsp;&nbsp;사원<br>확인했습니다 -->
<!--               		</div> -->
<%--               		<c:foreach var="comment" items="${commentinfo}"> --%>
<!--               		<div class="form control" id="round1" style="padding:10px; background-Color:lightgreen; float:right;"> -->
<%-- 	              		<span name="content" value="${conmeents.content}"></span> --%>
<%-- 	              		<span name="account_id" value="${conmeents.account_id}"></span> --%>
<%-- 	              		<span name="created_on" value="${conmeents.created_on}"></span> --%>
<!--               		</div><br> -->
<%--               		</c:foreach> --%>
<!--               	</div> -->

 </div>
</body>
</html>