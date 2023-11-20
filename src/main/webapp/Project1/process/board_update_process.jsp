<%@ page import="org.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:set var="board_id" value="${param.board_id}"/> <%--글번호--%>
<c:set var="content" value="${param.content}" />
<c:set var="title" value="${param.title}" />

<sql:update var="update" dataSource="jdbc/web" >
    UPDATE board_tbl SET `title` = '${title}' , `content` =  '${content}', `update_date` = current_timestamp WHERE id = ${board_id};
</sql:update>

<%
    PrintWriter writer = response.getWriter();
    JSONObject json = new JSONObject();
    response.setContentType("application/json");
%>

<c:if test="${update == 0}">
    <% json.put("success", false); %> <%--실패했을 때--%>
</c:if>
<c:if test="${update == 1}">
    <% json.put("success", true);%> <%--성공--%>
</c:if>
<% writer.println(json); %>