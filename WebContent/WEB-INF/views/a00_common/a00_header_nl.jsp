<%@page import="pms.z02_util.SessionManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	
	$(document).ready(function() {
		
		/* $.ajax({
			type: "get",
			url: "${path}/jsonProject.do",
			dataType: "json",
			success: function(data){
				var projectList = data.projectList;
				
				$.each(projectList, function(idx, e, arr){
					$("#hd-project-list").append("<option value='" + e.id + "'>" + e.name + "</option>");
				});
				
				$("#hd-project-list").val(data.projectId);
			},
			error: function(err){
				alert("에러발생");
			}
		}); */
		
		$("#selectLang").val("<%=SessionManager.getLang(request)%>");
		$("#selectLang").change(function(){
			var lang = $(this).val();
			if (lang != "") {
				$("[name=lang]").val($(this).val());
				var method = "${param.method}";
				//alert(method)
				$("[name=method]").val(method);
				$("#langForm").submit();
			}
		});
	});
</script>
<form action="" id="langForm" method="get">
	<input type="hidden" name="lang"/>
	<input type="hidden" name="method"/>
</form>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <a href="${path}/account.do?method=login" class="nav-link"><spring:message code="hd-login"/></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <a href="${path}/project.do?method=projectList" class="nav-link"><spring:message code="hd-projects"/></a>
    </li>
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
    <!-- Messages Dropdown Menu -->
    <!-- <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-comments"></i>
      </a>
    </li> -->
    <li class="nav-item">
    	<div class="nav-link">
			<i class="fas fa-globe-asia"></i>
    	</div>
    </li>
    <li class="nav-item">
		<select class="form-control" id="selectLang">
			<option value=""><spring:message code="lang-none"/></option>
			<option value="ko"><spring:message code="lang-ko"/></option>
			<option value="en"><spring:message code="lang-en"/></option>
		</select>
    </li>
  </ul>
</nav>
<!-- /.navbar -->