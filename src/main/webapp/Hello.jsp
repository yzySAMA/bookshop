<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${pageContext.request.contextPath}
    <% response.sendRedirect("index");%>
</body>
</html>
