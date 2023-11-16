<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-14
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String status= (String) request.getAttribute("status");

   if(status == null){
       status = "";
   }
%>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<%--이상한 값이면  id, pw가 정확하지 않습니다 라고 표시되야함--%>
<%= status%>
<form action="view.jsp">
    id: <input type="text" name = "id" ><br>
    pw: <input type="text" name = "pw" ><br>
    <button>로그인</button>
</form>
<form action="beans.jsp" method="get">
    <input type="text" name="name">
    <input type="text" name="age">
    <button>버튼</button>
</form>

</body>
</html>
