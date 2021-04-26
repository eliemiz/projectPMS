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

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.3/fetch.js "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var vm = new Vue({
			el:"#modalMember",
			data:{
				title:"연습",
				projectId:0,
				userList:[],
			},
			methods:{
				getAllUsers: function(){
					this.projectId = "${projectId}";
					console.log("projectId : " + this.projectId);
					this.fetchUserList();
				},
				fetchUserList: _.debounce(function(){
					var vm = this;
					/* 1. 모델데이터 초기화 */
					this.allUsers = [];
					this.projectUsers = [];
					
					var url = "${path}/jsonProjectUsers.do";
					/* 2. fetch api의 ajax처리와 promise 형태 함수 처리 */
					fetch(url).then(function(response){ 
						return response.json();
					}).then(function(json){	/* response에 의해서 받은 json 데이터 처리 */
						console.log(json.userList);
						vm.userList = json.userList;
					}).catch(function(err){	/* 에러 발생 시 처리 */
						console.log("# 에러 발생 #");
						console.log(err);
					});
				}, 200)
			}
		});
		
		var vm2 = new Vue({
			// el:"#example2",
			el:"#example2",
			data: {
				projectId:0,
				memberList:[]
			},
			methods:{
				getMembers:function(){
					this.projectId = "${projectId}";
					console.log("projectId : " + this.projectId);
					this.fetchMemberList();	
				},
				fetchMemberList: _.debounce(function(){
					var vm = this;
					/* 1. 모델데이터 초기화 */
					this.memberList = [];
					
					var url = "${path}/jsonProjectMembers.do";
					/* 2. fetch api의 ajax처리와 promise 형태 함수 처리 */
					fetch(url).then(function(response){ 
						return response.json();
					}).then(function(json){	/* response에 의해서 받은 json 데이터 처리 */
						console.log(json.memberList);
						vm.memberList = json.memberList;
					}).catch(function(err){	/* 에러 발생 시 처리 */
						console.log("# 에러 발생 #");
						console.log(err);
					});
				}, 200)
			},
			filters: {
				round: function(val){
					return val.toFixed(2);
				}
			}
		});
		
		$('#modalMember').on('show.bs.modal', function () {
			vm.getAllUsers();
		});
		
		$("#saveChange").on('click', function(){
			$.ajax({
				method:"get",
				url:"${path}/updateProjectUsers.do",
				data: {
					list: JSON.stringify(vm.userList)
				},
				dataType:"json",
				success:function(data){
					alert("사용자 등록 및 삭제가 완료되었습니다.");
					
					// 구성원 리로드
					vm2.getMembers();
					
					$("#modalMember").modal('hide');
				},
				error:function(err){
					alert("에러 발생");
					console.log(err);
				}
			});
		});
		
		vm2.getMembers();
	});
	
</script>

<!-- Main content -->
<button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#modalMember">
	구성원 등록/삭제
</button>
<div class="modal fade" id="modalMember">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Extra Large Modal</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group col-md-4" v-for="(user, index) in userList" style="display:inline-block;">
					<div class="icheck-primary d-inline">
						<input type="checkbox" :id="'checkboxPrimary'+index" v-model="user.member" disabled="disabled" v-if="user.auth == 'Manager'">
						<input type="checkbox" :id="'checkboxPrimary'+index" v-model="user.member" v-else>
						<label :for="'checkboxPrimary'+index"> {{user.name}} ({{user.auth}}) </label>
					</div>
				</div>
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="saveChange">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

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
		<tr v-for="(member, index) in memberList">
			<td>{{member.account_id}}</td>
			<td><a href="">{{member.name}}</a></td>
			<td>{{member.auth}}</td>
			<td>{{member.total}}</td>
			<td>{{member.incompleted}}</td>
			<td>{{member.completed}}</td>
			<td v-if="member.total == 0">
				-
			</td>
			<td v-else>
				{{member.completed/member.total * 100 | round}} %
				<%-- <fmt:formatNumber maxFractionDigits="2" :value="member.completed/member.total *100"/> --%>
			</td>
			
				<%-- <c:choose>
					<c:when test="${account.total == 0}">
						-
					</c:when>
					<c:otherwise>
						<fmt:formatNumber maxFractionDigits="2" value="${account.completed/account.total*100}"/> %					
					</c:otherwise>
				</c:choose> --%>
		</tr>
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
<div id="member-modal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

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
	/* $(function() {
		$('#example2').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	}); */
</script>