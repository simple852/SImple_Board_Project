<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EL표현식</title>
</head>
<body>
${"10"+"1234"}


<div>
    100 div 9 => ${100 div 9} <br>
    100 div 2 => ${100 div 2} <br>
    100 mod 9 => ${100 mod 9} <br>
    <h5>문자열비교</h5>
    <div> "hello" == "hello =>${"hello" == "hello"}"</div>
    <div> "hello" == "hello =>${"hello".concat("hello") eq "hello"}"</div>
</div>

</body>
</html>
