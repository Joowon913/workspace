<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert</title>
<script>
    var msg = "<c:out value='${message}'/>";
    var url = "<c:out value='${url}'/>";
    alert(msg);
    location.href = url;
</script>
</head>
<body>

</body>
</html>