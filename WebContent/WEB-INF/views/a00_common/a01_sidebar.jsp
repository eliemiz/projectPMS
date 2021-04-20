<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="${path}/dashboard.do" class="brand-link">
		<img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Project PMS</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2"
					alt="User Image">
			</div>
			<div class="info">
				<a href="${path}/account.do?method=info&id=${account.id}" class="d-block">${account.name}</a>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<%-- <li class="nav-item" id="sm-dashboard">
					<a href="#" class="nav-link" id="sb-dashboard">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Dashboard <i class="right fas fa-angle-left"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="${path}/dashboard.do" class="nav-link" id="sb-dashboard-info">
								<i class="far fa-circle nav-icon"></i>
								<p>Info</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="${path}/dashboard.do?page=members" class="nav-link" id="sb-dashboard-members">
								<i class="far fa-circle nav-icon"></i>
								<p>Members</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="${path}/dashboard.do?page=issues" class="nav-link" id="sb-dashboard-issues">
								<i class="far fa-circle nav-icon"></i>
								<p>Issues</p>
							</a>
						</li>
					</ul>
				</li> --%>
				<li class="nav-item">
					<a href="${path}/dashboard.do" class="nav-link" id="sb-dashboard">
						<i class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							<spring:message code="sb-dashboard"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/activity.do" class="nav-link" id="sb-activity">
						<i class="nav-icon far fa-edit"></i>
						<p>
							<spring:message code="sb-activity"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/task.do?method=list" class="nav-link" id="sb-task">
						<i class="nav-icon fas fa-tasks"></i>
						<p>
							<spring:message code="sb-task"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/gantt.do?method=list" class="nav-link" id="sb-gantt">
						<i class="nav-icon far fa-chart-bar"></i>
						<p>
							<spring:message code="sb-gantt-chart"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/calendar.do?method=list" class="nav-link" id="sb-calendar">
						<i class="nav-icon far fa-calendar-alt"></i>
						<p>
							<spring:message code="sb-calendar"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/risk.do?method=list" class="nav-link" id="sb-risk">
						<i class="nav-icon fas fa-exclamation-circle"></i>
						<p>
							<spring:message code="sb-risk"/>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${path}/settings.do?method=project" class="nav-link" id="sb-project-setting">
						<i class="nav-icon fas fa-tasks"></i>
						<p>
							<spring:message code="sb-project-setting"/>
						</p>
					</a>
				</li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>