<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sign In</title>
	<link rel="stylesheet" href="css/styles.css" />
</head>
<body>
	<div class="loginWindow">
		<div class="loginHeader">Sign In</div>
		<div class="loginContent">
			<div style="display:block;padding-top:20px">Username*</div>
			<input type="text" id="T1" /> 
			<div style="display:block;padding-top:20px">Password*</div>
			<input type="password" id="T2" /> 
			<div style="display:block;padding-top:10px;padding-bottom:10px;text-align:right">
				Forgot <label style="color:blue;cursor:pointer;">Password</label>
			</div>
			<button class="signinButton" onclick="AdminIn()">Sign In</button>
			<div style="display:block;height:80px;line-height:80px">
				<label id="ack"></label>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
	function AdminIn() {
		var data = JSON.stringify({
			username: parseInt(T1.value, 10),  // Convert to long
			password: T2.value
		});
		var url = "http://localhost:8080/admin/adminlogin";
		callApi("POST", url, data, getResponse);
	}
	
	function getResponse(res) {
		if (res == 401) {
			ack.style.color = "red";
			ack.innerHTML = "Invalid Credentials!";
		} else {
			ack.innerHTML = "";
			location.replace("/AdminHome.jsp");
		}
	}
</script>
</html>
