<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<title>万智校园通</title>
	<link rel="shortcut icon" href="img/wzlogo_White.png">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<!-- 添加canvas元素作为流星的容器 -->
<canvas id="canvas"></canvas>
<div id="login_frame">
	<%--@elvariable id="user" type=""--%>
	<form:form action="user/login" modelAttribute="user" method="post">
		<p><label class="label_title">登陆</label></p>
		<p class="label_input">&nbsp;用户名</p>
		<p><form:input path="username" class="text_field" placeholder="  请输入用户名"/></p>
		<p style="line-height:2px;">&nbsp;</p>
		<p class="label_input">&nbsp;密码</p>
		<p><form:password path="password" class="text_field" placeholder="  请输入密码"/></p>
		<p>&nbsp;</p>
		<div id="login_control">
			<input type="button" id="btn_login" value="登录" onclick="login();"><input type="button" id="btn_register" value="注册新账户" onclick="register();"><br/>
			<a id="forget_pwd" href="forget_pwd.html">忘记密码？</a>
		</div>
	</form:form><br/>
	${errorMessage }
</div>
</body>
</html>
