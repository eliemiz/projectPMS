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
<title>사용자 정보 수정</title>

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

   var proc = "${param.proc}";
   
		if(proc=="update"){
			alert("비밀번호가 변경되었습니다.");
			location.href = "${path}/account.do?method=logout";			
		}

		var isDuplicated = true;
	
		
    $(document).ready(function(){
    	
		$("#Btn").on("click",function(){
			var Rmail=$("#mail").val();
			var Pmail="${account.mail}";
			var pass_length = $("[name=password]").val().length
			var pass2_length = $("[name=password2]").val().length
		 	if ($("[name=name]").val() == "") {
				alert("이름을 입력해주세요");
				return false;
				
			} else if($("[name=name]").val().length>=30){
				alert("이름은 30자 이내로 입력하세요.");
				return false;
				
			} else if($("[name=password]").val()==""){
				alert("새 비밀번호를 입력해주세요");
				return false;
			} 
		
			else if(pass_length < 4 || pass_length >10) {
				alert("패스워드는 4자 이상 10자 이하이어야 합니다.");
				return false;
			}
			else if($("[name=password2]").val()==""){
				alert("새 비밀번호를 확인해주세요");
				return false;
			}
	 		
			else if(pass2_length < 4 || pass2_length >10) {
				alert("패스워드는 4자 이상 10자 이하이어야 합니다.");
				return false;
				
			} 
			else if ($("[name=mail]").val() == "") {
				alert("이메일을 입력해주세요");
				$("#id-check-span").html("이메일을 입력해주세요.");
				return false;

			} else if($("[name=mail]").val().length>=30){
				alert("형식에 맞지않습니다. 다시 입력하세요.");
				return false;
				
			} else if (Rmail != Pmail && isDuplicated == true) {
	            alert("이메일 중복체크 해주세요.");
	            $("#id-check-span").html("이메일 중복 체크해주세요.");
	            return false;
	        }
				
	 		
			 if(confirm("변경하시겠습니까?")){
				//alert($("[name=id]").val());
				$("[name=proc]").val("upt");
				$("form").attr("action","${path}/account.do?method=updateInfo");
				$("form").submit();
			}else {
				return false;
			}
		}); 	
	 	 
		/*
		$("#mail").keyup(function(e) {
			if (e.keyCode == 13) { // 입력할 항목에 enter키를 입력시 처리
				ckMail();
			} else {
				isDuplicated = true;
			}
		});
		*/
		
	});

	function ckMail() {
		$.ajax({
			type : "post",
			url : "${path}/account.do?method=hasMember2",
			data : {
				mail : $("[name=mail]").val()
			},
			dataType : "json",
			success : function(data) {
				//alert(data.mCnt);
				if (data.mCnt == 0) {
					alert("등록 가능한 이메일입니다.");
					$("#id-check-span").html("");
					isDuplicated = false;
				} else {
					alert("이미 등록된 이메일이 있습니다.");
					$("#id-check-span").html("이미 등록된 이메일이 있습니다.");
					$("#mail").val("").focus();
				}
			},
			error : function(err) {
				alert("에러발생");
				console.log(err);
			}
		});
	}
 	
	$(function(){
	
	//비밀번호 확인
		$('#password2').blur(function(){
		   if($('#password').val() != $('#password2').val()){
		    	if($('#password2').val()!=''){
			    alert("비밀번호가 일치하지 않습니다.");
		    	    $('#password2').val('');
		          $('#password2').focus();
		       }
		    }
		})  	   
	});
   
   
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
   <div class="wrapper">
      <!-- Navbar -->
      <jsp:include page="../a00_common/a00_header.jsp" />

      <!-- Main Sidebar Container -->
      <jsp:include page="../a00_common/a01_sidebar.jsp" />

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <div class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1 class="m-0">Password Search</h1>
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">password search</li>
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
                  <div class="card card-outline card-info">
                     <div class="card-header text-center">
                        <a href="../../index2.html" class="h1"><spring:message code="u_change_info"/></a>
                     </div>
                      <form method="post">
                      	<input type="hidden" name="proc"/>
    					<input type="hidden" name="id" value="${account.id}"/>
                     	  <div class="card-body">
                           <p class="login-box-msg">새로 변경 할 회원정보를 입력하세요.</p>
                            <div class="input-group mb-3">
								<input name="name" class="form-control" value="${account.name}"  />
								<div class="input-group-append">
									<div class="input-group-text">
										<span class="fas fa-user"></span>
									</div>
								</div>
							</div>
							<div class="input-group mb-3">
								<input name="mail" id="mail" class="form-control" value="${account.mail}" />
								<div class="input-group-append">
									<div class="input-group-text">
										<span class="fas fa-envelope"></span>
									</div>
								</div>	
								<button type="button" id="ckIdBtn" class="btn btn-default" onclick="ckMail()"><spring:message code="account_duplication"/></button>
								   
								<div>
							    	<span> *중복된 이메일은 사용이 불가합니다. </span><br>
							    	<span id="id-check-span" style="color:red;"></span>
								</div>
							</div>
                            <div class="input-group mb-3">
					          <input name="password" id="password" type="password" class="form-control" placeholder="<spring:message code="account_new_pass"/>"/>
					          <div class="input-group-append">
					            <div class="input-group-text">
					              <span class="fas fa-lock"></span>
					            </div>
					          </div>
					        </div>
				             <br>
					        <div class="input-group mb-3">
					          <input name="password2" id="password2" type="password" class="form-control" placeholder="<spring:message code="account_new_pass"/>"/>
					          <div class="input-group-append">
					            <div class="input-group-text">
					              <span class="fas fa-lock"></span>
					            </div>
					          </div>
					        </div> 
                           <div class="row">
                              <div class="col-12">
                                 <button type="button" class="btn btn-info btn-block" id="Btn"><spring:message code="account_check"/></button>
                              </div>
                           </div>
                     	</div>
                     </form>
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