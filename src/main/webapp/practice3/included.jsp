<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>

<html>
<head>
    <title>included</title>
</head>
<style>
    div{
        border: 1px solid black;
    }
</style>
<body>
<div>THIS IS INCLUDED</div>
${param.name}
${param.age}
${param.etc}

</body>
</html>
