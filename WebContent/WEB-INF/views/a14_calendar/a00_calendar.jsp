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

	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	
	  #calendar {
	  	background-color:white;
	    max-width: 100%;
	    margin: 0 auto;
	  }

  </style>
<script src='a00_com/lib/main.js'></script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2021-04-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2021-04-01'
        },
        {
          title: 'Long Event',
          start: '2021-04-07',
          end: '2021-04-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-04-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-04-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2021-04-11',
          end: '2021-04-13'
        },
        {
          title: 'Meeting',
          start: '2021-04-12T10:30:00',
          end: '2021-04-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2021-04-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2021-04-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2021-04-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2021-04-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2021-04-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2021-04-28'
        }
      ]
    });

    calendar.render();
  });
  function addFilter(field, operator, values) {
	  var fieldId = field.replace('.', '_');
	  var tr = $('#tr_'+fieldId);

	  var filterOptions = availableFilters[field];
	  if (!filterOptions) return;

	  if (filterOptions['remote'] && filterOptions['values'] == null) {
	    $.getJSON(filtersUrl, {'name': field}).done(function(data) {
	      filterOptions['values'] = data;
	      addFilter(field, operator, values) ;
	    });
	    return;
	  }

	  if (tr.length > 0) {
	    tr.show();
	  } else {
	    buildFilterRow(field, operator, values);
	  }
	  $('#cb_'+fieldId).prop('checked', true);
	  toggleFilter(field);
	  $('#add_filter_select').val('').find('option').each(function() {
	    if ($(this).attr('value') == field) {
	      $(this).attr('disabled', true);
	    }
	  });
	}
  function initFilters() {
	  $('#add_filter_select').change(function() {
	    addFilter($(this).val(), '', []);
	  });
	  $('#filters-table td.field input[type=checkbox]').each(function() {
	    toggleFilter($(this).val());
	  });
	  $('#filters-table').on('click', 'td.field input[type=checkbox]', function() {
	    toggleFilter($(this).val());
	  });
	  $('#filters-table').on('click', '.toggle-multiselect', function() {
	    toggleMultiSelect($(this).siblings('select'))
	    $(this).toggleClass('icon-toggle-plus icon-toggle-minus')
	  });
	  $('#filters-table').on('keypress', 'input[type=text]', function(e) {
	    if (e.keyCode == 13) $(this).closest('form').submit();
	  });
	}
  function toggleFieldset(el) {
	  var fieldset = $(el).parents('fieldset').first();
	  fieldset.toggleClass('collapsed');
	  fieldset.children('legend').toggleClass('icon-expended icon-collapsed');
	  fieldset.children('div').toggle();
	}
	//<![CDATA[
	
	var operatorLabels = {"=":"is","!":"is not","o":"open","c":"closed","!*":"none","*":"any","\u003e=":"\u003e=","\u003c=":"\u003c=","\u003e\u003c":"between","\u003ct+":"in less than","\u003et+":"in more than","\u003e\u003ct+":"in the next","t+":"in","nd":"tomorrow","t":"today","ld":"yesterday","nw":"next week","w":"this week","lw":"last week","l2w":"last 2 weeks","nm":"next month","m":"this month","lm":"last month","y":"this year","\u003et-":"less than days ago","\u003ct-":"more than days ago","\u003e\u003ct-":"in the past","t-":"days ago","~":"contains","!~":"doesn't contain","^":"starts with","$":"ends with","=p":"any issues in project","=!p":"any issues not in project","!p":"no issues in project","*o":"any open issues","!o":"no open issues"};
	var operatorByType = {"list":["=","!"],"list_status":["o","=","!","c","*"],"list_optional":["=","!","!*","*"],"list_subprojects":["*","!*","=","!"],"date":["=","\u003e=","\u003c=","\u003e\u003c","\u003ct+","\u003et+","\u003e\u003ct+","t+","nd","t","ld","nw","w","lw","l2w","nm","m","lm","y","\u003et-","\u003ct-","\u003e\u003ct-","t-","!*","*"],"date_past":["=","\u003e=","\u003c=","\u003e\u003c","\u003et-","\u003ct-","\u003e\u003ct-","t-","t","ld","w","lw","l2w","m","lm","y","!*","*"],"string":["~","=","!~","!","^","$","!*","*"],"text":["~","!~","^","$","!*","*"],"integer":["=","\u003e=","\u003c=","\u003e\u003c","!*","*"],"float":["=","\u003e=","\u003c=","\u003e\u003c","!*","*"],"relation":["=","!","=p","=!p","!p","*o","!o","!*","*"],"tree":["=","~","!*","*"]};
	var availableFilters = {"status_id":{"type":"list_status","name":"Status","remote":true,"values":[["신규","1"],["진행","2"],["해결","3"],["의견","4"],["완료","5"],["거절","6"]]},"project_id":{"type":"list","name":"Project","remote":true},"tracker_id":{"type":"list","name":"Tracker","values":[["결함","1"],["새기능","2"],["지원","3"]]},"priority_id":{"type":"list","name":"Priority","values":[["낮음","1"],["보통","2"],["높음","3"],["긴급","4"],["즉시","5"]]},"author_id":{"type":"list","name":"Author","remote":true},"assigned_to_id":{"type":"list_optional","name":"Assignee","remote":true},"member_of_group":{"type":"list_optional","name":"Assignee's group","remote":true},"assigned_to_role":{"type":"list_optional","name":"Assignee's role","remote":true},"fixed_version_id":{"type":"list_optional","name":"Target version","remote":true},"fixed_version.due_date":{"type":"date","name":"Target version's Due date","values":null},"fixed_version.status":{"type":"list","name":"Target version's Status","values":[["open","open"],["locked","locked"],["closed","closed"]]},"subject":{"type":"text","name":"Subject","values":null},"description":{"type":"text","name":"Description","values":null},"created_on":{"type":"date_past","name":"Created","values":null},"updated_on":{"type":"date_past","name":"Updated","values":null},"closed_on":{"type":"date_past","name":"Closed","values":null},"start_date":{"type":"date","name":"Start date","values":null},"due_date":{"type":"date","name":"Due date","values":null},"estimated_hours":{"type":"float","name":"Estimated time","values":null},"spent_time":{"type":"float","name":"Spent time","values":null},"done_ratio":{"type":"integer","name":"% Done","values":null},"attachment":{"type":"text","name":"File","values":null},"updated_by":{"type":"list","name":"Updated by","remote":true},"last_updated_by":{"type":"list","name":"Last updated by","remote":true},"project.status":{"type":"list","name":"Project's Status","remote":true},"relates":{"type":"relation","name":"Related to","remote":true},"duplicates":{"type":"relation","name":"Is duplicate of","remote":true},"duplicated":{"type":"relation","name":"Has duplicate","remote":true},"blocks":{"type":"relation","name":"Blocks","remote":true},"blocked":{"type":"relation","name":"Blocked by","remote":true},"precedes":{"type":"relation","name":"Precedes","remote":true},"follows":{"type":"relation","name":"Follows","remote":true},"copied_to":{"type":"relation","name":"Copied to","remote":true},"copied_from":{"type":"relation","name":"Copied from","remote":true},"parent_id":{"type":"tree","name":"Parent task","values":null},"child_id":{"type":"tree","name":"Subtasks","values":null},"issue_id":{"type":"integer","name":"Issue","values":null}};
	var labelDayPlural = "days";
	
	var filtersUrl = "";
	
	$(document).ready(function(){
	  initFilters();
	  addFilter("status_id", "o", [""]);
	});
	
	//]]>
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
				</tr>
			</tbody>
			</table>				
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

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
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