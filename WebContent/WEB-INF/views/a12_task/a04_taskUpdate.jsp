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
  <title>AdminLTE 3 | Dashboard</title>
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="plugins/dropzone/min/dropzone.min.css">
  
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
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="dist/font/fonts.css"/>
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
</style>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	var proc = "${param.proc}";
	
	if(proc=="upt"){
		if(confirm("?????????????????????.\n?????? ????????????????????? ?????????????????????????")){
			location.href = "${path}/task.do?method=list";		
		}			
	}
	
	
	
	$(document).ready(function(){
		$("#sm-dashboard").addClass("menu-open");
		$("#sb-task").addClass("active");
		$("#sb-task").addClass("active");
		
		/* ?????? ?????? ??? ????????? & ??????????????? alert */
		$('#filesize').bind('change', function(){
			alert('filename: '+this.files[0].name+'\n(filesize: '+Math.round(this.files[0].size/1024)+"KB)");
			
		});

		/* ?????? ?????? ????????? ??? ?????? ?????? */
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
		
		/* ???????????? ?????? */
		$("#gomain").click(function(){
			if(confirm("?????? ?????????????????? ?????????????????????????")){
				$(location).attr("href","${path}/task.do?method=list");
			}
		});
		
		/* ???????????? ?????? */
		$("#uptBtn").on("click",function(){
			/* ?????? ???????????? ????????? ??????*/
			if($("[name=project_id]").val()==""){
				alert("??????????????? ???????????????.");
				return false;
			} else if($("[name=tracker]").val()==""){
				alert("????????? ???????????????.");
				return false;
			} else if($("[name=subject]").val()==""){
				alert("????????? ???????????????.");
				return false;
			} else if($("[name=description]").val()==""){
				alert("????????? ???????????????");
				return false;
			} else if($("[name=priority]").val()==""){
				alert("??????????????? ???????????????.");
				return false;
			} else if($("[name=account_id]").val()==""){
				alert("???????????? ???????????????.");
				return false;
			} else if($("[name=start_date]").val()==""){
				alert("???????????? ???????????????.");
				return false;
			} else if($("[name=due_date]").val()==""){
				alert("???????????? ???????????????.");
				return false;
			}
			
			/* ??? ??? ??????????????? */
			// ???????????? ????????? ?????? ?????? ????????? ??? ????????? ??????
			var done_ratio = Number($("[name=done_ratio]").val());
			if(isNaN(done_ratio) || done_ratio < 0 || done_ratio > 100 || !(Number.isInteger(done_ratio))){
				alert("???????????? 0?????? 100????????? ????????? ???????????????.");
				return false;
			}			
			// ??????????????? ????????? ?????? ?????? ????????? ??? ????????? ??????
			if(isNaN($("[name=estimated]").val())||$("[name=estimated]").val()<0){
				alert("??????????????? 0????????? ????????? ???????????????.");
				return false;
			}
			// ?????????????????? ????????? ?????? ?????? ????????? ??? ????????? ??????
			var parent_id = Number($("[name=parent_id]").val());
			if(isNaN(parent_id) || parent_id < 0 || !(Number.isInteger(parent_id))){
				alert("???????????????????????? 0????????? ????????? ???????????????.");
				return false;
			}
			// ?????? ??????
			if($("[name=subject]").val().length>100){
				alert("????????? 100??? ????????? ???????????????.");
				return false;
			}
			// ?????? ??????
			if($("[name=description]").val().length>1000){
				alert("????????? 1000??? ????????? ???????????????.");
				return false;
			}
			// ?????? ??????
			// ?????? ?????? : yyyy-MM-dd
			// $("[name=start_date]").val().split("-")[i] : - ???????????? ????????? ????????? ???????????? ?????? 0??????, 1??????, 2?????? ??????
			// 0??????: yyyy, 1??????: MM, 2??????: dd
			var year_s = $("[name=start_date]").val().split("-")[0];
			var month_s = $("[name=start_date]").val().split("-")[1];
			var day_s = $("[name=start_date]").val().split("-")[2];
			var year_d = $("[name=due_date]").val().split("-")[0];
			var month_d = $("[name=due_date]").val().split("-")[1];
			var day_d = $("[name=due_date]").val().split("-")[2];
			if(year_s > year_d){ // ??????????????? ?????????????????? ??? ?????? ???(ex. 2021 > 2020)
				alert("???????????? ????????? ???????????? ???????????? ???????????? ?????????.");
				return false;
			} else if(year_s = year_d && (month_s - month_d) > 0){ // (year_s = year_d)??????, ???????????? ??????????????? ??? ?????? ???
				alert("???????????? ????????? ???????????? ?????????.");
				return false;
			} else if(month_s == month_d){ // (year_s < year_d)??????, ?????? ?????????
				if((day_s - day_d)>0){ // ????????? ???????????? ??? ?????? ???
					alert("???????????? ????????? ???????????? ?????????.");
					return false;
				}
			} // ?????????: year_s < year_d ??????, ?????? ?????? ?????? ???????????? ??? ?????????, ????????? ???????????? ?????? ??? ?????? ???????????? ???
			
			if(confirm("?????????????????????????")){
				$("[name=proc]").val("upt");
				$("form").attr("action","${path}/task.do?method=update");
				$("form").submit();
			}
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
            <h1 class="m-0">??????</h1>
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
    <form:form modelAttribute="task" enctype="multipart/form-data" method="post">
	<input type="hidden" name="proc"/>
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">${task.tracker}&nbsp;&nbsp;#${task.id}</h3>
        	<form:hidden path="id"/>
 <%--        	<form:hidden path="created_on"/> --%>
  <%--       	<form:hidden path="updated_on"/> --%>
  <%--       	<form:hidden path="completed_on"/> --%>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>????????????</label>
                  <%-- <form:select path="project_id" class="form-control select2" style="width: 100%;">
                    <option value="">???????????? ??????</option>
                    <c:forEach var = "project" items="${projects}">
                    	<form:option value="${project.id}">${project.name}</form:option>
                    </c:forEach>
                  </form:select> --%>
                  <input name="project_name" class="form-control" value="${task.project_name}" readonly/>
                  <input type="hidden" name="project_id" value="${task.project_id}"/>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>?????? *</label>
                  <form:select path="status" class="form-control select" style="width: 100%;">
                     <option value="">?????? ??????</option>
                     <form:option value="??????" label="??????"/>
                     <form:option value="??????" label="??????"/>
                     <form:option value="????????????" label="????????????"/>
                  </form:select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>??????</label>
                  <input name="tracker" class="form-control" value="${task.tracker}" readonly/>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
				  <label>??????????????????</label>
                  <c:choose>
					<c:when test="${task.parent_id != 0}">
						<input name="parent_id" value="${task.parent_id}" type="text" class="form-control" style="width: 100%;" readonly/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="parent_id" value="0"/>
						<input type="text" class="form-control" value="-" readonly/>
					</c:otherwise>
				  </c:choose>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <div class="row">
            	<div class="col-md">
	            	<div class="form-group">
	            		<label>?????? *</label>
	            		<form:input path="subject" value="${task.subject}" type="text" class="form-control" style="width: 100%;"/>
	            	</div>
            	</div>
            </div>
            <div class="row">
            	<div class="col-md">
	            	<div class="form-group">
	            		<label>?????? *</label>            	
	            		<form:textarea path="description" value="${task.description}" class="form-control" style="width: 100%; height:300px;"/>
	            	</div>
            	</div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>???????????? *</label>
                  <form:select path="priority" class="form-control select" style="width: 100%;">
                  	<option value="">????????????</option>
                    <form:option value="1" label="??????"/>
                    <form:option value="2" label="??????"/>
                   	<form:option value="3" label="??????"/>
                    <form:option value="4" label="??????"/>
                    <form:option value="5" label="??????"/>
                  </form:select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>?????????</label>
                  <form:select path="account_id" class="form-control select" style="width: 100%;">
                  	<option value="">????????? ??????</option>
                  	<c:forEach var="account" items="${accounts}">
	                    <form:option value="${account.id}">${account.name}(${account.auth})</form:option>
                    </c:forEach>
                  </form:select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <!-- Date -->
                <div class="form-group">
                  <label>?????????</label><br>
                  <div class="input-group date" id="startdate" data-target-input="nearest">
                       <form:input path="start_date" value="${task.start_date}" type="date" class="form-control" style="width:100%;"/>
                    </div>
                </div>
                <div class="form-group">
                  <label>?????????</label>
                   <div class="input-group date" id="enddate" data-target-input="nearest">
                       <form:input path="due_date" value="${task.due_date}" type="date" class="form-control" style="width:100%;"/>
                   </div>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <div class="row">
              <div class="col-md-6">                
                <div class="form-group">
                  <label>?????????(%)</label>
                  <form:input path="done_ratio" value="${done_ratio}" type="text" class="form-control" style="width: 100%;" placeholder="%(????????? ???????????????)"/>
                </div>                  
                <!-- /.form-group -->
                <c:set var="fcnt" value="${task.fileInfo.size()}"/>
     			<c:forEach var="finf" items="${task.fileInfo}" varStatus="sts">
                <div class="form-group">
                  <label for="exampleInputFile">????????????</label> 
                    <!-- ?????? ?????????  -->   
                  <input class="form-control fileInfo" name="filenames" value="${finf.filename}" readonly/>
                </div>
                </c:forEach>
              </div>
              <!-- /.col -->
              <div class="col-md-6">
              	<div class="form-group">
                  <label>????????????</label>
                  <form:input path="estimated" value="${task.estimated}" type="text" class="form-control" style="width: 100%;" placeholder="??????(????????? ???????????????)"/>
                </div>  
                <div class="form-group">
                  <c:if test="${not empty task.fileInfo}">
                  <label for="exampleInputFile">???????????? ??????</label>
                  <div class="custom-file">
                  	<input type="file" id="filesize" class="custom-file-label" name="report" style="width:100%;"/>
                  </div>
                  </c:if>
                </div>               
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            	            
			</div> 			
			<!-- /.card-body -->
                <div class="card-footer">
                  <input type="button" class="btn btn-primary" id="uptBtn" value="??????"/>
                  <input type="button" class="btn btn-primary" id="gomain" value="??????"/>
                </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
      </form:form>
    </section>
    <!-- /.content -->
  </div>
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

<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- BS-Stepper -->
<script src="plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- Page specific script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Date range picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });
    $(function () {
    	  bsCustomFileInput.init();
    	});

  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  });

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false;

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template");
  previewNode.id = "";
  var previewTemplate = previewNode.parentNode.innerHTML;
  previewNode.parentNode.removeChild(previewNode);

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  });

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
  });

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
  });

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1";
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
  });

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0";
  });

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
  };
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true);
  };
  // DropzoneJS Demo Code End
  
</script>
</body>
</html>