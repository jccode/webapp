<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>500</title>
	<link rel="stylesheet" href="${webRoot}/static/assert/css/bootstrap.min.css">
	<style>
		body {
			padding: 50px 0px;
			background-color: #c0e1e8;
		}
		#err-img {
			background: url("${webRoot}/web/img/error.jpg") no-repeat 0px 0px;
			height: 400px;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2"></div>
			<div class="span4">
				<h1>500</h1>
				<h4>对不起，亲! 服务器内部发生异常.</h4>
				<p><%=exception %></p>
				<p><a href="#" class="btn btn-primary btn-large" id="btn_back">返回</a></p>
			</div>
			<div class="span6" id="err-img"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		document.getElementById("btn_back").onclick = function() {
			history.go(-1);
		}
	</script>
</body>
</html>