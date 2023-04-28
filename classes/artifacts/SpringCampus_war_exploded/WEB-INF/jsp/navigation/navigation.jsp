<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>万智校讯通导航页</title>
    <link rel="shortcut icon" href="img/wzlogo_White.png">
    <link rel="stylesheet" type="text/css" href="css/navigation.css">
    <script type="text/javascript" src="js/dataTime.js"></script>
</head>
<body marginheight="0px" marginwidth="0px" width="100vw" height="1000px" bgcolor=#f4f6f9>
<div id="nav_title">
    <table class="app">
        <th><img src="img/wzlogo_White.png" class="head_logo1" alt="万智校园网"></th>
        <th><img src="img/wz_logo.png" class="head_logo2" alt="万智校园通"></th>
    </table>
    <a href="../user/login.jsp" class="exit">退出</a>
</div>
<div id="nav_head_frame">
    <img src="img/1.gif" id="nav_head2">
    <p class="student_name">海琴烟</p>
    <p class="student_class">海琴国</p>
    <p class="student_class">1907126242@qq.com</p>
    <hr/>
    <p>个人备忘录</p>
</div>
<div id="nav_app_frame">
    <table class="app">
        <tr>
            <th><a href="https://www.sxau.edu.cn/"><img src="img/山西农业大学校徽.png" width=43%;value="山西农业大学" alt="山西农业大学"></a></th>
            <th><a href="jwxt.html"><img src="img/jwxt.png" width=50%; value="教务系统"></a></th>
            <th><a href="xiaoxuntong.html"><img src="img/xxt.png" width=47%;value="校讯通"></a></th>
            <th><a href="xzEmail.html"><img src="img/xzEmail.png" width=50%;value="校长信箱"></a></th>
            <th><a href="jwxt.html"><img src="img/jwxt.png" width=50%;value="联系方式"></a></th>
        </tr>
        <tr>
            <td><p align="center">校园官网</p></td>
            <td><p align="center">教务系统</p></td>
            <td><p align="center">校讯通</p></td>
            <td><p align="center">校长信箱</p></td>
            <td><p align="center">联系方式</p></td>
        </tr>
        <tr>
            <th><a href="jwxt.html"><img src="img/jwxt.png" width=50%;value="教务系统"></a></th>
            <th><a href="jwxt.html"><img src="img/jwxt.png" width=50%;value="校讯通"></a></th>
            <th><a href="jwxt.html"><img src="img/jwxt.png" width=50%;value="校长信箱"></a></th>
            <th><a href="user/updatePWD"><img src="img/Rpassword.png" width=50%;value="重置密码"></a></th>
        </tr>
        <tr>
            <td><p align="center">学霸排名</p></td>
            <td><p align="center">GPA计算器</p></td>
            <td><p align="center">联系反馈</p></td>
            <td><p align="center">重置密码</p></td>
        </tr>
    </table>
</div>
<div id="nav_list_frame">
    <table>
        <tr>
            <th><div id="dateTime"></div></th>
            <th><p class="news_title">校园新闻</p></th>
        </tr>
    </table><hr style="border:2px solid black;">
    <p>news1</p><hr/>
    <p>news2</p><hr/>
    <p>news3</p><hr/>
    <p>news4</p><hr/>
    <p>news5</p><hr/>
</div>
</body>
</html>
