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
		if(proc=="ins"){
			  $("[name=subject]").val("");
			  alert("????????????");
		  	  location.href="${path}/notice.do?method=list";
	}
	$(document).ready(function(){
		$("#sb-notice").addClass("active");
		//?????????????????????
		$("#insBut").on("click",function(){
			if($("[name=subject]").val()==""){
				alert("????????? ???????????????.");
				return false;
			}else if($("[name=project_id]").val()==""){
				alert("??????????????? ???????????????.");
				return false;
			}else if($("[name=account_id]").val()==""){
				alert("???????????? ???????????????.");
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
            <h1 class="m-0">Notice</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Notice</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
    <form:form 
    	modelAttribute="notice"
    	action="${path}/notice.do?method=insert"
    	enctype="multipart/form-data"
    	method="post">
     <div class="card card-primary">
      <div class="card-header">
       <h3 class="card-title">???????????? ??????</h3>
       	<form:hidden path="id"/>
       	<form:hidden path="created_on"/>
    	<form:hidden path="updated_on"/>
         </div>
           <!-- /.card-header -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">??????</label>
                    <form:input path="subject" type="text" class="form-control" placeholder="????????? ??????????????????"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">?????????</label>
                    <form:select path="account_id" class="form-control select" style="width: 100%;">
	                 <option value="">????????? ??????</option>
	                  	<c:forEach var="account" items="${accounts}">
		                    <form:option value="${account.id}">${account.name}</form:option>
	                    </c:forEach>
                 	</form:select>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">????????????</label>
                    <form:select path="project_id" class="form-control select2" style="width: 100%;">
	                    <option value="">????????????</option>
	                    <c:forEach var = "project" items="${projects}">
	                    	<form:option value="${project.id}">${project.name}</form:option>
	                    </c:forEach>
                  	</form:select>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">??????</label>
                    <form:textarea path="content" class="form-control" rows="3" value=""/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">?????? ??????</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">?????? ??????</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">?????????</span>
                      </div>
                    </div>
                  </div>
                  <!-- <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div> -->
                </div>
                <!-- /.card-body -->
            <div class="card-footer">
          <button id="insBut" type="button" class="btn btn-primary float-right">??????</button>
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


</body>
</html>
