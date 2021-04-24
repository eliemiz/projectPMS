<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>RiskDetail</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<style type="text/css">

</style>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="dist/js/pages/dashboard.js"></script> -->  
<script type="text/javascript">
	var proc = "${proc}";
	if(proc=="insc"){
		  $("[name=content]").val("");
		  alert("등록 완료");
		  location.href="${path}/comment.do?method=commentlist";
	}
	$(document).ready(function(){
		$("#insBut").on("click",function(){	
			if($("[name=project_id]").val()==""){
				alert("프로젝트를 선택하세요.");
				return false;	
			}
			$("form").submit();
		});
	});
</script>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<form:form 
		modelAttribute="comment" 
     	action="${path}/comment.do?method=insert" 
     	enctype="multipart/form-data"
     	method="post">
  <div class="container">
  		<form:hidden path="id"/>
  		<form:hidden path="account_id"/>
  		<form:hidden path="document_id"/>
  		<form:hidden path="document_type"/>
		<br><br>
		<div>
			<div>
			 <span><strong>Comments</strong></span> <span id="cCnt"></span>
				 </div>
				   <div>
				     <table class="table">                    
				        <tr>
				         <td>
				          <form:textarea path="content" style="width: 1100px" rows="3" cols="30" placeholder="댓글을 입력하세요"/>
				          <br>
				           <div>
				            <button type="button" id="insBut" class="btn btn-primary float-right">등록</button>
				           </div>
				          </td>
				          </tr>
				           </table>
				         </div>
				        </div>
				        <%-- <input type="hidden" id="b_code" name="b_code" value="${result.code }" /> --%>        
				    
				</div>
				</form:form> 
                <div class="post">
                	<c:forEach var="comment2" items="${commentList2}">
                	<%-- <form:hidden path="id"/>
                	<form:hidden path="document_type"/> --%>
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          ${comment2.account_id}
                        </span>
                        <span class="description">${comment2.updated_on}</span> <!--Shared publicly - 7:45 PM today -->
                      </div>
                      <!-- /.user-block -->
                      <p>
                       ${comment2.content} 
                      </p>
                    </c:forEach>
                </div>
                
</body>
</html>
