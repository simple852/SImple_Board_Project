<%@ page import="java.util.Scanner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    const params = new URL(location.href).searchParams;
    let data = params.get("number");
    if(data === null){
        data = prompt("숫자를 입력해주세요");
        window.location = "gugu.jsp?number="+data;
    }
</script>
<%
    String number =  request.getParameter("number");

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% for (int i=1; i<= 20; i++){%>
<div>
    <span><%= number +"*" + String.valueOf(i)  %></span>
    <span><%= Integer.parseInt(number) * i%></span>
</div>
<%
    }
%>
</body>
</html>
