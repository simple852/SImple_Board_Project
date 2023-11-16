<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-14
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>   <%
    String data1=request.getParameter("data1");
    String data2=request.getParameter("data2");
    config.getServletContext().setAttribute("id","simple852");
%>


<html>
<head>
    <title>response</title>
</head>
<body>
<h3> 받은 데이터2 : <%= data1%></h3>
<h3> 받은 데이터2 : <%= data2%></h3>
<h3> 받은 데이터2 : <%= config.getServletContext("id")%></h3>
</body>
</html>
