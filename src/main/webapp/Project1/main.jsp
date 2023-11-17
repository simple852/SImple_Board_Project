<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="sessionId" value="${sessionScope.get('sessionId')}"/>
<c:set var="sessionIndex" value="${sessionScope.get('sessionIndex')}"/>


<c:if test="${sessionId == null}">
    <c:redirect url="login.jsp"/>
</c:if>


<sql:query var="board" dataSource="jdbc/web">
    SELECT a.id,a.title,a.created_date, a.count,b.member_id FROM board_tbl as a join member_tbl as b on (a.member_id = b.id ) order by a.created_date desc
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

    <link rel="stylesheet" href="css/board.css">
    <script src="js/defualt.js"> </script>


<body>


<div class="section">
    <div class="container">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <button type="button" onclick="window.open('write.jsp')">글쓰기</button>
                    <button type="button" id="messageBtn">쪽지</button>
                    <button type="button" onclick="window.history.back()">로그아웃</button>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-board">
                                <table class="board">
                                    <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${board.rows}" var="values" >
                                          <tr>
                                              <td>${values.id}</td>
                                              <td><a href="board_item.jsp?item=${values.id}">${values.title}</a></td>
                                              <td>${values.member_id}</td>
                                              <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${values.created_date}"/></td>
                                              <td>${values.count}</td>
                                          </tr>

                                        </c:forEach>
                                    </tbody>

                                </table>



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

    const messageBtn = document.getElementById('messageBtn');
    var _width = 700;
    var _height = 800;

    var _left  =Math.ceil((window.screen.width-_width)/2);
    var _top  =Math.ceil((window.screen.height-_height)/2);

console.log(_top)
    const status = "toolbar=no,resizeable=yes,status=no,menubar=no," +
        "width="+_width+",height="+_height+",left="+_left+",top="+_top+""
    messageBtn.onclick=(event)=>{
        window.open("message/message.jsp","message",status)
    }

</script>