<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<!-- BS Stepper -->
<link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
<!-- dropzonejs -->
<link rel="stylesheet" href="plugins/dropzone/min/dropzone.min.css">

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="dist/font/fonts.css" />
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
</style>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("[name=start_date]").val(getToday());

		function getToday(){
		       var date = new Date();
		       var year = date.getFullYear();
		       var month = ("0" + (1 + date.getMonth())).slice(-2);
		       var day = ("0" + date.getDate()).slice(-2);

		       return year + "-" + month + "-" + day;
		}
				
		var proc = "${proc}";
		if(proc=="ins"){
			// 하위 업무 등록 후 모델값 초기화
			$("[name=parent_id]").val("0");
			$("[name=project_name]").val("");
			$("[name=description]").val("");
			
			alert("등록완료\n업무리스트로 이동합니다.")
			location.href = "${path}/task.do?method=list";			
		}
		
		$('#filesize').bind('change', function(){
			alert('filename: '+this.files[0].name+'\n(filesize: '+Math.round(this.files[0].size/1024)+"KB)");
			
		});
		
		$("#sm-dashboard").addClass("menu-open");
		$("#sb-task").addClass("active");
		$("#sb-task").addClass("active");

		$("#insBtn").on("click",function(){
			/* 필수 입력사항 유효성 체크*/
			if($("[name=project_id]").val()==""){
				alert("프로젝트를 선택하세요.");
				return false;
			} else if($("[name=tracker]").val()==""){
				alert("유형을 선택하세요.");
				return false;
			} else if($("[name=subject]").val()==""){
				alert("제목을 입력하세요.");
				return false;
			} else if($("[name=description]").val()==""){
				alert("내용을 입력하세요");
				return false;
			} else if($("[name=priority]").val()==""){
				alert("우선순위를 선택하세요.");
				return false;
			} else if($("[name=account_id]").val()==""){
				alert("담당자를 선택하세요.");
				return false;
			} else if($("[name=start_date]").val()==""){
				alert("시작일을 선택하세요.");
				return false;
			} else if($("[name=due_date]").val()==""){
				alert("완료일을 선택하세요.");
				return false;
			}
			
			/* 그 외 유효성체크 */
			// 진척도에 숫자가 아닌 값을 넣었을 때 유효성 체크
			var done_ratio = Number($("[name=done_ratio]").val());
			if(isNaN(done_ratio) || done_ratio < 0 || done_ratio >= 100 || !(Number.isInteger(done_ratio))){
				alert("새로 만드는 업무는 진척도가 100일 수 없습니다.\n 진척도는 0이상 100미만의 정수만 입력하세요.");
				return false;
			}			
			// 추정시간에 숫자가 아닌 값을 넣었을 때 유효성 체크
			if(isNaN($("[name=estimated]").val())||$("[name=estimated]").val()<0){
				alert("추정시간은 0이상의 숫자만 입력하세요.");
				return false;
			}
			// 상위테스크에 숫자가 아닌 값을 넣었을 때 유효성 체크
			var parent_id = Number($("[name=parent_id]").val());
			if(isNaN(parent_id) || parent_id < 0 || !(Number.isInteger(parent_id))){
				alert("상위테스크번호는 0이상의 정수만 입력하세요.");
				return false;
			}
			// 제목 길이
			if($("[name=subject]").val().length>100){
				alert("제목은 100자 이내로 입력하세요.");
				return false;
			}
			// 내용 길이
			if($("[name=description]").val().length>1000){
				alert("내용은 1000자 이내로 입력하세요.");
				return false;
			}
			// 날짜 설정
			// 날짜 포맷 : yyyy-MM-dd
			// $("[name=start_date]").val().split("-")[i] : - 기준으로 잘라서 배열에 저장하고 각각 0번째, 1번째, 2번째 표기
			// 0번째: yyyy, 1번째: MM, 2번째: dd
			var year_s = $("[name=start_date]").val().split("-")[0];
			var month_s = $("[name=start_date]").val().split("-")[1];
			var day_s = $("[name=start_date]").val().split("-")[2];
			var year_d = $("[name=due_date]").val().split("-")[0];
			var month_d = $("[name=due_date]").val().split("-")[1];
			var day_d = $("[name=due_date]").val().split("-")[2];
			
			if(year_s > year_d){ // 시작연도가 완료연도보다 더 늦을 때(ex. 2021 > 2020)
				alert("완료일의 연도는 시작일의 연도보다 이후여야 합니다.");
				return false;
			} else if(year_s = year_d && (month_s - month_d) > 0){ // (year_s = year_d)이고, 시작월이 완료월보다 더 뒤일 때
				alert("완료일은 시작일 이후여야 합니다.");
				return false;
			} else if(month_s == month_d){ // (year_s < year_d)이고, 월이 같은데
				if((day_s - day_d)>0){ // 일자가 시작일이 더 늦을 때
					alert("완료일은 시작일 이후여야 합니다.");
					return false;
				}
			} // 나머지: year_s < year_d 이고, 월이 같을 때는 완료일이 더 이후고, 아니면 완료일의 달이 더 뒤일 때이므로 참
			
			/* 달력 색깔 추가 */
			if($("[name=tracker]").val()=='새기능'){
				$("[name=backgroundColor]").val("#4f5fd4");
			} else if($("[name=tracker]").val()=='결함'){
				$("[name=backgroundColor]").val("#fc987d");
			} else if($("[name=tracker]").val()=='지원'){
				$("[name=backgroundColor]").val("#439981");
			}
			
			$("form").submit();
		});
	
		/* 유효성 체크 */
		/*
		var projcet_id = $("[name=project_id]").val();
		var status = $("[name=status]").val();
		var tracker = $("[name=tracker]").val();
		var parent_id = $("[name=parent_id]").val();
		var subject = $("[name=subject]").val();
		var description = $("[name=description]").val();
		var priority = $("[name=priority]").val();
		var account_id = $("[name=account_id]").val();
		var start_date = $("[name=start_date]").val();
		var done_ratio = $("[name=done_ratio]").val();
		var due_date = $("[name=due_date]").val();
		var estimated = $("[name=estimated]").val();
		alert("projcet_id "+projcet_id);
		alert("status "+status);
		alert("tracker "+tracker);
		alert("parent_id "+parent_id);
		alert("subject "+subject);
		alert("description "+description);
		alert("priority "+priority);
		alert("account_id "+account_id);
		alert("start_date "+start_date);
		alert("done_ratio "+done_ratio);
		alert("due_date "+due_date);
		alert("estimated "+estimated);
		*/
		
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
							<h1 class="m-0">업무</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
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
				<form:form modelAttribute="task"
					action="${path}/task.do?method=insert"
					enctype="multipart/form-data" method="post">

					<div class="container-fluid">
						<!-- SELECT2 EXAMPLE -->
						<div class="card card-default">
							<div class="card-header">
								<h3 class="card-title">새 업무 만들기</h3>

								<form:hidden path="backgroundColor" />
								<input type="hidden" name="document_id" value="Task" />
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<%-- 하위 업무 등록 --%>
											<c:choose>
												<c:when test="${task.parent_id!=0}">
													<label>프로젝트</label>
													<input type="text" name="project_name"
														value="${task.project_name}" class="form-control" readonly >
													<form:hidden path="project_id"/>
												</c:when>
												<%-- 일반 업무 등록 --%>
												<c:otherwise>
													<label>프로젝트</label>
													<input type="hidden" name="project_id" value="${project.id}"/>
													<input type="text" value="${project.name}" class="form-control" readonly/>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label>상태</label>
											<input name="status" value="신규" class="form-control" readonly/>
										</div>
										<!-- /.form-group -->
									</div>
									<!-- /.col -->
									<div class="col-md-6">
										<div class="form-group">
											<label>유형 *</label>
											<form:select path="tracker" class="form-control select"
												style="width: 100%;">
												<option value="">유형 선택</option>
												<form:option value="결함" label="결함" />
												<form:option value="새기능" label="새기능" />
												<form:option value="지원" label="지원" />
											</form:select>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label>상위업무번호</label>
											<c:choose>
											<c:when test="${task.parent_id != 0}">
												<input name="parent_id" value="${task.parent_id}" type="text" class="form-control"
													style="width: 100%;" readonly/>
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
											<label>제목 *</label>
											<form:input path="subject" type="text" class="form-control"
												style="width: 100%;" />
										</div>
										<div class="form-group">
											<label>설명 *</label>
											<form:textarea path="description" class="form-control"
												style="width: 100%; height:300px;" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>우선순위 *</label>
											<form:select path="priority" class="form-control select"
												style="width: 100%;">
												<option value="">우선순위</option>
												<form:option value="1" label="낮음" />
												<form:option value="2" label="보통" />
												<form:option value="3" label="높음" />
												<form:option value="4" label="긴급" />
												<form:option value="5" label="즉시" />
											</form:select>
										</div>
										<!-- /.form-group -->
										<div class="form-group">
											<label>담당자 *</label>
											<%-- TODO: account테이블 이용해서 담당자명(역할)형식으로 띄우기. value는 넘길 값에 따라서 설정 --%>
											<form:select path="account_id" class="form-control select"
												style="width: 100%;">
												<option value="">담당자 선택</option>
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
											<label>시작일 *</label><br>
											<div class="input-group date" id="startdate"
												data-target-input="nearest">
												<form:input path="start_date" type="date" class="form-control" style="width:100%;" />
											</div>
										</div>
										<div class="form-group">
											<label>완료일 *</label>
											<div class="input-group date" id="enddate"
												data-target-input="nearest">
												<form:input path="due_date" type="date" class="form-control"
													style="width:100%;" />
											</div>
										</div>
										<!-- /.form-group -->
									</div>
									<!-- /.col -->
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>진척도(%)</label>
											<form:input path="done_ratio" type="text"
												class="form-control" style="width: 100%;"
												placeholder="%(숫자만 입력하세요)" />
										</div>
										<!-- /.form-group -->
									</div>
									<!-- /.col -->
									<div class="col-md-6">
										<div class="form-group">
											<label>추정시간</label>
											<form:input path="estimated" type="text" class="form-control"
												style="width: 100%;" placeholder="시간(숫자만 입력하세요)" />
										</div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
								<div class="row">
									<div class="col-md">
										<div class="form-group">
											<label for="exampleInputFile">첨부파일</label>
											<div class="custom-file">
												<input type="file" id="filesize" class="custom-file-label"
													name="report" style="width: 100%;" />
											</div>
										</div>
										<!-- /.form-group -->
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<button type="button" class="btn btn-primary" id="insBtn">만들기</button>
								<button type="button" class="btn btn-primary"
									onclick="location.href='${path}/task.do?method=list'">취소</button>
							</div>
							<!--/.col (right) -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</form:form>
			</section>
			<!-- /.content -->
		</div>
		<!-- Footer -->
		<jsp:include page="../a00_common/a02_footer.jsp" />

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
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>

	<!-- Select2 -->
	<script src="plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<!-- InputMask -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script
		src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
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