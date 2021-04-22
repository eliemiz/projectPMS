<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- TABLE: LATEST ORDERS -->
<div class="container-fluid">
	<div class="card">
		<div class="card-header border-transparent">
			<h3 class="card-title"><spring:message code="dash-recent-risk"/></h3>
	
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table m-0">
					<thead>
						<tr>
							<th><spring:message code="risk-id"/></th>
							<th><spring:message code="risk-subject"/></th>
							<th><spring:message code="risk-status"/></th>
							<th><spring:message code="risk-probability"/></th>
							<th><spring:message code="risk-impact"/></th>
							<th><spring:message code="risk-startdate"/></th>
							<th><spring:message code="risk-enddate"/></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="risk" items="${riskList}">
						<tr>
							<td>${risk.id}</td>
							<td><a href="${path}/risk.do?method=detail&id=${risk.id}">${risk.subject}</a></td>
							<td>${risk.status}</td>
							<td>
							<c:choose>
								<c:when test="${risk.probability==1}"> 
									<spring:message code="risk-unlikely"/>
								</c:when>
								<c:when test="${risk.probability==2}">
									<spring:message code="risk-low"/>
								</c:when>
								<c:when test="${risk.probability==3}">
									<spring:message code="risk-medium"/>
								</c:when>
								<c:when test="${risk.probability==4}">
									<spring:message code="risk-high"/>
								</c:when>
								<c:when test="${risk.probability==5}">
									<spring:message code="risk-expected"/>
								</c:when>
							</c:choose>
							</td>
							<td>
							<c:choose>
								<c:when test="${risk.impact==1}">
									<spring:message code="risk-negligible"/>
								</c:when>
								<c:when test="${risk.impact==2}">
									<spring:message code="risk-minor"/>
								</c:when>
								<c:when test="${risk.impact==3}">
									<spring:message code="risk-moderate"/>
								</c:when>
								<c:when test="${risk.impact==4}">
									<spring:message code="risk-significant"/>
								</c:when>
								<c:when test="${risk.impact==5}">
									<spring:message code="risk-severe"/>
								</c:when>
							</c:choose>
							</td>
							<td>${risk.start_date}</td>
							<td>${risk.end_date}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.card-body -->
		<div class="card-footer clearfix">
			<a href="${path}/risk.do?method=insForm" class="btn btn-sm btn-info float-left"><spring:message code="dash-create-new-risk"/></a>
			<a href="${path}/risk.do?method=list&projectId=${project.id}" class="btn btn-sm btn-secondary float-right"><spring:message code="dash-view-all-risk"/></a>
		</div>
		<!-- /.card-footer -->
	</div>
	<!-- /.card -->
	<div class="card">
		<div class="card-header border-transparent">
			<h3 class="card-title"><spring:message code="dash-recent-issue"/></h3>
	
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table m-0">
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
						<c:forEach var="task" items="${taskList}">
						<tr>
		                    <td>${task.id}</td>
		                    <td><a href="${path}/task.do?method=detail&id=${task.id}">${task.subject}</a></td>
		                    <td>${task.name}</td>
		                    <td>${task.due_date}</td>
		                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${task.completed_on}"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.card-body -->
		<div class="card-footer clearfix">
			<a href="${path}/task.do?method=list" class="btn btn-sm btn-secondary float-right"><spring:message code="dash-view-all-issue"/></a>
		</div>
		<!-- /.card-footer -->
	</div>
	<!-- /.card -->
</div>
