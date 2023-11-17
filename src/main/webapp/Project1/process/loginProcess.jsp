<%@ page import="com.mysql.cj.Session" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<c:set var="id" value="${param.loginId}"/>
<c:set var="password" value="${param.loginPw}"/>
<%
   String sessionId = request.getParameter("loginId");

%>


<sql:query var="check" dataSource="jdbc/web">
    select member_id as id,member_pw as pw , id from member_Tbl where member_id = '${id}' and member_pw = '${password}'
</sql:query>

<%--select row 값 가져오기--%>
    <c:forEach items="${check.rows}" var="values" >
        <c:set var="checkId" value="${values.member_id}"/>
        <c:set var="index" value="${values.id}"/>

    </c:forEach>


<c:if test="${checkId == null}">


    <c:redirect url="../login.jsp"/>
</c:if>
<c:if test="${checkId  != null}">


    <c:set var="sessionIndex" value="${index}" scope="session"/>
    <c:set var="sessionId" value="${checkId}" scope="session"/>
    <c:redirect url="../main.jsp"/>


</c:if>


