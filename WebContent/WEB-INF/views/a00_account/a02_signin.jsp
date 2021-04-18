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

/*
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	  var checkbtn = 0;
      var user_id =  $("#user_id").val(); 
      $(document).ready(function(){ 
    	  $('#checkbtn').on('click', function(){

		      $.ajax({
		          async: true,
		          type : 'POST',
		          data : user_id,
		          url : "",
		          dataType : "json",
		          success : function(data) {
		              if (data.cnt > 0) {
		                  
		                  alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
		                  //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                  $("#divInputId").addClass("has-error")
		                  $("#divInputId").removeClass("has-success")
		                  $("#user_id").focus();
		                  
		              
		              } else {
		                  alert("사용가능한 아이디입니다.");
		                  //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                  $("#divInputId").addClass("has-success")
		                  $("#divInputId").removeClass("has-error")
		                  $("#password").focus();
		                  //아이디가 중복하지 않으면  idck = 1 
		                  idck = 1;
		                  
		              }
		          },
		          error : function(error) {
		              
		              alert("error : " + error);
		          }
		      }  
		      });
	      
     	 });
      });*/

      $(document).ready(function(){
   	   $("form").submit(function(e){
   		  e.preventDefault(); 
   	   });
   	   $("#user_id").keyup(function(e){
   		   if(e.keyCode==13){ // 입력할 항목에 enter키를 입력시 처리
   			   ckId();
   		   }
   	   });
         $("#ckIdBtn").click(function(){ // 등록여부확인 버튼 클릭 시
       	  ckId();
         });
       });
        function ckId(){
        	//var params = $("#ajax").serialize();
        	// alert($("form").serialize());
        	var data = $("form").serialize(); 
        	$.ajax({
        		type:"post",
        		url:"${path}/hasMember.do",
        		data:$("form").serialize(),
        		dataType:"json",
        		success:function(data){
        			// alert(data.mCnt);
        			if(data.mCnt==1){
        				alert("등록된 아이디가 있습니다.")
        				$("#user_id").val("").focus();
        			}else{
        				alert("등록 가능합니다.")
        			}
        		},
        		error:function(err){
        			console.log(err);
        		}
        	});
        }	



	var result = "${result}";
	if (result == "success") {
		alert("회원가입이 완료되었습니다.\n로그인화면으로 이동합니다.");
		location.href = "${path}/account.do?method=login";
	}
  
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
							<h1 class="m-0">Sign in</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item active">signin</li>
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
					<div class="register-box">
						<div class="card card-outline card-primary">
							<div class="card-header text-center">
								<h1>회원 등록</h1>
							</div>
							<div class="card-body">
								<p class="login-box-msg"></p>
								<form:form modelAttribute="account" action="${path}/account.do?method=send2" 
									enctype="multipart/form-data" method="post">
									<form:hidden path="auth" class="form-control" value="Developer" />
									<div class="input-group mb-5">
									<form name="ajax" class="form-inline" method="post">
										<form:input path="user_id" class="form-control" placeholder="아이디" />
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-user"></span>
											</div>
										</div>
										<button type="button" id="ckIdBtn" class="btn btn-default">중복확인</button>
  									</form>
									</div>
									<div class="input-group mb-5">
										<form:input path="name" class="form-control" placeholder="이름" />
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-user"></span>
											</div>
										</div>
									</div>
									<div class="input-group mb-5">
										<form:input path="mail" class="form-control" placeholder="Email" />
										<div class="input-group-append">
											<div class="input-group-text">
												<span class="fas fa-envelope"></span>
											</div>
										</div>
									</div>
									<div class="input-group mb-3">
										<button type="button" class="btn btn-primary btn-block" id="Btn">등록</button>
									</div>
								</form:form>
							</div>
							<!-- /.form-box -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.register-box -->
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
