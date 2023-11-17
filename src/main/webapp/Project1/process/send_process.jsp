<%@ page import="com.mysql.cj.Session" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="title" value="${param.title}"/>
<c:set var="content" value="${param.content}"/>
<c:set var="sendId" value="${param.id}"/>
<c:set var="sendId" value="${param.id}"/>



<sql:update var="insert" dataSource="jdbc/web">
   insert into message(title, content, from, to) values('${title}',"${content}",'${sendId}', '${sendId}')
</sql:update>
<c:if test="${insert == 0}">
    입력실패
</c:if>
<c:if test="${insert == 1}">
    <c:redirect url="../message/message.jsp"/>

</c:if>



