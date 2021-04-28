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
  <title>AdminLTE 3 | Gantt Chart</title>

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
<!-- Gantt chart -->
<script src="gantt/codebase/dhtmlxgantt.js?v=7.0.13"></script>
<!-- <script src="gantt/codebase/locale/locale.js?v=7.0.13"></script> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto:regular,medium,thin,bold">
<link rel="stylesheet" href="gantt/codebase/skins/dhtmlxgantt_material.css?v=7.0.13">
<link rel="stylesheet" href="gantt/samples/common/controls_styles.css?v=7.0.13">
<style>

.main-content {
	height: 600px;
	height: calc(100vh - 50px);
}
</style>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
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
				alert("에러발생");
			}
		});
		
		/* active 설정 */
		$("#sb-gantt").addClass("active");
		
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
							<h1 class="m-0">Gantt Chart</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
					</div>
				</div>
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-outline card-primary">
								<div class="card-header">
									<h3 class="card-title">조건 검색</h3>
								</div>
								<div class="card-body">
									<div class="form-group">
										<div class="row mb-3">
											<label for="projectId" class="col-md-2">프로젝트 선택</label>
											<select id="projectId" name="projectId" class="form-control col-md-3" style="display:inline-block;"></select>
										</div>
										<div class="row mb-3">
											<label for="taskName" class="col-md-2">업무 이름 검색</label>
											<input type="text" id="taskName" name="taskName" class="form-control col-md-3" style="display:inline-block;"/>
										</div>
										<div class="row mb-3">
											<label for="status" class="col-md-2">상태 검색</label>
											<select id="status" name="status" class="form-control col-md-3" style="display:inline-block;">
												<option value="">상태 선택</option>
										        <option value="신규">신규</option>
										        <option value="진행">진행</option>
										        <option value="결제대기">결제대기</option>
										        <option value="반려">반려</option>
										        <option value="완료">완료</option>
											</select>																	
										</div>
										<div class="row mb-3">
											<label for="name" class="col-md-2">담당자 검색</label>
											<input type="text" id="name" name="name" class="form-control col-md-3" style="display:inline-block;"/>																	
										</div>
										<div class="row mb-3">
											<button type="button" id="searchButton" class="btn btn-primary">검색</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<div class="main-content">
						<div id="gantt_here" style="width: 100%; height: 100%; padding: 0px;"></div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Footer -->
		<jsp:include page="../a00_common/a02_footer.jsp" />

		<!-- Control Sidebar -->
		<!-- <aside class="control-sidebar control-sidebar-dark">
    Control sidebar content goes here
  </aside> -->
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
<script>
	gantt.plugins({
//		quick_info: true,
		tooltip: true,
		critical_path: true
	});

	var toggleCritical = function () {
		if (gantt.config.highlight_critical_path)
			gantt.config.highlight_critical_path = !true;
		else
			gantt.config.highlight_critical_path = true;
		gantt.render();
	};

	gantt.config.columns = [
		{name: "wbs", label: "No", width: 40, template: gantt.getWBSCode, resize: true},
		{name: "text", label: "Task name", tree: true, width: 170, resize: true, min_width: 10},
		{name: "start_date", align: "center", width: 90, resize: true},
		{name: "duration", align: "center", width: 80, resize: true}/* ,
		{name: "add", width: 40} */
	];

	gantt.templates.rightside_text = function (start, end, task) {
		if (task.type == gantt.config.types.milestone)
			return task.text + " / ID: #" + task.id;
		return "";
	};

	gantt.config.start_on_monday = false;

	gantt.config.scale_height = 36 * 3;
	gantt.config.scales = [
		{unit: "month", step: 1, format: "%F"},
		{unit: "week", step: 1, format: function (date) {
			var dateToStr = gantt.date.date_to_str("%d %M");
			var endDate = gantt.date.add(gantt.date.add(date, 1, "week"), -1, "day");
			return dateToStr(date) + " - " + dateToStr(endDate);
		}},
		{unit: "day", step: 1, format: "%D"}
	];
	
	$.ajax({
		type:"get",
		url:"${path}/gantt.do?method=data",
		dataType:"json",
		success:function(te){
			console.log(te.list);
			gantt.parse({
				data: te.list
			})
		},
		error:function(err){
			console.log(err);
		}
	});
	
	gantt.init("gantt_here");
/* 	gantt.message({text: "Some text", expire: -1});
	gantt.message({text: "Some text", type: "error", expire: -1}); */
	gantt.attachEvent("onTaskDblClick", function(id,e){
	       //any custom logic here
	       return false;
	});
	gantt.attachEvent("onTaskDblClick", function(id,e){
		if(confirm("상세정보로 이동하시겠습니까?")){
			location.href = "${path}/task.do?method=detail&id="+id;
		}
	});
	
	gantt.attachEvent("onBeforeTaskChanged", function(id, mode, task){
		
		var ret = false;
    	$.ajax({
	    	method: "post",
	    	url: "${path}/gantt.do?method=check",
	    	async: false,
   			data:{
   				id: id
   			},
   			dataType: "json",
   			success: function(data){
   				var result = data.result;
   				if (result == "success") {
   					ret = true;
   				} else if (result == "alreadyFinished") {
   					alert("이미 완료된 업무이므로 수정할 수 없습니다.");
   				} else if (result == "notAuthor") {
   					alert("PM 또는 업무 담당자만 변경 가능합니다.");
   				} else if (result == "notLogined") {
   					alert("로그인이 필요합니다.");
   				} else {
   					alert("에러 발생");
   				}
   			},
   			error: function(err){
   				alert("에러 발생");
   				console.log(err);
   			}
	    });
		
	    return ret;
	});
	
	gantt.attachEvent("onAfterTaskDrag", function(id, mode, e){
		var task = gantt.getTask(id);
	    updateTask(task);
	});
	
	function updateTask(task) {
		$.ajax({
			type:"post",
			url:"gantt.do?method=update",
			data: {
				id: task.id,
				start_date: task.start_date.toISOString(),
				duration: task.duration,
				progress: task.progress
			},
			dataType:"json",
			success: function(data) {
				if (data.success == "Y"){
					alert("수정 완료 했습니다.");
				} else {
					console.log("수정하지 못했습니다.");
				}
			},
			error: function(err) {
				alert("에러 발생");
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
			url:"${path}/gantt.do?method=data",
			data: {
				projectId: projectId,
				taskName: taskName,
				status: status,
				name: name
			},
			dataType:"json",
			success:function(te){
				console.log(te.list);
				gantt.clearAll();
				gantt.parse({
					data: te.list
				})
			},
			error:function(err){
				console.log(err);
			}
		});		
	});

	
//	gantt.parse(projects_milestones_critical);
</script>
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
