
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id =  request.getParameter("id");
    String pw = request.getParameter("pw");
    if(id.isBlank() || id.isEmpty() || pw.isBlank() || pw.isEmpty()){
        request.setAttribute("status","id,pw가 정확하지 않습니다.");
        request.getRequestDispatcher("login2.jsp").forward(request,response);
    }
%>
<html>
<head>
    <title>뷰</title>
</head>
<body>
<h2> id :  <%= id %></h2>
<h2> pw :  <%= pw%></h2>
</body>
</html>
