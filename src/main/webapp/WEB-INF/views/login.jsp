<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>觉老师的书店|登陆</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/Ionicons/css/ionicons.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/AdminLTE.min.css"/>
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/iCheck/square/blue.css"/>
</head>
<body class="hold-transition login-page" style=" background-image:url('${pageContext.request.contextPath}/assets/img/pimage/ts1.jpg') ">
<div class="login-box">
    <div class="login-logo">
        <a href="index"><b style="color: white">觉老师的书店</b></a>
    </div>

    <!-- /.登陆界面 -->
    <div class="login-box-body">
        <p class="login-box-msg">欢迎您的登陆！</p>
        <div>
            <%--错误信息回显--%>
            <span style="color:red;">${loginInfo}</span>
        </div>
        <form action="login.do" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="用户名" name="username">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">

                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登陆</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                Google+</a>
        </div>
        <!-- /.social-auth-links -->

        <a href="register" class="text-center">注册一个新的账号</a>
    </div>

</div>


<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/assets/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>