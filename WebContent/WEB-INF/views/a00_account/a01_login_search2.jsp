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
<title>아이디 찾기</title>

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

    var result = "${result}";
    if (${not empty result}) {
       if (result == "success") {
          alert("해당 계정의 아이디 정보가 메일로 발송되었습니다.");
          location.href = "${path}/account.do?method=login";
       } else if (result == "failToFind") {
          alert("해당하는 사용자가 없습니다.");
       }
    }
    
    $(document).ready(function(){
	 	$("#Btn").click(function() {
	 		if($("[name=mail]").val()==""){
				alert("이메일을 입력해주세요");
				return false;
			}

	 		if($("[name=name]").val()==""){
				alert("이름을 입력해주세요");
				return false;
			}else if($("[name=name]").val().length>=30){
				alert("이름은 30자 이내로 입력하세요.");
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
                     <h1 class="m-0">ID Search</h1>
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">ID search</li>
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
                  <div class="card card-outline card-warning">
                     <div class="card-header text-center">
                        <a href="../../index2.html" class="h1"><spring:message code="account_searchid"/></a>
                     </div>
                     <div class="card-body">
                        <form method="post" action="${path}/account.do?method=sendId">
                           <p class="login-box-msg">메일 주소를 입력하세요.</p>
                           <div class="input-group mb-3">
                              <input name="receiver" id="mail" type="email" class="form-control" placeholder="<spring:message code="account_email"/>">
                              <div class="input-group-append">
                                 <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                 </div>
                              </div>
                           </div>
                           <p class="login-box-msg">이름을 입력하세요.</p>
                           <div class="input-group mb-3">
                              <input name="name" id="name" type="text" class="form-control" placeholder="<spring:message code="account_name"/>">
                         		<div class="input-group-append">
									<div class="input-group-text">
										<span class="fas fa-user"></span>
									</div>
								</div>
                           </div>
                           <div class="row">
                              <div class="col-12">
                                 <button type="button" class="btn btn-warning btn-block" id="Btn"><spring:message code="account_check"/></button>
                              </div>
                           </div>
                        </form>
                     </div>
                     <!-- /.login-card-body -->
                  </div>
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