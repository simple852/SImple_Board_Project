<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="boardId" value="${param.item}"/>
${sessionScope.get("sessionId")}
${sessionScope.get("sessionIndex")}

<sql:query var="boardItem" dataSource="jdbc/web">
    SELECT a.id,a.title,a.content,a.created_date, a.count,b.member_id FROM board_tbl as a join member_tbl as b on (a.member_id = b.id )
    where a.id = ${boardId}
</sql:query>

<sql:update var="update" dataSource="jdbc/web">
  update board_tbl set count = count +1
    where id = ${boardId}
</sql:update>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="css/board.css">


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board-item">
                                <button type="button" onclick="location.href='main.jsp' ">뒤로가기</button>
                                <c:forEach items="${boardItem.rows}" var="values" >
                                        <div class="title-item"> 제목 :${values.title}

                                        </div>
                                    작성자 : <span>${values.member_id}</span>
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