<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>觉老师的书店|商品的添加</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/Ionicons/css/ionicons.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/AdminLTE.min.css"/>
    <!-- iCheck -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/iCheck/square/blue.css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
     folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/skins/_all-skins.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bower_components/select2/dist/css/select2.min.css">
</head>
<body>
<jsp:include page="admin_header.jsp"/>
<div class="row">
    <div class="col-md-4 col-md-offset-1">
        <h1>商品添加</h1>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <!--表单提交 上传图片需要指定属性-->
        <form role="form" action="${pageContext.request.contextPath}/add.do" method="post"
                enctype="multipart/form-data">
            <table class="table table-hover">
                <tr>
                    <td>商品类型：</td>
                    <td>
                        <div class="form-group">
                            <select class="form-control select2 " name="cid" style="width: 100%;" tabindex="-1" aria-hidden="true">
                                <c:forEach items="${categoryList}" var="cate">
                                    <option value="${cate.cid}">${cate.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>商品名称：</td>
                    <td>
                        <div class="form-group">
                            <input type="text" name="pname" class="form-control"
                                   id="exampleInputEmail1" placeholder="商品名称">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>商品价格：</td>
                    <td>
                        <div class="form-group">
                            <input type="text" name="price" class="form-control price"
                                   id="exampleInputPassword2" placeholder="商品价格">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>商品图片：</td>
                    <td>
                        <div class="form-group">
                            <input type="file" name="pictureFile" class="form-control" id="exampleInputPassword4" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>商品描述：</td>
                    <td>
                        <div class="form-group">
                            <textarea name="pdesc" id="" cols="30" rows="5" ></textarea>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="box-footer">
                <button type="submit" class="add btn btn-primary">添加</button>
            </div>
        </form>
    </div>
</div>


<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/assets/plugins/iCheck/icheck.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/assets/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/assets/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/assets/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/assets/js/demo.js"></script>

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
    $(".add").click(function () {
      alert("添加成功！")
    })
  });

  var record={
    num:""
  }
  $(".price").keyup(function () {
    var decimalReg=/^\d{0,8}\.{0,1}(\d{1,2})?$/;//var decimalReg=/^[-\+]?\d{0,8}\.{0,1}(\d{1,2})?$/;
    if(this.value!=""&&decimalReg.test(this.value)){
      record.num=this.value;
    }else{
      if(this.value!=""){
        this.value=record.num;
      }
    }

  });
</script>
</body>
</html>
