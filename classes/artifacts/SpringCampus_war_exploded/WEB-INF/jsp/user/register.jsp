<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<script type="text/javascript" src="js/register.js"></script>

</head>
<body>
<!-- 添加canvas元素作为流星的容器 -->
<canvas id="canvas"></canvas>
<div id="login_frame">
	<form:form action="user/register" method="post" modelAttribute="user" name="registForm" >
		<label class="label_title">注册</label>
		<p class="label_input">&nbsp;用户名</p>
		<p> <form:input id="username" path="username" class="text_field" onblur="nameIsNull()" placeholder="${isExit == 'false' ? '  用户名已存在' : '  请输入用户名'}" />
			<c:if test='${isExit=="false"}'>
				<c:set var="clearUsername" value="true" />
			</c:if>
			<script>
			</script>
		</p>
		<p class="label_input">&nbsp;密码</p>
		<p><form:password id="password" path="password" Class="text_field" maxlength="20" placeholder="  请输入密码"/></p>

		<p class="label_input">&nbsp;确认密码</p>
		<p><form:password id="repassword" path="repassword" Class="text_field" maxlength="20" placeholder="  请再次确认密码"/></p><br/>
		<div id="register_control">
			<input type="submit" id="btn_register" value="注册新账户" onclick="allIsNull()"><br/>
		</div>
	</form:form>
</div>
</body>
</html>