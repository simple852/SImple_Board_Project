<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="boardId" value="${param.item}"/>
<%--${sessionScope.get("sessionId")}--%>
<%--${sessionScope.get("sessionIndex")}--%>

<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>

<sql:query var="board" dataSource="jdbc/web" >
    select * from board_tbl where id=${boardId};
</sql:query>

<c:forEach items="${board.rows}" var="values" >
    <c:set var="board_writer" value="${values.member_id}"/>
</c:forEach>

<sql:query var="boardItem" dataSource="jdbc/web">
    SELECT a.id,a.title,a.content,a.created_date, a.count,b.member_id, a.update_date FROM board_tbl as a join member_tbl as b on (a.member_id = b.id )
    where a.id = ${boardId}
</sql:query>

<sql:update var="update" dataSource="jdbc/web">
    update board_tbl set count = count +1
    where id = ${boardId}
</sql:update>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="css/board.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js" defer></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board-item">
                                <form action="update.jsp" method="get">
                                    <button type="button" onclick="location.href='main.jsp' ">뒤로가기</button>
                                    <button type="submit" id="update">게시글 수정</button>
                                    <button type="button" id="delete">게시글 삭제</button>
                                    <c:forEach items="${boardItem.rows}" var="values" >
                                        <c:set var="update_date" value="${values.update_date}" />
                                        <c:set var="created_date" value="${values.created_date}" />
                                        <c:if test="${update_date == null}" >
                                            <div>작성일 : ${created_date}</div>
                                        </c:if>
                                        <c:if test="${update_date != null}" >
                                            <div>최근 수정일 : ${update_date}</div>
                                        </c:if>
                                        <div class="title-item"> 제목 :${values.title}</div>
                                        <input type="hidden" name="board_Id" value ="${values.id}"/>
                                        작성자 : <span>${values.member_id}</span>
                                        <div class="content-item">${values.content}</div>
                                    </c:forEach>

                                </form>

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

<script>
    const delete_btn = document.querySelector("#delete");
    const update_btn = document.querySelector("#update");
    if (${sessionIndex != board_writer}) {
        delete_btn.style.display = 'none';
        update_btn.style.display = 'none';
    }

    document.querySelector("#delete").onclick = () => {
        $.ajax({
            type:"POST",
            url:"process/board_delete_process.jsp",
            data: {
                board_id: ${boardId} // board id 글번호
            },
            success:function (data) {
                alert("삭제완");
                window.location.href="main.jsp";
            }
        })
    };

</script>