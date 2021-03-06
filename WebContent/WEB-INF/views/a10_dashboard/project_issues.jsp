<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- DataTables -->
<link rel="stylesheet"
	href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<!-- Main content -->
<table id="example3" class="table table-bordered table-hover">
	<thead>
		<tr>
			<th><spring:message code="dash-issue-id"/></th>
			<th><spring:message code="dash-issue-subject"/></th>
			<th><spring:message code="dash-issue-author"/></th>
			<th><spring:message code="dash-issue-due-date"/></th>
			<th><spring:message code="dash-issue-completed-on"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="task" items="${taskList}" varStatus="sts">
		<tr>
			<td>${sts.count}</td>
			<td>
				<a href="${path}/task.do?method=detail&id=${task.id}">${task.subject}</a>
			</td>
			<td>${task.name}</td>
			<td>${task.due_date}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${task.completed_on}"/></td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th><spring:message code="dash-issue-id"/></th>
			<th><spring:message code="dash-issue-subject"/></th>
			<th><spring:message code="dash-issue-author"/></th>
			<th><spring:message code="dash-issue-due-date"/></th>
			<th><spring:message code="dash-issue-completed-on"/></th>
		</tr>
	</tfoot>
</table>

<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- Page specific script -->
<script>
	$(function() {
		$('#example3').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	});
</script>