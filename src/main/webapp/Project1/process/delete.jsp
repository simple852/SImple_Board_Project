
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<sql:update var="delete" dataSource="jdbc/web">
    delete from message_tbl where `to` = '${param.deleteId}' or `from` = '${param.deleteId}'
</sql:update>
<sql:update var="delete" dataSource="jdbc/web">
    delete from board_tbl where member_id = '${param.deleteId}'
</sql:update>



<sql:update var="delete" dataSource="jdbc/web">
    delete from member_tbl where id = '${param.deleteId}'
</sql:update>

<c:remove var="sessionId" />
<c:remove var="sessionIndex"/>


<c:if test="${delete == 0}">
    <c:redirect url="../main.jsp?delete=false"/>
</c:if>
<c:if test="${delete >= 1}">
    <c:redirect url="../login.jsp?delete=true"/>

</c:if>




