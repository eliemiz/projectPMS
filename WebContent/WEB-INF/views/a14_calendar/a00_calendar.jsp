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
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear prev today next nextYear',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			themeSystem: 'bootstrap',
			initialDate : new Date().toISOString(), // 현재날짜로 초기 로딩 날짜 설정
			navLinks : true,
			selectable : true,
			selectMirror : true,
			editable : true,
			dayMaxEvents : true,
			eventClick : function(arg){
				console.log("# 등록된 일정 클릭 #");
				console.log(arg.event);
				console.log(arg.event.id);
				console.log(arg.event.extendedProps);
				location.href = "${path}/task.do?method=detail&id="+arg.event.id;
				
			},
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
		    <legend onclick="toggleFieldset(this);" class="icon icon-expended">Filters</legend>
		    <div style="">
			<table id="filters-table">
			<tbody>
				<tr class="filter" id="tr_status_id">
					<td class="field">
						<input checked="checked" id="cb_status_id" name="f[]" value="status_id" type="checkbox">
						<label for="cb_status_id"> Status</label>
					</td>
					<td class="operator">
						<select id="operators_status_id" name="op[status_id]">
							<option value="o">open</option>
							<option value="=">is</option>
							<option value="!">is not</option>
							<option value="c">closed</option>
							<option value="*">any</option>
						</select>
					</td>
					<td class="values">
						<span style="display:none;">
							<select class="value" id="values_status_id_1" name="v[status_id][]" disabled="disabled">
								<option value="1">신규</option>
								<option value="2">진행</option>
								<option value="3">해결</option>
								<option value="4">의견</option>
								<option value="5">완료</option>
								<option value="6">거절</option>
							</select>
							<span class="toggle-multiselect icon-only icon-toggle-plus">&nbsp;</span>
						</span>
					</td>
					<td>
						<div class="add-filter">
							<label for="add_filter_select">Add filter</label>
							<select id="add_filter_select">
								<option value="">&nbsp;</option>
								<option value="status_id" disabled="disabled">Status</option>
								<option value="project_id">Project</option>
								<option value="tracker_id">Tracker</option>
								<option value="priority_id">Priority</option>
								<option value="author_id">Author</option>
								<option value="assigned_to_id">Assignee</option>
								<option value="fixed_version_id">Target version</option>
								<option value="subject">Subject</option>
								<option value="description">Description</option>
								<option value="done_ratio">% Done</option>
								<option value="attachment">File</option>
								<option value="updated_by">Updated by</option>
								<option value="last_updated_by">Last updated by</option>
								<option value="issue_id">Issue</option>
								<optgroup label="Assignee"><option value="member_of_group">Assignee's group</option>
									<option value="assigned_to_role">Assignee's role</option>
								</optgroup>
								<optgroup label="Target version">
									<option value="fixed_version.due_date">Target version's Due date</option>
									<option value="fixed_version.status">Target version's Status</option>
								</optgroup>
								<optgroup label="Date">
									<option value="created_on">Created</option>
									<option value="updated_on">Updated</option>
									<option value="closed_on">Closed</option>
									<option value="start_date">Start date</option>
									<option value="due_date">Due date</option>
								</optgroup>
								<optgroup label="Time tracking">
									<option value="estimated_hours">Estimated time</option>
									<option value="spent_time">Spent time</option>
								</optgroup><optgroup label="Project">
									<option value="project.status">Project's Status</option>
								</optgroup>
								<optgroup label="Relations">
									<option value="relates">Related to</option>
									<option value="duplicates">Is duplicate of</option>
									<option value="duplicated">Has duplicate</option>
									<option value="blocks">Blocks</option>
									<option value="blocked">Blocked by</option>
									<option value="precedes">Precedes</option>
									<option value="follows">Follows</option>
									<option value="copied_to">Copied to</option>
									<option value="copied_from">Copied from</option>
									<option value="parent_id">Parent task</option>
									<option value="child_id">Subtasks</option>
								</optgroup>
							</select>
						</div>
					</td>
				</tr>
			</tbody>
			</table>				
<!-- 			<div class="add-filter">
				<label for="add_filter_select">Add filter</label>
				<select id="add_filter_select">
					<option value="">&nbsp;</option>
					<option value="status_id" disabled="disabled">Status</option>
					<option value="project_id">Project</option>
					<option value="tracker_id">Tracker</option>
					<option value="priority_id">Priority</option>
					<option value="author_id">Author</option>
					<option value="assigned_to_id">Assignee</option>
					<option value="fixed_version_id">Target version</option>
					<option value="subject">Subject</option>
					<option value="description">Description</option>
					<option value="done_ratio">% Done</option>
					<option value="attachment">File</option>
					<option value="updated_by">Updated by</option>
					<option value="last_updated_by">Last updated by</option>
					<option value="issue_id">Issue</option>
					<optgroup label="Assignee"><option value="member_of_group">Assignee's group</option>
						<option value="assigned_to_role">Assignee's role</option>
					</optgroup>
					<optgroup label="Target version">
						<option value="fixed_version.due_date">Target version's Due date</option>
						<option value="fixed_version.status">Target version's Status</option>
					</optgroup>
					<optgroup label="Date">
						<option value="created_on">Created</option>
						<option value="updated_on">Updated</option>
						<option value="closed_on">Closed</option>
						<option value="start_date">Start date</option>
						<option value="due_date">Due date</option>
					</optgroup>
					<optgroup label="Time tracking">
						<option value="estimated_hours">Estimated time</option>
						<option value="spent_time">Spent time</option>
					</optgroup><optgroup label="Project">
						<option value="project.status">Project's Status</option>
					</optgroup>
					<optgroup label="Relations">
						<option value="relates">Related to</option>
						<option value="duplicates">Is duplicate of</option>
						<option value="duplicated">Has duplicate</option>
						<option value="blocks">Blocks</option>
						<option value="blocked">Blocked by</option>
						<option value="precedes">Precedes</option>
						<option value="follows">Follows</option>
						<option value="copied_to">Copied to</option>
						<option value="copied_from">Copied from</option>
						<option value="parent_id">Parent task</option>
						<option value="child_id">Subtasks</option>
					</optgroup>
				</select>
				</div> -->				
				<input type="hidden" name="f[]" id="f_" value="">				
			</div>
			</fieldset>
		</div>			
<!-- 		<p class="buttons">
			<label for="month">Month</label>
			<select id="month" name="month">
				<option value="1">January</option>
				<option value="2">February</option>
				<option value="3">March</option>
				<option value="4" selected="selected">April</option>
				<option value="5">May</option>
				<option value="6">June</option>
				<option value="7">July</option>
				<option value="8">August</option>
				<option value="9">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select>				
			<label for="year">Year</label>
			<select id="year" name="year">
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021" selected="selected">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
			</select>				
			<a href="#" onclick="$(&quot;#query_form&quot;).submit(); return false;" class="icon icon-checked">Apply</a>
			<a class="icon icon-reload" href="/redmine/issues/calendar?set_filter=1">Clear</a> 
		</p>-->
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