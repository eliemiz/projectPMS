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
<table id="example2" class="table table-bordered table-hover">
	<thead>
		<tr>
			<th><spring:message code="dash-member-id"/></th>
			<th><spring:message code="dash-member-name"/></th>
			<th><spring:message code="dash-member-auth"/></th>
			<th><spring:message code="dash-member-total"/></th>
			<th><spring:message code="dash-member-incompleted"/></th>
			<th><spring:message code="dash-member-completed"/></th>
			<th><spring:message code="dash-member-done-ratio"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="account" items="${accountList}">
		<tr>
			<td>${account.account_id}</td>
			<td><a href="${path}/account.do?method=info&id=${account.account_id}">${account.name}</a></td>
			<td>${account.auth}</td>
			<td>${account.total}</td>
			<td>${account.incompleted}</td>
			<td>${account.completed}</td>
			<td>
				<c:choose>
					<c:when test="${account.total == 0}">
						-
					</c:when>
					<c:otherwise>
						<fmt:formatNumber maxFractionDigits="2" value="${account.completed/account.total*100}"/> %					
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th><spring:message code="dash-member-id"/></th>
			<th><spring:message code="dash-member-name"/></th>
			<th><spring:message code="dash-member-auth"/></th>
			<th><spring:message code="dash-member-total"/></th>
			<th><spring:message code="dash-member-incompleted"/></th>
			<th><spring:message code="dash-member-completed"/></th>
			<th><spring:message code="dash-member-done-ratio"/></th>
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
		$('#example2').DataTable({
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