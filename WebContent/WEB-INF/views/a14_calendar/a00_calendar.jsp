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
<title>AdminLTE 3 | Calendar</title>

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
<link rel='stylesheet' href='a00_com/lib/main.css'/>
<style>
	#calendar {
		background-color:white;
		max-width: 100%;
		margin: 0 auto;
	}
</style>
<script src='a00_com/lib/main.js'></script>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		/* DashBoard에서 넘어올 땐 session값을 가지고 있어서 그대로 출력 */
		/* 검색할때는 검색 눌러서 parameter값 넘기기 */
		// 유효성체크
		var projcet_id = $("[name=project_id]").val();
		var status = $("[name=status]").val();
		var tracker = $("[name=tracker]").val();
		alert("project_id : "+project_id);
		alert("status : "+status);
		alert("tracker : "+tracker);
				
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear prev today next nextYear',
				center : 'title',
				/* right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek' */
			},
			themeSystem: 'bootstrap',
			initialDate : new Date().toISOString(), // 현재날짜로 초기 로딩 날짜 설정
			navLinks : true,
			selectable : true,
			selectMirror : true,
			eventClick : function(arg){
				console.log("# 등록된 일정 클릭 #");
				console.log(arg.event);
				console.log(arg.event.id);
				console.log(arg.event.extendedProps);
				location.href = "${path}/task.do?method=detail&id="+arg.event.id;
				
			},
			editable : true,
			dayMaxEvents : true,
			events :function(info, successCallback, failureCallback){
				$.ajax({
					type:"get",
					url:"${path}/calendar.do?method=data",
					dataType:"json",
					success:function(data){
						console.log(data.list);
						successCallback(data.list);
					},
					error:function(err){
						console.log(err);
					}
				});
			}
		});

		calendar.render();
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
            <h1 class="m-0">Calendar</h1>
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
		<div id="query_form_with_buttons" class="hide-when-print">
			<div id="query_form_content">
				<fieldset id="filters" class="collapsible ">
			    	<h3 class="card-title">검색조건</h3><br><br>			    	
			    	<form:form modelAttribute="sch" method="post">
				    	<div class="card-body">
					    	<div class="row">
						    	<div class="col-md-6">
						    		<div class="form-group">
							    		&nbsp;&nbsp;<label>프로젝트</label>&nbsp;&nbsp;
							    		<form:select path="project_id" class="form-control select">
							    			<option value="">프로젝트 선택</option>
							    			<c:forEach var="proj" items="${projects}">
							    				<form:option value="${proj.id}">${proj.name}</form:option>
							    			</c:forEach>			    			
							    		</form:select>
						    		</div>
						    		<div class="form-group">
						    			&nbsp;&nbsp;<label>상태</label>&nbsp;&nbsp;
							    		<form:select path="status" class="form-control">
							    			<option value="">상태 선택</option>
						                    <form:option value="신규" label="신규"/>
						                    <form:option value="진행" label="진행"/>
						                    <form:option value="해결" label="해결"/>
						                    <form:option value="의견" label="의견"/>
						                    <form:option value="완료" label="완료"/>
						                    <form:option value="거절" label="거절"/>			    			
							    		</form:select>
						    		</div>
						    	</div>
						    	<div class="col-md-6">
						    		<div class="form-group">
							    		&nbsp;&nbsp;<label>유형</label>&nbsp;&nbsp;
							    		<form:select path="tracker" class="form-control">
							    			<option value="">유형 선택</option>
						                    <form:option value="결함" label="결함"/>
						                    <form:option value="새기능" label="새기능"/>
						                    <form:option value="지원" label="지원"/>			    			
							    		</form:select>
						    		</div>
						    		<div class="form-group">
							    		<button class="btn btn-success" type="submit">검색</button>
						    		</div>
					 	   		</div>
					 	   	</div>
				 	   	</div>
			    	</form:form>
			    	
				</fieldset>
			</div>			
		</div>
    		<div id='calendar'></div>
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
</body>
</html>