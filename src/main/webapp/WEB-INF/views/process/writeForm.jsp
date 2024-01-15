<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="himedia.project.workspace.dto.Member" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>문서 작성</title>
<link rel="stylesheet" href="${resPath}/css/reset.css">
<link rel="stylesheet" href="/workspace/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="${resPath}/css/process/documentBox.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="icon" href="${resPath}/image/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${resPath}/css/process/step.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
body {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
<%
    // Java 영역에서 model로부터 List를 받아옴
    List<Member> members = (List<Member>) request.getAttribute("members");

    // ObjectMapper를 사용하여 List<YourModelClass>를 JSON 형식의 문자열로 변환
    ObjectMapper objectMapper = new ObjectMapper();
    String membersJson = objectMapper.writeValueAsString(members);
%>
<script>
var members = <%= membersJson %>;

function formSubmit() {
	var firstApproverNo = $("#firstApproverNo").val();
	var secondApproverNo = $("#secondApproverNo").val();
	var thirdApproverNo = $("#thirdApproverNo").val();
	
	if(firstApproverNo == "select" || firstApproverNo == null || secondApproverNo == "select" || secondApproverNo == null || thirdApproverNo == "select" || thirdApproverNo == null) {
		alert("승인자를 선택하세요");
		return;
	}
	
	var title = $("#title").val();
	if(title == null || title == "") {
		$("#titleAlert").text("제목을 입력하세요");
		$("#title").focus();
		return;
	}
	
	// 모든 조건 완료 시 폼 서브밋
	$("#writeForm").submit();
}
 
$(document).ready(function() {
    // 1차 승인자 선택 시 2차 승인자 옵션 생성
    $("#firstApproverNo").change(function() {
        var selectedValue = $(this).val(); 
        var selectPositionNo = $(this).find("option:selected").attr("positionno");
        
        // 선택하세요 선택시 2차 3차 승인자 선택 초기화
		if(selectedValue == "select") {
			$("#secondApproverNo").empty().prop("disabled", true);
			$("#thirdApproverNo").empty().prop("disabled", true);
		} else {
			var optVal = "<option value='select'>선택하세요</option>";
			
			// 1차 승인자보다 높은 직위의 2차 승인자 옵션 생성
			$.each(members, function(index, member) {
				if(member.positionNo < selectPositionNo) {
					optVal += "<option value='" + member.empNo + "' positionno='"+ member.positionNo +"'>" + member.name + member.position +"</option>";	
				}
	        });
			
			// 2차 승인자 옵션 append
			$("#secondApproverNo").empty().append(optVal).prop("disabled", false);
		}
    });
    
 	// 2차 승인자 선택 시 3차 승인자 옵션 생성
    $("#secondApproverNo").change(function() {
        var selectedValue = $(this).val(); 
        var selectPositionNo = $(this).find("option:selected").attr("positionno");
        
     	// 선택하세요 선택시 3차 승인자 선택 초기화
		if(selectedValue == "select") {
			$("#thirdApproverNo").empty().prop("disabled", true);
		} else {
			var optVal = "<option value='select'>선택하세요</option>";
			
			// 2차 승인자보다 높은 직위의 3차 승인자 옵션 생성
			$.each(members, function(index, member) {
				if(member.positionNo < selectPositionNo) {
					optVal += "<option value='" + member.empNo + "' positionno='"+ member.positionNo +"'>" + member.name + member.position +"</option>";	
				}
	        });
			
			// 3차 승인자 옵션 append
			$("#thirdApproverNo").empty().append(optVal).prop("disabled", false);
		}
    });
}); 
</script>
</head>

<body>
	<%@ include file="processElements/header.jsp"%>
	<%@ include file="processElements/sider.jsp"%>
	<div class="container-xl mb-5 mt-5">
		<h2 class="mb-4" style="color: #1E9CE3; font-weight: bold; font-size: 25px;">
			<i class="bi bi-pencil-square me-3"></i> 기안 작성
		</h2>
		<div class="row">
			<div class="col-12">
				<div class="card card-margin">
					<div class="card-body shadow">
						<!--     바디 내용 들어갈 곳       -->
						<!-- TODO:: 231221 form 외부로 이동 -->
						<form id="writeForm" action="/workspace/process/documents/write-form" method="post" enctype="multipart/form-data">
							<jsp:include page="processElements/approvalLine.jsp"></jsp:include>
							<jsp:include page="processElements/docWriteForm.jsp"></jsp:include>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>