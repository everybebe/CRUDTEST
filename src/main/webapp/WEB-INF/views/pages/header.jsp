<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="alarmZone" class="md-col-6"></div>
</body>
<script>
$(function(){ 
	let ws = new WebSocket("ws://localhost/echo");	// 웹소켓 선언
	let str = "";
	let alarmNo = 0;
	ws.onopen = function(){					// 웹소켓 연결
		console.log("웹소켓 연결!!!!!!!!!!!!!!");
		ws.send("${sessionScope.memberVO.memName}님이 접속했습니다.");	
		// 서버로 메시지 보냄
		console.log(memNo);
	};
	
	ws.onmessage = function(event){			// 서버에서 메시지 받음
		console.log(event);
	
	// 이전에 표시된 메시지를 지우고, 새로운 메시지를 표시할 준비를 하는 역할을 합니다.
		if(event.data.length >0 ){
			$("#alarmZone").empty(); //새로운 메세지를 띄우기 위해 이전 내용은 삭제해야함
			$("#alarmZone").append(event.data);  //새로운 메세지 추가
		}
	};
	ws.onclose = function(){				// 웹소켓 끊김
		console.log("웹소켓 끊김!!!!!!!!!!!!");
		clearInterval(interval);
	};
	ws.onerror = function(err){
		console.log("error : ", err);
	}
});	
</script>
</html>