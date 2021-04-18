<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>


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
<link rel="stylesheet" href="dist/font/fonts.css"/>
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
</style>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

  $.widget.bridge('uibutton', $.ui.button)

</script>
<script type="text/javascript">
	
	$(document).ready(function(){

		var loginSucc="${loginSucc}";
	

	     // alert(loginSucc);
	      if(loginSucc=="Y"){
	    	  alert("로그인성공\nDashboard로 이동합니다.");
	    		$(location).attr("href","${path}/dashboard.do");
	      }
	      if(loginSucc=="N"){
	    	  alert("등록된 계정이 아닙니다.\n다시 로그인해주세요. ");
	    	  $("[name=user_id]").focus();
	      }
	});
		
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<jsp:include page="../a00_common/a00_header_nl.jsp" />

		<!-- Main Sidebar Container -->
		<jsp:include page="../a00_common/a01_sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Login</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item active">login</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<!-- Main content -->
			<section class="content">
				<div class="hold-transition login-page"
					style="background-color: inherit; height: inherit;">
					<div class="login-box">
						<!-- /.login-logo -->
						<div class="card card-outline card-primary">
							<div class="card-header text-center">
								<h1>로그인</h1>
							</div>
							<div class="card-body">

								<form id="login-form" method="post">
									<div class="input-group mb-4">
										<input type="text" class="form-control" name="user_id" placeholder="아이디 입력">
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-user"></span>
											</div>
										</div>
									</div>
									<div class="input-group mb-4">
										<input type="password" class="form-control" name="password" placeholder="비밀번호 입력">
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-lock"></span>
											</div>
										</div>
									</div>
									<div class="input-group mb-5">
										<button id="loginBtn" type="button" class="btn btn-primary btn-block">로그인</button>
									</div>
								</form>
								<div class="mb-3">
									<a href="${path}/account.do?method=loginSearch">
										<button type="button" class="btn btn-outline-info btn-block btn-flat">
											<i class="fas fa-search"></i> 비밀번호 찾기
										</button>
									</a>
								</div>
								<div class="mb-3">
									<a href="${path}/account.do?method=signin">
										<button type="button" class="btn btn-outline-danger btn-block btn-flat">
											<i class="fa fa-book"></i> 새로 등록하기
										</button>
									</a>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.login-box -->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Footer -->
		<jsp:include page="../a00_common/a02_footer.jsp" />
		
	</div>
	<!-- ./wrapper -->

<script type="text/javascript">

$("[name=user_id],[name=password]").keyup(function(){
    if(event.keyCode==13){
    	if ($("[name=user_id]").val() == "") {
	 		alert("아이디를 입력해주세요.");
	 		return false;
	 	} else if ($("[name=password]").val() == "") {
	 		alert("패스워드를 입력해주세요.");
	 		return false;
	 	}
    		$("#login-form").submit();
    }
 });
 
 	$("#loginBtn").on("click", function(){
 		
 		// 유효성 체크
	 	if ($("[name=user_id]").val() == "") {
	 		alert("아이디를 입력해주세요.");
	 		return false;
	 	} else if ($("[name=password]").val() == "") {
	 		alert("패스워드를 입력해주세요.");
	 		return false;
	 	}
 		
 		$("#login-form").submit();
 	});
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
</body>
</html>
