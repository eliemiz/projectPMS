<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<th>번호</th>
			<th>이름</th>
			<th>역할</th>
			<th>전체</th>
			<th>진행</th>
			<th>완료</th>
			<th>달성률</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="account" items="${accountList}">
		<tr>
			<td>${account.account_id}</td>
			<td><a href="${path}/info.do">${account.name}</a></td>
			<td>${account.auth}</td>
			<td>${account.total}</td>
			<td>${account.incompleted}</td>
			<td>${account.completed}</td>
			<td>${account.completed/account.total*100}%</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>역할</th>
			<th>전체</th>
			<th>진행</th>
			<th>완료</th>
			<th>달성률</th>
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