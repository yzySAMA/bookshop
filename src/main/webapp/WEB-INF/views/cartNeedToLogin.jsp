<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TOLogin</title>
    <meta http-equiv="refresh" content="3;url=login"/>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color:#f2f2f2">
    <div class="container" style="margin-top: 30px">
        <div class="row" >
            <div class="col-md-6 col-md-offset-3">
                <h1 style="color:red">请先登录！（3秒后跳转）</h1>
            </div>
        </div>
    </div>
</body>
</html>
