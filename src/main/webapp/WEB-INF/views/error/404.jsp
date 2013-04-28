<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>404</title>
	<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap.min.css">
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
				<h1>404</h1>
				<h4>亲，您访问的页面不存在哦!</h4>
				<h4>点击下面的链接返回主页</h4>
				<p><a href="${webRoot}" class="btn btn-primary btn-large">主页</a></p>
			</div>
			<div class="span6" id="err-img"></div>
		</div>
	</div>
</body>
</html>