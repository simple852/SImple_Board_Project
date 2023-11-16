<%@ page import="com.example.demo1.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8"); //일단 인코딩 한글깨짐 방지
    String id = request.getParameter("check_id"); // 입력한 값 가져오기
    MemberDAO memberDAO = new MemberDAO(); // db연결을 위한 연결 객체 생성
    boolean result = memberDAO.check_id(id); // dao 객체에 있는 메서드로 중복 확인 사용가능 true, 불가 false
%>
<html>
<head>
    <title>ID Check</title>
</head>
<body>
<%
    if (result) { //rsult가 true면 입장, 사용가능   %>
<%=id%>는 사용 가능합니다.
<input type="button" value="사용하기" onclick="set_id()">
<%  } else { %>
<form action="/Project1/idcheck.jsp"> <%--//get방식으로 다시 전송--%>
    <%= id%>는 사용할 수 없습니다.
    <input type="text" name="check_id">
    <input type="submit" value="중복확인">
    <%    } %>
</form>
</body>
</html>
<script>
    function set_id() {
        opener.document.getElementById("logid").value = "<%= id %>";
        self.close();
    }
</script>