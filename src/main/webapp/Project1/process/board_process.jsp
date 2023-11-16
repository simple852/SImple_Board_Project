<%@ page import="com.mysql.cj.Session" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="title" value="${param.title}"/>
<c:set var="content" value="${param.content}"/>
<c:set var="writer" value="${param.id}"/>



<sql:query var="check" dataSource="jdbc/web">
    select * from member_Tbl where member_id = '${writer}'
</sql:query>


<%--select row 값 가져오기--%>
    <c:forEach items="${check.rows}" var="values" >
        <c:set var="writerId" value="${values.id}"/>

    </c:forEach>


<sql:update var="insert" dataSource="jdbc/web">
   insert into board_tbl(title, content, member_id) values('${title}',"${content}",'${writerId}')
</sql:update>
<c:if test="${insert == 0}">
    입력실패
</c:if>
<c:if test="${insert == 1}">
    <c:redirect url="../main.jsp"/>

</c:if>



