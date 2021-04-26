<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>새 프로젝트</title>


<!-- icheck bootstrap -->
<link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
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
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
$.widget.bridge('uibutton', $.ui.button)
/*
 $(function () {
  // Summernote
  $('#summernote').summernote()

  // CodeMirror
  CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
    mode: "htmlmixed",
    theme: "monokai"
  }  
}); 
 */
 var proc = "${proc}";
 if(proc=="insert"){
	  $("[name=id]").val("0");
	  $("[name=name]").val("");
	  
 	  if(confirm("등록완료!\n프로젝트목록으로 이동하시겠습니까?")){
 		  location.href="${path}/project.do";
 	  }
 }

 $(document).ready(function(){
	 
	 
	  $("#Btn").on("click",function(){
		  
		  
			if($("[name=name]").val()==""){
				alert("프로젝트명을 입력해주세요");
				return false;
			}else if ($("[name=description]").val() == "") {
		 		alert("설명을 입력해주세요.");
		 		return false;
		 		
		 	}else if ($("[name=identifier]").val() == "") {
		 		alert("식별자를 입력해주세요.");
		 		return false;
		 		
		 	}else if ($("[name=homepage]").val() == "") {
		 		alert("홈페이지를 입력해주세요.");
		 		return false;
		 		
		 	}else if($("[name=name]").val().length>=100){
				alert("프로젝트명은 100자 이내로 입력하세요.");
				return false;
				
			}else if($("[name=description]").val().length>=300){
				alert("설명은 300자 이내로 입력하세요.");
				return false;
				
			}else if($("[name=identifier]").val().length>=30){
				alert("식별자는 30자 이내로 입력하세요.");
				return false;
				
			}else if($("[name=homepage]").val().length>=30){
				alert("홈페이지는 30자 이내로 입력하세요.");
				return false;
			}

			$("form").submit();
 	  
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
            <h1 class="m-0">new project</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">project</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    
         <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-7">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title"><spring:message code="p_new-project"/></h3>

			<div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <form:form modelAttribute="project" action="${path}/project.do?method=insert" 
				 	enctype="multipart/form-data" method="post">
 				<form:hidden path="id"/>
            <div class="card-body">
              <div class="form-group">
                <label for="inputName"><spring:message code="p_name"/></label>
                <form:input path="name" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputDescription"><spring:message code="p_description"/></label><br>
                <form:textarea path="description" rows="8" cols="80"/>
              </div>
              <div class="form-group">
                <!-- <label for="inputClientCompany"><spring:message code="p_identifier"/></label> -->
                <form:hidden path="identifier" value="식별자" class="form-control"/>
              </div>
              <div class="form-group">
                <label for="inputProjectLeader"><spring:message code="p_homepage"/></label>
                <form:input path="homepage" class="form-control" />
              </div>

              <div class="form-group">
               <div class="icheck-success d-inline">
	           </div>
	          </div> 
               <div class="form-row float-right">
	          <!-- /.col -->
	            <button type="submit" class="btn btn-primary" id="Btn"><spring:message code="p_new"/></button>&nbsp;&nbsp;
	            <a href="${path}/project.do" class="btn btn-default"><spring:message code="p_cancel"/></a>
	          <!-- /.col -->
	          </div>
             </div>
             <!-- /.card-body -->
             </form:form>
            </div>
          <!-- /.card -->
        </div>
      </div>

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
</body>
</html>
