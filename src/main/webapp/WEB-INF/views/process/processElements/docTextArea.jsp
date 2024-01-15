<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>docTextArea.jsp</title>
<style>
.write {width: 700px; height: 300px;}
table, tr, td {border: 1px solid black; margin: 15px auto auto auto;}
.wide {width: 250px;}
.blank {height: 30px;}
.fixed {pointer-events: none; user-select: none; readonly; disabled;}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>
<body>
	<div style="margin-top: -30px;">
		<textarea id="summernote" name="body">
		<jsp:include page="docTable.jsp"></jsp:include>
		</textarea>
	</div>

	<script src="/workspace/resources/js/process/summernote/textBox.js"></script>
</body>
</html>

