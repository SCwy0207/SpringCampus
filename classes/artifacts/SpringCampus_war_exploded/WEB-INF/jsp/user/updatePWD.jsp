<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<title>万智校园通</title>
	<link rel="shortcut icon" href="img/wzlogo_White.png">
	<link rel="stylesheet" type="text/css" href="css/updatePWD.css">
	<script type="text/javascript" src="js/updatePWD.js"></script>
</head>
<body>
<!-- 添加canvas元素作为流星的容器 -->
<canvas id="canvas"></canvas>
<div id="login_frame">
	<form:form action="user/updateUser" modelAttribute="user"  method="post" name="updateForm">
		<p><label class="label_title">重置密码</label></p>
		<p class="label_input">&nbsp;新密码</p>
		<p><form:password id="password" path="password" Class="text_field" placeholder="  请输入新密码"/></p>
		<p style="line-height:2px;">&nbsp;</p>
		<p class="label_input">&nbsp;确认新密码</p>
		<p><form:password id="repassword" path="repassword" Class="text_field" placeholder="  请再次输入新密码"/></p>
		<p>&nbsp;</p>
		<div id="register_control">
			<input type="button" id="btn_rpassword" value="重置密码"  onclick="allIsNull()"/><br/>
		</div>
	</form:form>
</div>
</body>
</html>
