<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>觉老师的书店|注册</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="/index.jsp"><b>觉老师的书店</b></a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">欢迎您的注册！</p>

        <%--表单的提交--%>
        <form id="myForm" action="register.do" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control"  placeholder="姓名" name="name">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback" style="text-align: center">
                <span class="fa fa-fw fa-male">:</span>
               <input type="radio" class="form-control"  name="sex" value="男">&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="fa fa-fw fa-female">:</span>
               <input type="radio" class="form-control"  name="sex" value="女">
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control"  placeholder="用户名" name="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password" placeholder="密码" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control"  placeholder="确认密码" name="repassword">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control"  placeholder="邮箱" name="email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control"  placeholder="电话" name="telephone">
                <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 我同意此<a href="#">协议条款</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
                Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
                Google+</a>
        </div>

        <a href="login" class="text-center">我已经拥有了一个账号</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery表单校验插件 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery/dist/jquery.validate.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/assets/plugins/iCheck/icheck.min.js"></script>
<!-- 表单校验 -->
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });

    var flag=false;
    //自定义校验
    $.validator.addMethod(
        //规则的名称
      "checkUsername",
      //校验的函数

      function (value,element,params) {
        $.ajax({
          "async":false,
          "url":"/checkUsername",
          "data":{"username":value},
          "type":"POST",
          "dataType":"json",
          "success":function (data) {
            flag=data;

          }
          
        });
        return !flag;
      }
    );
    $("#myForm").validate({
      rules:{
        "name":{
          "required":true
        },
        "username":{
          "required":true,
          "checkUsername":true
        },
        "password":{
          "required":true,
          "rangelength":[6,12]
        },
        "repassword":{
          "required":true,
          "rangelength":[6,12],
          "equalTo":"#password"
        },
        "email":{
          "required":true
        },
        "telephone":{
          "required":true
        }
      },
      messages:{
        "name":{
          "required":"姓名不能为空"
        },
        "username":{
          "required":"用户名不能为空",
          "checkUsername":"用户名已存在"
        },
        "password":{
          "required":"密码不能为空",
          "rangelength":"密码长度6-12位"
        },
        "repassword":{
          "required":"密码不能为空",
          "rangelength":"密码长度6-12位",
          "equalTo":"两次密码不一致"
        },
        "email":{
          "required":"邮箱不能为空"
        },
        "telephone":{
          "required":"电话号码不能为空"
        }
      }
    });
  });
</script>
</body>
</html>
