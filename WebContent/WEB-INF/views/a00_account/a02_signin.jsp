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
<title>등록</title>


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
   


  
$(document).ready(function(){
  $("#Btn").click(function(){
	    if($("[name=user_id]").val()==""){
			alert("아이디를 입력해주세요");
			return false;
			
		}else if($("[name=mail]").val()==""){
			alert("이메일을 입력해주세요");
			return false;
			
		}else if($("[name=name]").val()==""){
			alert("이름을 입력해주세요");
			return false;
		} 
  });
}); 
	

</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <jsp:include page="../a00_common/a00_header_nl.jsp"/>

  <!-- Main Sidebar Container -->
  <jsp:include page="../a00_common/a01_sidebar.jsp"/>  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">signin</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">signin</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    
     <!-- Main content -->
    <section class="content">

    
	<div class="hold-transition login-page" style="background-color: inherit; height: inherit;">
	<div class="register-box">
	  <div class="card card-outline card-primary">
	    <div class="card-header text-center">
	      <a href="../../index2.html" class="h1">회원등록</a>
	    </div>
	    <div class="card-body">
	      <p class="login-box-msg"></p>
	      <!-- <input type="hidden" name="password" id="password" value="A1234"/> -->
	    <form action="${path}/account.do?method=send2" method="post">
	       <div class="input-group mb-3">
	          <input name="user_id" id="user_id" class="form-control" placeholder="아이디"/>
	          <div class="input-group-append">
	            <div class="input-group-text">
	              <span class="fas fa-user"></span>
	            </div>
	          </div>
	        </div>
	        <!-- 
	         <a class="h7">
                 *최소한 4 글자 이상이어야 합니다.
             </a>
             <br>
	        <div class="input-group mb-3">
	          <input id="password2" type="password" class="form-control" placeholder="비밀번호 재확인">
	          <div class="input-group-append">
	            <div class="input-group-text">
	              <span class="fas fa-lock"></span>
	            </div>
	          </div>
	        </div> -->
	         <br>  
	          <div class="input-group mb-3">
	          <input name="name" id="name" class="form-control" placeholder="이름"/>
	          <div class="input-group-append">
	            <div class="input-group-text">
	              <span class="fas fa-user"></span>
	            </div>
	          </div>
	        </div>
	        <br>
	        <div class="input-group mb-3">
	          <input name="mail" id="mail" class="form-control" placeholder="Email"/>
	          <div class="input-group-append">
	            <div class="input-group-text">
	              <span class="fas fa-envelope"></span>
	            </div>
	          </div>
	        </div>
	        <br>
	        <div class="input-group mb-3">
	        <div class="input-group-append">
	          <select name="auth" id="auth" class="form-control">
	          	<option value="">권한 선택</option>
	          	<option value="Developer" name="Developer">Developer</option>
	          	<option value="Manager" name="Manager">Manager</option>
	          </select>
	          </div>
	        </div>
	        <div class="form-row float-right">
	        	<a href="${path}/login.do">
	            <button type="submit" class="btn btn-primary btn-block" id="Btn">등록</button>
	            </a>
	          <!-- /.col -->
	        </div>
	      </form>
	
	      <div class="social-auth-links text-center">

	      </div>
	
	    </div>
	    <!-- /.form-box -->
	  </div><!-- /.card -->
	</div>
	<!-- /.register-box -->
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
