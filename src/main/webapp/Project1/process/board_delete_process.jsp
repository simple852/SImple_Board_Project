
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="title_id" value="${param.title_id}"/> <%--글번호--%>
<%--<c:set var="mem_id" value="${param.writer}" /> &lt;%&ndash;요청보낸 유저 아이디&ndash;%&gt;--%>
<%--<sql:query var="board" dataSource="jdbc/web" >--%>
<%--    select * from board_tbl where id=${title_id};--%>
<%--</sql:query>--%>


<sql:update var="delete" dataSource="jdbc/web">
    DELETE FROM board_tbl WHERE id=${title_id};
</sql:update>


