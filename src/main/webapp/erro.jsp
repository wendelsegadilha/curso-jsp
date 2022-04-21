<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erros do sistema</title>
</head>
<body>
    <h1>Ops! aconteceu um erro: entre em contato com a equipe de suporte do sistema</h1>
<%
    out.print(request.getAttribute("msg"));
%>
</body>
</html>
