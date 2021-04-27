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
  <title>AdminLTE 3 | Dashboard</title>
  <style>
  #round1 {border-radius : 20px;}
  </style>
 <!-- pace-progress -->
  <link rel="stylesheet" href="plugins/pace-progress/themes/black/pace-theme-flat-top.css">
 
   <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="plugins/dropzone/min/dropzone.min.css">
 
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
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="dist/font/fonts.css"/>
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
#download:hover{
	color: #3e2cff;
	cursor:pointer;
	font-weight:bold;
}
</style>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">

// 	var proc = "${proc}";
// 	var id = $(this).attr("id");
// 	if(proc=="ins"){
// 		alert("댓글 등록 완료\n업무 상세 페이지로 이동합니다.")
// 		location.href="${path}/task.do?method=detail&id="+id;
// 	}
	$(document).ready(function(){
		$("#sm-dashboard").addClass("menu-open");
		$("#sb-task").addClass("active");
		$("#sb-task").addClass("active");
		$("#list").click(function(){
			location.href="${path}/task.do?method=list";
		});
		$("#fileInfo").click(function(){
			var filename=$(this).text();
			if(confirm("다운로드하시겠습니까?\n"+filename)){
				$(location).attr("href","${path}/task.do?method=download&filename="+filename);
			}
		});
		
//  		$("#CinsBtn").on("click",function(){
//  			$("#comment").submit();
//  		});
//  		$("#CBtn").on("click",function(){
//  			location.href="${path}/task.do?method=detail&id="+id;
//  		});
		
		$("#uptFrm").click(function(){
/* 			var projcet_id = $("[name=project_id]").val();
			var status = $("[name=status]").val();
			var tracker = $("#tracker").val();
			var parent_id = $("[name=parent_id]").val();
			var subject = $("[name=subject]").val();
			var description = $("[name=description]").val();
			var priority = $("[name=priority]").val();
			var account_id = $("[name=account_id]").val();
			var start_date = $("[name=start_date]").val();
			var done_ratio = $("[name=done_ratio]").val();
			var due_date = $("[name=due_date]").val();
			var estimated = $("[name=estimated]").val();
			alert("projcet_id "+projcet_id);
			alert("status "+status);
			alert("tracker "+tracker);
			alert("parent_id "+parent_id);
			alert("subject "+subject);
			alert("description "+description);
			alert("priority "+priority);
			alert("account_id "+account_id);
			alert("start_date "+start_date);
			alert("done_ratio "+done_ratio);
			alert("due_date "+due_date);
			alert("estimated "+estimated);	 */
			var accId = "${account.id}";
			var accAuth = "${account.auth}";
			var writer = $("[name=account_id]").val();
			if(accId==writer || accAuth=='Manager'){
				if(confirm("수정하시겠습니까?")){
					$("form").attr("action","${path}/task.do?method=uptForm");
					$("form").submit();
				}
			} else {
				alert("수정 권한이 없습니다.\n작성자 혹은 PM만 수정이 가능합니다.");
			}
			
		});
		
		$("#childTask").click(function(){
			if(confirm("하위 업무를 등록하시겠습니까?")){
				// 하위 업무 등록을 위한 데이터 처리
				$("[name=parent_id]").val($("[name=id]").val());
				$("[name=subject]").val("");
				$("[name=description]").val("\n\n\n\n\n\n\n\n====== 상위 업무 내용 =====\n"+$("[name=description]").val());				
				$("form").attr("action","${path}/task.do?method=insForm");
				$("form").submit();
			}
		});
	});
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
<!-- Navbar -->
  <jsp:include page="../a00_common/a00_header.jsp"/>

  <!-- Main Sidebar Container -->
  <jsp:include page="../a00_common/a01_sidebar.jsp"/>  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">업무</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
        <form:form modelAttribute="task" action="" enctype="multipart/form-data" method="post">
      <div class="card">
        <div class="card-header">
        	<form:hidden path="id"/>
        	<form:hidden path="parent_id"/>
        	<form:hidden path="project_id"/>
        	<form:hidden path="account_id"/>        	
        	<form:hidden path="subject"/>
        	<form:hidden path="description"/>
        	<form:hidden path="start_date"/>
        	<form:hidden path="project_name"/>
        	
          <h3 class="card-title">
          	${task.tracker}&nbsp;&nbsp;#<span id="id" name="id" value="${task.id}">${task.id}</span>
          	<span ></span>
          </h3>  
        </div> <!-- /.card-header -->
        
        <div class="card-body">
          <div style="text-align:right;">
          <label id="list" style="cursor:pointer;"><i class="fas fa-list"></i>목록</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <label id="uptFrm" style="cursor:pointer;"><i class="fas fa-pen"></i>편집</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <label id="childTask" style="cursor:pointer;"><i class="fas fa-pen"></i>하위Task만들기</label>
          </div>
          
          <div style="background-Color:lightyellow; textcolor:black;">
                <h2 class="mb-0" name="subject" value="${task.subject}">${task.project_name} - ${task.subject}</h2>
                <hr align="left" style="border: solid 1px gray; width: 90%;">
         	
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>상태</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   <span name="status" value="${task.status}">${task.status}</span>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>우선순위</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   <c:choose>
                   	<c:when test="${task.priority==1}">낮음</c:when>
                   	<c:when test="${task.priority==2}">보통</c:when>
                   	<c:when test="${task.priority==3}">높음</c:when>
                   	<c:when test="${task.priority==4}">긴급</c:when>
                   	<c:when test="${task.priority==5}">즉시</c:when>
                   </c:choose>
                    <%-- <span name="priority" value="${task.priority}">${task.priority}</span> --%>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                   <label>시작일자</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   <span name="start_date" value="${task.start_date}">${task.start_date}</span>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>완료기한</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   <span name="due_date" value="${task.due_date}">${task.due_date}</span>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>담당자</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;                   
                   <span name="account_id" value="${task.account_id}">${task.name}</span>                            
                </div>
                <!-- /.form-group -->
                <div class="form-group">
            		<label>상위 업무</label>
            		&nbsp;&nbsp;&nbsp;
					<span name="parent_id" value="${task.parent_id}">${task.parent_id}</span>        
	             </div>
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <!-- /.form-group -->
                <div class="form-group">
                  <label>추정시간</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                  <span name="estimated" value="${task.estimated}">${task.estimated}</span>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>진척도</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<span name="done_ratio" value="${task.done_ratio}">${task.done_ratio}</span>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.row -->
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
            <div class="row">
            	<div class="col-md">
	            	<div class="form-group">
	            		<label>설명</label><br><br>
	            		<span name="description" value="${task.description}">${task.description}</span>
	            	</div>
            	</div>
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
            <div class="row">
            	<div class="col-md">
	            	<div class="form-group">            		
	           		<c:forEach var="finf" items="${task.fileInfo}" varStatus="sts">  
	            		<label>첨부파일</label>
	            		&nbsp;&nbsp;&nbsp;
	            		<div id="download">
		            		<span id="fileInfo" name="filename" value="${finf.filename}">${finf.filename}</span>
		            		&nbsp;&nbsp;&nbsp;<i class="fas fa-download"></i>
	            		</div>            	
		      		</c:forEach>
	            	</div>
	            </div>
            </div>
	      </div>
	      <!-- /.card-body -->
            </div><br> <!-- /.yellowbox -->
            <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">이력</a>
<!--                 <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">댓글</a> -->
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> 
              	<br>
              	<div class="card-body repliesDiv">
			    <!-- 이력 목록 출력 -->
			    	<c:forEach var="journal" items="${journals}">
			    	<pre><strong># 변경 일자: <fmt:formatDate value="${journal.created_on}" pattern="yyyy-MM-dd HH:mm"/></strong><br>${journal.content}</pre>
			    	</c:forEach>
			    </div>
              </div>
             </div>
            </div>
          </div>
         </div>     
	      </form:form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
    <!-- Footer -->
  <jsp:include page="../a00_common/a02_footer.jsp"/>
 
  <!-- Control Sidebar -->
  <!-- <aside class="control-sidebar control-sidebar-dark">
    Control sidebar content goes here
  </aside> -->
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

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

  <!-- pace-progress -->
<script src="plugins/pace-progress/pace.min.js"></script>

<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- BS-Stepper -->
<script src="plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- Page specific script -->
<script>
	
</script>
</body>
</html>