<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>deleteSelect.jsp</title>
	<link href="css/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
    		background-color: #F08080;
    	}
	</style>
	<script type="text/javascript">
  		function confirmDelete(){
  			var n = document.deleteForm.ids.length;
  			var count = 0;//统计没有选中的个数
  			for(var i = 0; i < n; i++){
  				if(!document.deleteForm.ids[i].checked){
  					count++;
  				}else{
  					break;
  				}
  			}
  			if(n > 1){//多个名片
  				//所有的名片都没有选择
  				if(count == n){
  					alert("请选择删除的名片！");
  	  				count = 0;
  	  				return false;
  				}
  			}else{//一个名片
  				//就一个名片并且还没有选择
  	  			if(!document.deleteForm.ids.checked){
  	  					alert("请选择删除的名片！");
  	  					return false;
  	  			}
  			}	
  		
  			if(window.confirm("真的删除吗？really?")){
  				document.deleteForm.submit();
  				return true;
  			}
  			return false;
  		}
  		function checkDel(id){
  			if(window.confirm("是否删除该名片？")){
  				window.location.href = "/cardsManage/card/deleteACard?id="+id;
  			}
  		}
  		function changeColor(obj){
  			obj.className = "bgcolor";
  		}
  		function changeColor1(obj){
  			obj.className = "";
  		}
  </script>
</head>
<body>
	<br>
	<c:if test="${allCards.size() == 0 }">
		您还没有客户。
	</c:if>
	<c:if test="${allCards.size() != 0 }">
	<form action="card/deleteCards" name="deleteForm">
	<table border="1" bordercolor="PaleGreen">
		<tr>
			<th width="250px">ID</th>
			<th width="200px">名称</th>
			<th width="200px">单位</th>
			<th width="200px">详情</th>
			<th width="200px">操作</th>
		</tr>
		<c:forEach items="${allCards }" var="card">
			<tr  onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
				<td>
				
					<input type="checkbox" name="ids" value="${card.id }"/>
					${card.id }
				</td>
				<!-- id、name等都要与数据表的列名相同，因为map中的关键字是它们 -->
				<td>${card.name }</td>
				<td>${card.company }</td>
				<td><a href="card/selectACard?id=${card.id }" target="_blank">详情</a></td>
				<td>
					<a href="javascript:checkDel('${card.id }')">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<input type="button" value="删除" onclick="confirmDelete()">
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
			&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;共${totalCount}条记录&nbsp;&nbsp;
			第${pageCur}页&nbsp;&nbsp;
			<c:url var="url_pre" value="card/query">
					<c:param name="pageCur" value="${pageCur - 1 }"/>
					<c:param name="act" value="deleteSelect"/>
			</c:url>
			<c:url var="url_next" value="card/query">
				<c:param name="pageCur" value="${pageCur + 1 }"/>
				<c:param name="act" value="deleteSelect"/>
			</c:url>
			<!-- 第一页没有上一页 -->
			<c:if test="${pageCur != 1 }">
				<a href="${url_pre}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<!-- 最后一页，没有下一页 -->
			<c:if test="${pageCur != totalPage }">
				<a href="${url_next}">下一页</a>
			</c:if>
			</td>
		</tr> 
	</table>
	</form>
	</c:if>
</body>
</html>