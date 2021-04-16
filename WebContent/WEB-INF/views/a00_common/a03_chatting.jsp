<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#chatCard").hide();
		$("#id").val("${account.name}(${account.user_id})");
		
		// 1. 웹소켓통신 처리할 전역변수 선언
		var webSocket;
		// 2. 접속 시 처리 내용
		$("#enterButton").click(function(){
			if (true) {
				
				webSocket = new WebSocket("ws://localhost:7080/${path}/chat-ws.do");
				
				/* 1. 접속 시 */
				webSocket.onopen = function(event) {
					$("#chatCard").show();
					$("#groupName").html($("#group").val());
					
					// 채팅서버에 접속되었을 때 처리할 내용
					console.log(event);
					// 접속 메시지 전송
					webSocket.send($("#group").val() + ":" + $("#id").val() + ":연결 접속했습니다.");
				};
				
				/* 2. 서버에서 온 메시지 받기 */
				webSocket.onmessage = function(event) {
					var data = event.data; // 메시지를 받음
					var user = data.split(":");
					
					if (user[0] == $("#group").val()){
						recvMessage(user[1] + ":" + user[2]);	
					}
				}
				
				/* 3. 서버에 종료 처리 */
				webSocket.onclose = function() {
					// alert("접속을 종료합니다.");
					$("#chatCard").hide();
					
					$("#chatMessageArea").text("");
					
					$("#group").val("").focus();
				}
			} 
		});
		
		$("#sendButton").click(function(){
			sendMessage();
		});
		
		$("#message").keyup(function(e){
			if (e.keyCode == 13) {
				sendMessage();
			}
		});
		
		$("#exitButton").click(function(){
			webSocket.send($("#group").val() + ":" + $("#id").val() + ":연결 종료합니다.");
			webSocket.close();
		});
		
		// .send()는 서버의 handleTextMessage()와 연동되어 있다.
		function sendMessage() {
			var id = $("#id").val(); 
			var message = $("#message").val();
			webSocket.send($("#group").val() + ":" + id + ":" + message);
			$("#message").val("");
		}
		
		function recvMessage(message){
			
			var msg = message.split(":", 2);
			if (msg[0] == $("#id").val()) {
				var show = '';
				show += '<div class="direct-chat-msg right">';
				show += '<div class="direct-chat-infos clearfix">';
				show += '<span class="direct-chat-name float-right">' + msg[0] + '</span>';
				show += '<span class="direct-chat-timestamp float-left">23 Jan2:00 pm</span>';
				show += '</div>';
				show += '<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="Message User Image">';
				show += '<div class="direct-chat-text">' + msg[1] + '</div>';
				show += '</div>';
				$("#chatMessageArea").append(show);
			} else {
				var show = '';
				show += '<div class="direct-chat-msg">';
				show += '<div class="direct-chat-infos clearfix">';
				show += '<span class="direct-chat-name float-left">' + msg[0] + '</span>';
				show += '<span class="direct-chat-timestamp float-right">23 Jan2:00 pm</span>';
				show += '</div>';
				show += '<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="Message User Image">';
				show += '<div class="direct-chat-text">' + msg[1] + '</div>';
				show += '</div>';
				$("#chatMessageArea").append(show);
			}
			
			/* 자동 스크롤링 처리 (메시지 내용) */
			var mx = parseInt($("#chatMessageArea")[0].scrollHeight);
			$("#chatMessageArea").scrollTop(mx);
		}
	});
</script>
</head>
<body>
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<!-- left column -->
					<div class="col-12">
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">그룹 선택</h3>
							</div>
							<form>
								<div class="card-body">
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label for="id">사용자명</label>
												<input type="text" class="form-control" id="id" readonly="readonly">
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="group">그룹 이름</label>
												<input type="text" class="form-control" id="group">
											</div>
										</div>
									</div>
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<button type="button" class="btn btn-primary" id="enterButton">입장</button>
								</div>
							</form>
						</div>
						<!-- /.card -->
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card card-success card-outline direct-chat direct-chat-success shadow-sm" id="chatCard">
							<div class="card-header">
								<h3 class="card-title" id="groupName"></h3>
				
								<div class="card-tools">
									<!-- <button type="button" class="btn btn-tool" data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button> -->
									<button type="button" class="btn btn-tool" id="exitButton">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<!-- Conversations are loaded here -->
								<div class="direct-chat-messages" id="chatMessageArea">
								</div>
								<!--/.direct-chat-messages-->
							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<form action="#" method="post">
									<div class="input-group">
										<input type="text" id="message" name="message" class="form-control">
										<span class="input-group-append">
											<button type="button" class="btn btn-success" id="sendButton">Send</button>
										</span>
									</div>
								</form>
							</div>
							<!-- /.card-footer-->
						</div>
						<!--/.direct-chat -->
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</html>