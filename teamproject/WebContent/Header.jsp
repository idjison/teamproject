<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
		#wrap{
			text-align: center;
			
			height: 150px;
		}
</style>

<script type="text/javascript">
		
		function changeView(value){
			
			if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동
			{
				location.href="MainForm.do";
			}
			else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
			{
				location.href="AboutForm.do";
			}
			else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
			{
				location.href="DonateForm.do";
			}
			else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
			{
				location.href="LoginForm.do";
			}
			else if(value == "4") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="JoinForm.do";
			}
			else if(value == "5") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="MemberLogoutAction.do";
			}
			else if(value == "6") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="MemberInfoAction.do";
			}
			else if(value == "7") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="MemberListAction.do";
			}
			else if(value == "8") // 내정보 버튼 클릭시 회원정보 보여주는 화면으로 이동
			{
				location.href="TalkForm.do?page=1";
			}
		}
	</script>
</head>
<body>
	<div id = "wrap">
		<p>
			<button class="btn btn-success" onclick="changeView(0)">Home</button>
			<button class="btn btn-success" onclick="changeView(1)">About</button>
			<button class="btn btn-success" onclick="changeView(2)">후원하기</button>
			<button class="btn btn-info" onclick="changeView(8)">위로의 말 하기</button>
		<%
			// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
			if(session.getAttribute("sessionID")==null){ 
		%>
			<button id="loginBtn" class="btn btn-primary" onclick="changeView(3)">로그인</button>
			<button id="joinBtn" class="btn btn-primary" onclick="changeView(4)">회원가입</button>
			
		<%
			//admin
			}else if(session.getAttribute("sessionID").equals("admin")){
		%>
			<button id="memberListBtn" class="btn btn-primary" onclick="changeView(7)">정보 조회</button>
			<button id="logoutBtn" class="btn btn-primary" onclick="changeView(5)">로그아웃</button>
		<%
			// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
			}else{ 
		%>			
			<button id="logoutBtn" class="btn btn-primary" onclick="changeView(5)">로그아웃</button>
			<button id="updateBtn" class="btn btn-primary" onclick="changeView(6)">내정보</button>
		<%	}	%>	

		</p>
	</div>
</body>
</html>