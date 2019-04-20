<%--
  Created by IntelliJ IDEA.
  User: yzy
  Date: 2019/4/20
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="refresh" content="2;url=index"/>
    <style>
        span{
            color: transparent;
            -webkit-text-stroke: 1px red;
            letter-spacing: 0.04em;
            font-size: 50px;
        }

    </style>
</head>
<body style="text-align: center">
    <div>
        <img src="${pageContext.request.contextPath}/assets/img/pimage/404.png">
    </div>
    <div>
            <span>2秒后返回首页</span>
    </div>
</body>
</html>
