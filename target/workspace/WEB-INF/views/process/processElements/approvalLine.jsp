<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.List" %>
<%@ page import="himedia.project.workspace.dto.Member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="step-wizard">
<!-- TODO:: 231221 select에 name 추가 -->
	<ul class="step-wizard-list">
		<li class="step-wizard-item">
			<span class="progress-count"></span>
			<div class="mt-4">${sessionScope.name} ${sessionScope.position}</div>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span>
			<select id="firstApproverNo" name="firstApproverNo" class="form-select mt-3">
				<option value="select">선택하세요</option>
				   <c:forEach var="member" items="${members}">
				   		<c:if test="${member.positionNo lt sessionScope.positionNo and member.empNo ne sessionScope.empNo}">
				       		<option value="${member.empNo}" positionno="${member.positionNo}">${member.name} ${member.position}</option>
				   		</c:if>
				   </c:forEach>
			</select>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span> 
			<select id="secondApproverNo" name="secondApproverNo" class="form-select mt-3" disabled>
			</select>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span>
			<select id="thirdApproverNo" name="thirdApproverNo" class="form-select mt-3" disabled>
			</select>
		</li>
	</ul>
</section>
