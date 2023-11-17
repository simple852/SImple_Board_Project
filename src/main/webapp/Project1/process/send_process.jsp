<%@ page import="com.mysql.cj.Session" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="title" value="${param.title}"/>
<c:set var="content" value="${param.content}"/>
<c:set var="sendId" value="${sessionScope.get('sessionIndex')}"/>
<c:set var="receiveId" value="${param.receiveId}"/>
<%
  String[] value  = request.getParameterValues("receiveId");
%>
<c:set var="receiveId" value="<%= value %>" />




<c:forEach items="${receiveId}" var="received" varStatus="status" >

    <sql:update var="insert" dataSource="jdbc/web">
        insert into message_tbl(title, content, `from`, `to`) values('${title}','${content}','${sendId}', '${receiveId[status.index]}')
    </sql:update>

</c:forEach>


<c:if test="${insert == 0}">
    입력실패
</c:if>
<c:if test="${insert >= 1}">
    <c:redirect url="../message/message.jsp"/>

</c:if>


