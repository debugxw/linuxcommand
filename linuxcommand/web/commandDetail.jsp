<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="http://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="http://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link rel="shortcut icon" href="images/home.png" type="image/x-icon"/>
<title>命令之家</title>
</head>

<style>
html, body {
	overflow: hidden;
	margin: 0px;
	widows: 100%;
	height: 100%;
}

div.virtualBody {
	width: 100%;
	height: 100%;
	overflow-y: scroll;
	overflow-x: auto;
	background: url(images/bg.jpg) no-repeat center center;
	background-size: cover;
	background-attachment: fixed;
	background-color: #CCCCCC;
}

div.linuxCommandLinePage {
	width: 100%;
	position: relative;
}

table.commandTable {
	width: 600px;
	margin: 20px;
}

div.manageDiv {
	position: absolute;
	z-index: 10;
	top: 100px;
	right: 100px;
	background-color: transparent;
}

/* 验证 */
div.manageDiv div.verifyDiv {
	width: 100%;
}

/* 添加命令 */
div.manageDiv div.addCommandDiv {
	position: relative;
	width: 100%;
}

div.addCommandDiv img {
	position: absolute;
	left: -5px;
	top: -35px;
	width: 30px;
	height: 30px;
}

div.addCommandDiv span {
	font-family: Arial;
	margin-bottom: 5px;
	display: block;
}

div.addCommandDiv input {
	width: 200px;
	height: 30px;
	border: none;
	margin-bottom: 20px;
	border-radius: 3px;
	outline: none;
}

div.addCommandDiv .addButton {
	margin-top: 15px;
	width: 200px;
}

img.completeImg {
	width: 20px;
	height: 20px;
}

table td, th {
	font-size: 13px;
}
a:hover {
	text-decoration: none;
}
</style>

<script>
$(function() {
	$("img.addImg").click(function() {
		$(this).parent().addClass("hidden");
		$("input.inputPara").val("");
		$("input.inputFunction").val("");
		$("div.addCommandDiv").removeClass("hidden");
	});
	$("img.deleteImg").click(function() {
		$("input.verifyInput").val("");
		$("img.completeImg").removeClass("hidden");
		$("a.deleteCommand").removeClass("hidden");
	});
	$("button.verifyButton").click(function() {
		var verify = $("input.verifyInput").val();
		if("addCommand" == verify) {
			$(this).parent().addClass("hidden");
			$("input.inputPara").val("");
			$("input.inputFunction").val("");
			$("div.addCommandDiv").removeClass("hidden");
		} else if("deleteCommand" == verify) {
			$("input.verifyInput").val("");
			$("img.completeImg").removeClass("hidden");
			$("a.deleteCommand").removeClass("hidden");
		}
	});
	$("img.returnImg").click(function() {
		$("div.addCommandDiv").addClass("hidden");
		$("input.verifyInput").val("");
		$("div.verifyDiv").removeClass("hidden");
	});
	$("img.completeImg").click(function() {
		$(this).addClass("hidden");
		$("a.deleteCommand").addClass("hidden");
	});
	$(".addForm").submit(function() {
		if(checkEmpty("inputPara", "参数")) return true;
		if(checkEmpty("inputFunction", "作用")) return true;
		return false;
	});
});

function checkEmpty(id, name) {
	var value = $("#"+id).val();
	if(value.length == 0) {
		alert(name + "不能为空");
		$("#"+id)[0].focus();
		return false;
	}
	return true;
}
</script>

<body>	
	<!-- 操作栏 -->
	<div class="manageDiv">
		<div class="verifyDiv">
			<a href="command_list"><img width="30px" height="30px" class="backImg" src="images/return.png">
			</a>
			<img class="addImg" src="images/add.png">
			<img class="deleteImg" src="images/delete.png">
		</div>
		<form class="addForm" method="post" action="command_addDetail">
			<div class="hidden addCommandDiv">
				<img class="returnImg" src="images/return.png">
				<div class="addCommandOfCommand">
					<span>参数</span> <input type="text" class="inputPara" name="inputPara" 
						id="inputPara" autocomplete="off">
				</div>
				<div class="addCommandOfFunction">
					<span>作用</span> <input type="text" class="inputFunction" name="inputFunction" 
						id="inputFunction" autocomplete="off">
				</div>
				<input type="submit" class="btn addButton" value="添加">
				<input type="text" class="hidden" value="${cid}" name="inputCid">
			</div>
		</form>
	</div>

	<!-- 虚拟body -->
	<div class="virtualBody">
		<div class="linuxCommandLinePage">
			<table class="table table-striped table-hover commandTable">
				<thead>
					<th>参数</th>
					<th>作用</th>
					<th><img class="hidden completeImg" src="images/complete.png"></th>
				</thead>
				<tbody>
					<c:forEach items="${cds}" var="cd">
						<tr>
							<td>${cd.para}</td>
							<td>${cd.func}</td>
							<td><a class="hidden deleteCommand" href="command_deleteDetail?id=${cd.id}&cid=${cid}">
								<span class="deleteLink glyphicon glyphicon-trash"></span>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>