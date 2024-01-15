<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="resPath" value="/resources" />
<c:url var="context" value="/" />
<!doctype html>
<html lang="ko" class="h-100" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="그룹웨어 시스템 입니다.">
<title>Work Space</title>
<link href="${resPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${resPath}/css//login/sign-in.css" rel="stylesheet">
<link rel="icon" href="${resPath}/image/favicon.ico" type="image/x-icon">
<script>
	// DOMContentLoaded 이벤트를 사용하여 로그인 클릭시 아이디 비밀번호 확인 후 로그인 구현
	document.addEventListener("DOMContentLoaded", function() {
		var btnLogin = document.getElementById("btnLogin");
		btnLogin.addEventListener("click", function() {
			var userid = document.getElementById("userId").value;
			var passwd = document.getElementById("password").value;
			
			// 아이디를 입력 안했을 때
			if (userid === "") {
				alert("아이디를 입력하세요");
				document.getElementById("userId").focus();
				return;
			}

			// 비밀 번호를 입력 안했을 때 
			if (passwd === "") {
				alert("비밀번호를 입력하세요");
				document.getElementById("password").focus();
				return;
			}
			
			// 아이디 저장 여부에 따른 아이디 쿠키 저장
			var checkbox = document.getElementById('flexCheckDefault');
	        if (checkbox.checked) {
	            // 아이디 쿠키 저장
	            var days = 30; //30일동안 쿠키 유지
	        	var expires = "";
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
	           
	            document.cookie = "rememberUserId=" + userid + expires + "; path=/";
	        } else {
	        	// 아이디 쿠키 삭제
	        	var date = new Date();
	        	document.cookie = "rememberUserId=; expires="+date.toUTCString()+"; path=/;";
	        }

			// 폼 내부의 데이터를 전송할 주소
			document.forms["form1"].action = "/workspace/login";
			document.forms["form1"].submit();
		});
	});
	
	// 페이지 로드 시 저장된 아이디를 확인
    function loadUserId() {
        var userId = getCookie('rememberUserId');
        // 저장된 아이디가 있는 경우 아이디 필드에 값 적용 & 아이디 저장 체크
        if (userId) {
        	document.getElementById("userId").value = userId;
        	document.getElementById('flexCheckDefault').checked = true;
        }
    }
	 
    // 쿠키에서 값을 가져오는 함수
    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }
    
 	// DOMContentLoaded 이벤트를 사용하여 페이지 로드 후에 실행
    document.addEventListener("DOMContentLoaded", function () {
        loadUserId();
    }); 
</script>
</head>
<body class="d-flex align-items-center py-3 bg-body-tertiary">
	<main class="form-signin w-100 m-auto">
		<form name="form1" method="post">
			<img class="mb-5" src="${resPath}/image/logo.png" alt="" width="100%" height="57">

			<div class="form-floating">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디"> <label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호"> <label for="floatingPassword">비밀번호</label>
			</div>

			<div class="form-check text-start my-3">
				<input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault"> <label class="form-check-label" for="flexCheckDefault"> 아이디 저장 </label>
			</div>
			<div>
				<c:if test="${param.message == 'error'}">
					<p style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</p>
				</c:if>
			</div>
			<button class="btn btn-primary w-100 py-2" id="btnLogin">로그인</button>
			<p class="mt-5 mb-3 text-body-secondary">© workspace.</p>
		</form>
	</main>
</body>
</html>