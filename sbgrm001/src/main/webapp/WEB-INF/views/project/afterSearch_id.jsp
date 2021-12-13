<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/header.jsp" %>

<div>

<c:choose>
<c:when test="${fn:length(list) == 0}">검색된 아이디가 없습니다.</c:when>
<c:otherwise>
<div>
	<c:forEach var="dto" items="${list}" varStatus="status">
			<div>${dto.uid}</div>
	</c:forEach>
</div>



</c:otherwise>
</c:choose>
</div>













<%-- <%@ include file="inc/footer.jsp" %> --%>