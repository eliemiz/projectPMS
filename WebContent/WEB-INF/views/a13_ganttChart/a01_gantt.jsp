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
<!-- <script src="gantt/samples/common/testdata.js?v=7.0.13"></script> -->
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
	$("#sb-gantt").addClass("active");
});
	var projects_milestones_critical = {
		data: [ 
			{ id: 1, text: "hi^^", type: "project", progress: 0.4, open: true, start_date: "02-05-2021 00:00", duration: 17, parent: 0 },
			{ id: 2, text: "Office facing", type: "project", start_date: "02-05-2021 00:00", duration: 5, progress: 0.6, parent: 1, open: true},
			{ id: 5, text: "Interior office", type: "task", start_date: "02-05-2021 00:00", duration: 3, parent: 2, progress: 0.6, open: true},
			{ id: 6, text: "Air conditioners check", type: "task",  start_date: "05-05-2021 00:00", duration: 2, parent: 2, progress: 0.29, open: true},
			{ id: 3, text: "Furniture installation", type: "project", start_date: "08-05-2021 00:00", duration: 2, parent: 1, progress: 0.6, open: false},
			{ id: 7, text: "Workplaces preparation", type: "task",  start_date: "08-05-2021 00:00", duration: 2, parent: 3, progress: 0.6, open: true},
			{ id: 4, text: "The employee relocation", type: "project", start_date: "10-05-2021 00:00", duration: 9, parent: 1, progress: 0.5, open: true},
			{ id: 8, text: "Preparing workplaces", type: "task",  start_date: "10-05-2021 00:00", duration: 3, parent: 4, progress: 0.5, open: true},
			{ id: 9, text: "Workplaces importation", type: "task",  start_date: "13-05-2021 00:00", duration: 3, parent: 4, progress: 0.5, open: true},
			{ id: 10, text: "Workplaces exportation", type: "task",  start_date: "16-05-2021 00:00", duration: 3, parent: 4, progress: 0.5, open: true},
			{ id: 11, text: "Product launch", type: "project", progress: 0.6, open: true, start_date: "02-05-2021 00:00", duration: 17, parent: 0 },
			{ id: 12, text: "Perform Initial testing", type: "task",  start_date: "02-05-2021 00:00", duration: 5, parent: 11, progress: 1, open: true},
			{ id: 13, text: "Development", type: "project", start_date: "03-05-2021 00:00", duration: 16, parent: 11, progress: 0.5, open: true},
			{ id: 17, text: "Develop System", type: "task",  start_date: "03-05-2021 00:00", duration: 5, parent: 13, progress: 1, open: true},
			{ id: 25, text: "Beta Release", type: "milestone", start_date: "08-05-2021 00:00", duration: 0, parent: 13, progress: 0, open: true},
			{ id: 18, text: "Integrate System", type: "task",  start_date: "08-05-2021 00:00", duration: 4, parent: 13, progress: 0.8, open: true},
			{ id: 19, text: "Test", type: "task",  start_date: "12-05-2021 00:00", duration: 3, parent: 13, progress: 0.2, open: true},
			{ id: 20, text: "Marketing", type: "task",  start_date: "15-05-2021 00:00", duration: 4, parent: 13, progress: 0, open: true},
			{ id: 14, text: "Analysis", type: "task",  start_date: "02-05-2021 00:00", duration: 4, parent: 11, progress: 0.8, open: true},
			{ id: 15, text: "Design", type: "project", start_date: "06-05-2021 00:00", duration: 6, parent: 11, progress: 0.2, open: true},
			{ id: 21, text: "Design database", type: "task",  start_date: "06-05-2021 00:00", duration: 4, parent: 15, progress: 0.5, open: true},
			{ id: 22, text: "Software design", type: "task",  start_date: "08-05-2021 00:00", duration: 4, parent: 15, progress: 0.1, open: true},
			{ id: 16, text: "Documentation creation", type: "task",  start_date: "11-05-2021 00:00", duration: 5, parent: 11, progress: 0, open: true},
			{ id: 24, text: "Release v1.0", type: "milestone",  start_date: "19-05-2021 00:00", duration: 0, parent: 11, progress: 0, open: true} 
			
		],
/* 		links: [
			{ id: 1, source: "2", target: "3", type: "0"},
			{ id: 2, source: "3", target: "4", type: "0"},
			{ id: 3, source: "17", target: "25", type: "0"},
			{ id: 4, source: "18", target: "19", type: "0"},
			{ id: 5, source: "19", target: "20", type: "0"},
			{ id: 6, source: "13", target: "24", type: "0"},
			{ id: 7, source: "25", target: "18", type: "0"},
			{ id: 8, source: "5", target: "6", type: "0"},
			{ id: 9, source: "8", target: "9", type: "0"},
			{ id: 10, source: "9", target: "10", type: "0"},
			{ id: 11, source: "16", target: "24", type: "0"},
			{ id: 12, source: "14", target: "15", type: "0"}
		] */
	};
/* 	function generateData(count, dateFrom, dateTo){
		var tasks =  {
			data:[],
			links:[]
		};

		count = parseInt(count, 10) || 100;

		var date = new Date(dateFrom.getFullYear(),5,1);
		var project_id = 1;
		tasks.data.push({
			id:  project_id,
			text: "Project1",
			start_date: date,
			type: gantt.config.types.project,
			open:true
		});
		for (var i = 1; i < count; i++) {
			date = gantt.date.add(date, 1, "day");
			var task = {
				id: i + 1,
				start_date: date,
				text: "Task " + (i + 1),
				duration: 8,
				parent: project_id
			};

			if(gantt.date.add(date, 8, "day").valueOf() > dateTo.valueOf()){
				date = new Date(dateFrom);
				project_id = i + 1;
				delete task.parent;
				task.open = true;
			}
			tasks.data.push(task);

		}
		return tasks;
	} */
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
            <h1 class="m-0">Gantt Chart</h1>
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
		<div class="main-content">
			<div id="gantt_here" style='width:100%; height:100%;padding: 0px;'></div>
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
<script>
	gantt.plugins({
		quick_info: true,
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
		{name: "wbs", label: "WBS", width: 40, template: gantt.getWBSCode, resize: true},
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

	gantt.init("gantt_here");
	gantt.message({text: "Some text", expire: -1});
	gantt.message({text: "Some text", type: "error", expire: -1});
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
	})
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
