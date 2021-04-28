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
  <title>RiskUpdate</title>

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
<script type="text/javascript">
	var proc = "${param.proc}";
	if(proc=="upt"){
		if(confirm("수정 완료\n 목록 페이지로 이동하시겠습니까?"))
		location.href = "${path}/risk.do?method=list";			
	}
	if(proc=="del"){
		alert("삭제 완료\n목록 페이지로 이동합니다.");
		location.href = "${path}/risk.do?method=list";			
	}
	$(document).ready(function(){
		$("#sb-risk").addClass("active");
		$("#hd-project-list").change(function(){
			location.href="${path}/risk.do?projectId="+$(this).val();
		});
		$(".custom-file-input").on("change",function(){
			$(this).next(".custom-file-label").text($(this).val());
		});
		$("#canBtu").click(function(){
			if(confirm("목록 페이지로 이동하시겠습니까?")){
				$(location).attr("href","${path}/risk.do?method=list");
			}
		});
		$("#uptBtu").on("click",function(){
			if($("[name=subject]").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}else if($("[name=subject]").val().length >= 100) {
				alert("제목은 100자 미만으로 입력해주세요.");
				return false;
			}else if($("[name=description]").val().length >= 1000){
				alert("상세설명은 1000자 미만으로 입력해주세요.");
				return false;	
			}else if($("[name=start_date]").val()==""){
				alert("예상시작일을 입력하세요.");
				return false;
			}else if($("[name=end_date]").val()==""){
				alert("예상종료일을 입력하세요.");
				return false;
			}
			if(confirm("수정하시겠습니까?")){
				$("[name=proc]").val("upt");
				$("form").attr("action","${path}/risk.do?method=update");
				$("form").submit();
			}
		});
		$("#delBtu").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				$("[name=proc]").val("del");
				$("form").attr("action","${path}/risk.do?method=delete");
				$("form").submit();
			}
		});		
	})
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
            <h1 class="m-0">Risk</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Risk</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
    <form:form modelAttribute="risk"
    	enctype="multipart/form-data" method="post">
     <input type="hidden" name="proc"/>
     <div class="card card-primary">
      <div class="card-header">
       <h3 class="card-title">리스크 수정</h3>
         </div>
           <!-- /.card-header -->
           <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">제목</label>
                    <c:if test="${account.auth=='Manager'}">
                    	<form:input type="email" class="form-control" value="${risk.subject}" path="subject"/>
                    </c:if>
                    <c:if test="${account.auth!='Manager'}">
                    	<form:input type="email" class="form-control" value="${risk.subject}" path="subject"
                    	readonly="true"/>
                    </c:if>
                    <form:hidden path="id"/>
                  </div>
                  <div class="row">                 
                  <div class="col-md-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">상태</label>
	                      <div class="form-group">
	                        <form:select path="status" class="form-control select2">
	                          <form:option value="진행" label="진행"/>
	                          <form:option value="결재요청" label="결재요청"/>
	                          <c:if test="${account.auth=='Manager'}">	                         
	                          <form:option value="검토" label="검토"/>
	                          <form:option value="재할당" label="재할당"/>
	                          <form:option value="완료" label="완료"/>  
	                          <form:option value="반려 " label="반려"/>  
	                          </c:if>
	                        </form:select>
	                      </div>
	              </div>
	              <div class="form-group">
                    <label for="exampleInputEmail1">범주</label>
	                      <div class="form-group">
	                      <c:if test="${account.auth=='Manager'}">
	                        <form:select path="category" class="form-control select2">
	                          <form:option value="내부적 문제" label="내부적 문제"/>
		                        <form:option value="외부적 문제" label="외부적 문제"/>
		                        <form:option value="기술적 문제" label="기술적 문제"/>
		                        <form:option value="예측불가" label="예측불가"/>
	                        </form:select>
	                      </c:if>
	                      <c:if test="${account.auth!='Manager'}">
	                      	<form:input path="category" class="form-control select2" readonly="true"/>
	                      </c:if>
	                      </div>
	              </div>
	              <div class="form-group">
                    <label for="exampleInputEmail1">담당자</label>
                    <c:if test="${account.auth=='Manager'}">
                    <form:select path="account_id" class="form-control select" style="width: 100%;">
	                 <option value="">담당자 선택</option>
	                  	<c:forEach var="account" items="${accounts}">
		                    <form:option value="${account.id}">${account.name}(${account.auth})</form:option>
	                    </c:forEach>
                 	</form:select>     
                 	</c:if>
                 	<c:if test="${account.auth!='Manager'}">   
                 	  <input type="hidden" name="account_id" value="${account_id}"/>
                 	  <input type="text" class="form-control" style="width: 100%;" value="${account.name}" readonly="readonly"/>
                 	</c:if>      
                  </div>
                  </div>
                  
                  <div class="col-md-6">
                  
                  </div>
                  </div>
	              
                  <div class="form-group">
                    <label for="exampleInputPassword1">상세설명</label>
                    <form:textarea path="description" class="form-control" style="width:100%; height:300px;"/>
                  </div>
                  
                  <div class="row">                 
	                  <div class="col-md-6">
		                  <div class="form-group">	               
		                    <label for="exampleInputEmail1">발생가능성</label>
		                    	<div class="form-group">
		                    	<c:if test="${account.auth=='Manager'}">
			                      <form:select path="probability" class="form-control select2">
			                        <form:option value="1" label=" 미세 "/>
			                        <form:option value="2" label=" 낮음 "/>
			                        <form:option value="3" label=" 보통 "/>
			                        <form:option value="4" label=" 높음 "/>
			                        <form:option value="5" label=" 확실 "/>
			                      </form:select>
			                    </c:if>
			                    <c:if test="${account.auth!='Manager'}">
			                   	  <form:select path="probability" class="form-control select2" readonly="true">
			                        <form:option value="1" label=" 미세 "/>
			                        <form:option value="2" label=" 낮음 "/>
			                        <form:option value="3" label=" 보통 "/>
			                        <form:option value="4" label=" 높음 "/>
			                        <form:option value="5" label=" 확실 "/>
			                      </form:select>
			                    </c:if>
			                    </div>
		                  </div>
		                  <div class="form-group">
		                    <label for="exampleInputEmail1">영향도</label>
		                    <div class="form-group">
		                    <c:if test="${account.auth=='Manager'}">
			                      <form:select path="impact" class="form-control select2">
			                        <form:option value="1" label=" 미세 "/>
			                        <form:option value="2" label=" 낮음 "/>
			                        <form:option value="3" label=" 보통 "/>
			                        <form:option value="4" label=" 중요 "/>
			                        <form:option value="5" label=" 치명적 "/>
			                      </form:select>
			                </c:if>
			                <c:if test="${account.auth!='Manager'}">
			                	  <form:select path="impact" class="form-control select2" readonly="true">
			                        <form:option value="1" label=" 미세 "/>
			                        <form:option value="2" label=" 낮음 "/>
			                        <form:option value="3" label=" 보통 "/>
			                        <form:option value="4" label=" 중요 "/>
			                        <form:option value="5" label=" 치명적 "/>
			                      </form:select>
			                </c:if>
			                </div>
		                  </div>
		              </div>
	                  <div class="col-md-6">
			              <div class="form-group">
		                    <label for="exampleInputEmail1">예상시작일</label>
		                    <c:if test="${account.auth=='Manager'}">
		                    <form:input path="start_date" value="${risk.start_date}" type="date"
		                    	class="form-control"/>
		                    </c:if>
		                    <c:if test="${account.auth!='Manager'}">
		                    <form:input path="end_date" value="${risk.start_date}" type="date"
		                     	class="form-control" readonly="true"/>
		                    </c:if>	
		                  </div>
		                  <div class="form-group">
		                    <label for="exampleInputEmail1">예상종료일</label>
		                    <c:if test="${account.auth=='Manager'}">
		                    <form:input path="end_date" value="${risk.end_date}" type="date"
		                     	class="form-control"/>
		                    </c:if>
		                    <c:if test="${account.auth!='Manager'}">
		                    <form:input path="end_date" value="${risk.end_date}" type="date"
		                     	class="form-control" readonly="true"/>
		                    </c:if>
		                    
		                  </div>
	                  </div>
                  </div>
                             
                  
                  <br>
                  <br>
                  <h4>조치내용</h4>
                  <div class="form-group">
                    <label for="exampleInputEmail1">대응 전략</label>
	                      <div class="form-group">
	                        <form:select path="strategy" class="form-control select2">
	                          <form:option value="동의" label="동의"/>
	                          <form:option value="완화" label="완화"/>
	                          <form:option value="이전" label="이전"/>
	                          <form:option value="삭제" label="삭제"/>
	                        </form:select>
	                      </div>	                      
	              </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">해결방안</label>
                    <form:textarea path="treatment" class="form-control" rows="3" value=""/>            
                  </div>               
     			  <c:forEach var="finf" items="${risk.fileInfo}" varStatus="sts">
                  <div class="form-group">
                    <label for="exampleInputFile">파일 첨부</label>
                    <input class="form-control fileInfo" name="filenames" value="${finf.filename}" readonly/>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="report" />
                        <label class="custom-file-label" for="file01">수정할 파일을 선택해주세요.</label>
                      </div>
                  </div>
                  </c:forEach>
                  <!-- <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div> -->
                </div>
                <!-- /.card-body -->
            <div class="card-footer">
          <button type="button" id="canBtu"
           class="btn btn-secondary float-right">취소</button>
          <button type="button" id="uptBtu"
           class="btn btn-primary float-right">수정</button>
          <button type="button" id="delBtu"
           class="btn btn-primary float-right">삭제</button> 
         </div>      
      </div>	
      </form:form>
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


</body>
</html>
