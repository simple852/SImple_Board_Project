<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="messageId" value="${param.item}"/>
<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<c:if test="${sessionId == null}">
    <c:redirect url="../login.jsp"/>
</c:if>
<sql:query var="boardItem" dataSource="jdbc/web">
    SELECT a.id as id, a.title as title,a.content as content, a.from, concat(b.member_id,'') as `from`,a.`read` as `read`, a.send_date as send_date from message_tbl as a
    left join member_tbl as b on(a.`from` = b.id ) where a.id = ${messageId} order by id desc
</sql:query>

<sql:query var="sendQuery" dataSource="jdbc/web">
    SELECT `from`  from message_tbl where id = ${messageId} order by id desc
</sql:query>



<sql:update var="update" dataSource="jdbc/web">
  update message_tbl set `read` = '읽음' where id = ${messageId} and `to` = ${sessionScope.get("sessionIndex")}

</sql:update>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="../css/board.css">


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board-item">
                                <button type="button" onclick="location.href='message.jsp' ">뒤로가기</button>
                                <c:forEach items="${sendQuery.rows}" var="send" >
                                    <c:if test="${sessionScope.get('sessionIndex') != send.from  }">
                                        <button type="button" onclick="window.location='sendmessage.jsp?receive=${send.from}'">답장보내기</button>
                                    </c:if>

                                </c:forEach>
                                <c:forEach items="${boardItem.rows}" var="values" >
                                        <div class="title-item"> 제목 :${values.title}</div>
                                    보낸사람 : <span>${values.from}</span>
                                        <div class="content-item">${values.content}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>