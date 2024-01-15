<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.List" %>
<%@ page import="himedia.project.workspace.dto.Member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="step-wizard">
	<ul class="step-wizard-list">
		<li class="step-wizard-item">
			<span class="progress-count"></span>
			<div class="mt-4">${sessionScope.name} ${sessionScope.position}</div>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span>
			
			<select id="firstApproverNo" name="firstApproverNo" class="form-select mt-3">
			    <c:forEach var="member" items="${members}">
			        <c:if test="${member.empNo eq document.firstApproverNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}" selected>${member.name} ${member.position}</option>
			        </c:if>
			        <c:if test="${member.empNo ne document.firstApproverNo and member.positionNo lt sessionScope.positionNo and member.empNo ne sessionScope.empNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}">${member.name} ${member.position}</option>
			        </c:if>
			    </c:forEach>
			</select>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span>
			
			<select id="secondApproverNo" name="secondApproverNo" class="form-select mt-3">
			    <c:forEach var="member" items="${members}">
			        <c:if test="${member.empNo eq document.secondApproverNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}" selected>${member.name} ${member.position}</option>
			        </c:if>
			        <c:if test="${member.empNo ne document.secondApproverNo and member.positionNo lt document.firstApproverPositionNo and member.empNo ne sessionScope.empNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}">${member.name} ${member.position}</option>
			        </c:if>
			    </c:forEach>
			</select>
		</li>
		<li class="step-wizard-item current-item">
			<span class="progress-count"></span>
			
			<select id="thirdApproverNo" name="thirdApproverNo" class="form-select mt-3">
			    <c:forEach var="member" items="${members}">
			        <c:if test="${member.empNo eq document.thirdApproverNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}" selected>${member.name} ${member.position}</option>
			        </c:if>
			        <c:if test="${member.empNo ne document.thirdApproverNo and member.positionNo lt document.secondApproverPositionNo and member.empNo ne sessionScope.empNo}">
			        	<option value="${member.empNo}" positionno="${member.positionNo}">${member.name} ${member.position}</option>
			        </c:if>
			    </c:forEach>
			</select>
		</li>
	</ul>
</section>
