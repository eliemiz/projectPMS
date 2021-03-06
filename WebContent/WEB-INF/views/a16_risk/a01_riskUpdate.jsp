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
		if(confirm("?????? ??????\n ?????? ???????????? ?????????????????????????"))
		location.href = "${path}/risk.do?method=list";			
	}
	if(proc=="del"){
		alert("?????? ??????\n?????? ???????????? ???????????????.");
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
			if(confirm("?????? ???????????? ?????????????????????????")){
				$(location).attr("href","${path}/risk.do?method=list");
			}
		});
		$("#uptBtu").on("click",function(){
			if($("[name=subject]").val()==""){
				alert("????????? ???????????????.");
				return false;
			}else if($("[name=subject]").val().length >= 100) {
				alert("????????? 100??? ???????????? ??????????????????.");
				return false;
			}else if($("[name=description]").val().length >= 1000){
				alert("??????????????? 1000??? ???????????? ??????????????????.");
				return false;	
			}else if($("[name=start_date]").val()==""){
				alert("?????????????????? ???????????????.");
				return false;
			}else if($("[name=end_date]").val()==""){
				alert("?????????????????? ???????????????.");
				return false;
			}
			if(confirm("?????????????????????????")){
				$("[name=proc]").val("upt");
				$("form").attr("action","${path}/risk.do?method=update");
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
       <h3 class="card-title">????????? ??????</h3>
         </div>
           <!-- /.card-header -->
           <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">??????</label>
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
                    <label for="exampleInputEmail1">??????</label>
	                      <div class="form-group">
	                        <form:select path="status" class="form-control select2">
	                          <form:option value="??????" label="??????"/>
	                          <c:if test="${account.auth!='Manager'}">
	                          <form:option value="????????????" label="????????????"/>
	                          </c:if>
	                          <c:if test="${account.auth=='Manager'}">	                         
	                          <form:option value="??????" label="??????"/>
	                          <form:option value="?????????" label="?????????"/>
	                          <form:option value="??????" label="??????"/>  
	                          <form:option value="?????? " label="??????"/>  
	                          </c:if>
	                        </form:select>
	                      </div>
	              </div>
	              <div class="form-group">
                    <label for="exampleInputEmail1">??????</label>
	                      <div class="form-group">
	                      <c:if test="${account.auth=='Manager'}">
	                        <form:select path="category" class="form-control select2">
	                          <form:option value="????????? ??????" label="????????? ??????"/>
		                        <form:option value="????????? ??????" label="????????? ??????"/>
		                        <form:option value="????????? ??????" label="????????? ??????"/>
		                        <form:option value="????????????" label="????????????"/>
	                        </form:select>
	                      </c:if>
	                      <c:if test="${account.auth!='Manager'}">
	                      	<form:input path="category" class="form-control select2" readonly="true"/>
	                      </c:if>
	                      </div>
	              </div>
	              <div class="form-group">
                    <label for="exampleInputEmail1">?????????</label>
                    <c:if test="${account.auth=='Manager'}">
                    <form:select path="account_id" class="form-control select" style="width: 100%;">
	                 <option value="">????????? ??????</option>
	                  	<c:forEach var="account" items="${accounts}">
		                    <form:option value="${account.id}">${account.name}(${account.auth})</form:option>
	                    </c:forEach>
                 	</form:select>     
                 	</c:if>
                 	<c:if test="${account.auth!='Manager'}">   
                 	  <input type="hidden" name="account_id" value="${account.id}"/>
                 	  <input type="text" class="form-control" style="width: 100%;" value="${account.name}" readonly="readonly"/>
                 	</c:if>      
                  </div>
                  </div>
                  
                  <div class="col-md-6">
                  
                  </div>
                  </div>
	              
                  <div class="form-group">
                    <label for="exampleInputPassword1">????????????</label>
                    <form:textarea path="description" class="form-control" style="width:100%; height:300px;"/>
                  </div>
                  
                  <div class="row">                 
	                  <div class="col-md-6">
		                  <div class="form-group">	               
		                    <label for="exampleInputEmail1">???????????????</label>
		                    	<div class="form-group">
		                    	<c:if test="${account.auth=='Manager'}">
			                      <form:select path="probability" class="form-control select2">
			                        <form:option value="1" label=" ?????? "/>
			                        <form:option value="2" label=" ?????? "/>
			                        <form:option value="3" label=" ?????? "/>
			                        <form:option value="4" label=" ?????? "/>
			                        <form:option value="5" label=" ?????? "/>
			                      </form:select>
			                    </c:if>
			                    <c:if test="${account.auth!='Manager'}">
			                   	  <input type="hidden" name="probability" value="${risk.probability}"/>
			                   	  <c:choose>
									<c:when test="${risk.probability==1}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.probability==2}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.probability==3}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.probability==4}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.probability==5}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:otherwise> Error </c:otherwise>
								  </c:choose>
			                    </c:if>
			                    </div>
		                  </div>
		                  <div class="form-group">
		                    <label for="exampleInputEmail1">?????????</label>
		                    <div class="form-group">
		                    <c:if test="${account.auth=='Manager'}">
			                      <form:select path="impact" class="form-control select2">
			                        <form:option value="1" label=" ?????? "/>
			                        <form:option value="2" label=" ?????? "/>
			                        <form:option value="3" label=" ?????? "/>
			                        <form:option value="4" label=" ?????? "/>
			                        <form:option value="5" label=" ????????? "/>
			                      </form:select>
			                </c:if>
			                <c:if test="${account.auth!='Manager'}">
			                <input type="hidden" name="impact" value="${risk.impact}"/>
			                   	  <c:choose>
									<c:when test="${risk.impact==1}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.impact==2}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.impact==3}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.impact==4}"><input type="text" class="form-control" style="width: 100%;" value="??????" readonly="readonly"/></c:when>
									<c:when test="${risk.impact==5}"><input type="text" class="form-control" style="width: 100%;" value="?????????" readonly="readonly"/></c:when>
									<c:otherwise> Error </c:otherwise>
								  </c:choose>

			                </c:if>
			                </div>
		                  </div>
		              </div>
	                  <div class="col-md-6">
			              <div class="form-group">
		                    <label for="exampleInputEmail1">???????????????</label>
		                    <c:if test="${account.auth=='Manager'}">
		                    <form:input path="start_date" value="${risk.start_date}" type="date"
		                    	class="form-control"/>
		                    </c:if>
		                    <c:if test="${account.auth!='Manager'}">
		                    <form:input path="start_date" value="${risk.start_date}" type="date"
		                     	class="form-control" readonly="true"/>
		                    </c:if>	
		                  </div>
		                  <div class="form-group">
		                    <label for="exampleInputEmail1">???????????????</label>
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
                  <h4>????????????</h4>
                  <div class="form-group">
                    <label for="exampleInputEmail1">?????? ??????</label>
	                      <div class="form-group">
	                        <form:select path="strategy" class="form-control select2">
	                          <form:option value="??????" label="??????"/>
	                          <form:option value="??????" label="??????"/>
	                          <form:option value="??????" label="??????"/>
	                          <form:option value="??????" label="??????"/>
	                        </form:select>
	                      </div>	                      
	              </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">????????????</label>
                    <form:textarea path="treatment" class="form-control" rows="3" value=""/>            
                  </div>               
     			  <c:forEach var="finf" items="${risk.fileInfo}" varStatus="sts">
                  <div class="form-group">
                    <label for="exampleInputFile">?????? ??????</label>
                    <input class="form-control fileInfo" name="filenames" value="${finf.filename}" readonly/>
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="report" />
                        <label class="custom-file-label" for="file01">????????? ????????? ??????????????????.</label>
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
           class="btn btn-secondary float-right">??????</button>
          <button type="button" id="uptBtu"
           class="btn btn-primary float-right">??????</button>
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
