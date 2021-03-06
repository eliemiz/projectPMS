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
<!-- fullCalendar -->
<script src="fullcalendar-5.6.0/lib/main.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		/* Get project List */
		$.ajax({
			type: "get",
			url: "${path}/jsonProject.do",
			dataType: "json",
			success: function(data){
				var projectList = data.projectList;
				
				$.each(projectList, function(idx, e, arr){
					$("#projectId").append("<option value='" + e.id + "'>" + e.name + "</option>");
				});
				
				$("#projectId").val(data.projectId);
			},
			error: function(err){
				alert("????????????");
			}
		});
		
		
		/* active ?????? */
		$("#sb-calendar").addClass("active");
		
		/* Calendar */
		var calendarEl = document.getElementById('calendar');		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear prev today next nextYear',
				center : 'title',
				/* right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek' */
			},
			themeSystem: 'bootstrap',
			initialDate : new Date().toISOString(), // ??????????????? ?????? ?????? ?????? ??????
			navLinks : true,
			selectable : true,
			selectMirror : true,
			eventClick : function(arg){
				console.log("# ????????? ?????? ?????? #");
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
			},
			eventDrop: function(arg){
				var ret = checkEvent(arg.event);
				if (ret == false) {
					arg.revert();
					return;
				}
				
				updateEvent(arg.event);
			},
			eventResize: function(arg){
				var ret = checkEvent(arg.event);
				if (ret == false) {
					arg.revert();
					return;
				}
				
				updateEvent(arg.event);
			}
		});
		
		calendar.render();
		
		function checkEvent(event) {
			
			var ret = false;
	    	$.ajax({
		    	method: "post",
		    	url: "${path}/calendar.do?method=check",
		    	async: false,
	   			data:{
	   				id: event.id
	   			},
	   			dataType: "json",
	   			success: function(data){
	   				var result = data.result;
	   				if (result == "success") {
	   					ret = true;
	   				} else if (result == "alreadyFinished") {
	   					alert("?????? ????????? ??????????????? ????????? ??? ????????????.");
	   				} else if (result == "notAuthor") {
	   					alert("PM ?????? ?????? ???????????? ?????? ???????????????.");
	   				} else if (result == "notLogined") {
	   					alert("???????????? ???????????????.");
	   				} else {
	   					alert("?????? ??????");
	   				}
	   			},
	   			error: function(err){
	   				alert("?????? ??????");
	   				console.log(err);
	   			}
		    });
			
		    return ret;
		}
		
		// update??? ?????? ?????? ??????
		function updateEvent(event) {
			var sch = {};
			sch.id = event.id;
			sch.start = event.start.toISOString();
			sch.end = event.end.toISOString();
			
			console.log("# ????????? ??? ?????? #");
			console.log(sch);
			
			updateCall(sch);
		}

		// ?????? ?????? ajax
		function updateCall(sch) {
			$.ajax({
				type: "post",
				url: "calendar.do?method=update",
				data: sch,
				dataType: "json",
				success: function(data){
					if (data.success == "Y"){
						alert("?????? ??????????????????.");
					} else {
						console.log("??????");
					}
				},
				error: function(err){
					alert("?????? ??????: " + err);
					console.log(err);
				}
			});
		}
		
		$("#searchButton").click(function(){
			var projectId = $("#projectId").val();
			var taskName = $("#taskName").val();
			var status = $("#status").val();
			var name = $("#name").val();
			
			$.ajax({
				type:"get",
				url:"${path}/calendar.do?method=data",
				data: {
					projectId: projectId,
					taskName: taskName,
					status: status,
					name: name
				},
				dataType:"json",
				success:function(data){
					console.log(data.list);
					// ?????? ??? ????????? ?????????
					calendar.removeAllEvents();
					// ?????? ????????? ?????? ????????? ??????
					data.list.forEach(function(element, index, array){
						calendar.addEvent(element);
					});
				},
				error:function(err){
					console.log(err);
				}
			});
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
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-outline card-primary">
						<div class="card-header">
							<h3 class="card-title">?????? ??????</h3>
						</div>
						<div class="card-body">
							<div class="form-group">
								<div class="row mb-3">
									<label for="projectId" class="col-md-2">???????????? ??????</label>
									<select id="projectId" name="projectId" class="form-control col-md-3" style="display:inline-block;"></select>
								</div>
								<div class="row mb-3">
									<label for="taskName" class="col-md-2">?????? ?????? ??????</label>
									<input type="text" id="taskName" name="taskName" class="form-control col-md-3" style="display:inline-block;"/>
								</div>
								<div class="row mb-3">
									<label for="status" class="col-md-2">?????? ??????</label>
									<select id="status" name="status" class="form-control col-md-3" style="display:inline-block;">
										<option value="">?????? ??????</option>
								        <option value="??????">??????</option>
								        <option value="??????">??????</option>
										<option value="????????????">????????????</option>
										<option value="????????????">??????</option>
										<option value="????????????">??????</option>
									</select>																	
								</div>
								<div class="row mb-3">
									<label for="name" class="col-md-2">????????? ??????</label>
									<input type="text" id="name" name="name" class="form-control col-md-3" style="display:inline-block;"/>																	
								</div>
								<div class="row mb-3">
									<button type="button" id="searchButton" class="btn btn-primary">??????</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="main-content">
	    		<div id='calendar'></div>
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