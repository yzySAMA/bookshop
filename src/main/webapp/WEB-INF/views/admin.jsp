<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>觉老师的书店|后台管理</title>
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

</head>
<body>
<!--/header-->
<jsp:include page="admin_header.jsp"/>
<!--header/-->

<!--/页面主体-->
<div class="container">
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button type="button" class="btn  btn-primary">新增</button>
            <button type="button" class="btn  btn-danger">删除</button>
        </div>
    </div>

    <!--/table-->
    <div class="row">
        <div class="col-sm-12">
            <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                <thead>
                <tr role="row">
                    <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">pid</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">书名(pname)</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">价格(price)</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">图片(pimage)</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">描述(pdesc)</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">类型(cname)</th>
                    <th  tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${page.list}" var="product">
                        <tr role="row" >
                            <td class="sorting_1">${product.pid}</td>
                            <td>${product.pname}</td>
                            <td>${product.price}</td>
                            <td>${product.pimage}</td>
                            <td>${product.pdesc}</td>
                            <td>${product.category.cname}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/productMsg.do?pid=${product.pid}&pn=${page.pageNum}">
                                    <button type="button" class="btn  btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                    </button>
                                </a>
                                <a href="${pageContext.request.contextPath}/productDel.do?pid=${product.pid}&pn=${page.pageNum}">
                                    <button type="button" class="btn  btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                    </button>
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!--table/-->

    <!--/分页信息-->
    <div class="row">

        <!--分页文字信息-->
        <div class="col-md-7">
            当前第${page.pageNum}页，共${page.pages}页，总共${page.total}条记录
        </div>
        <!--分页条信息-->

        <div class="col-md-5">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/productInfo.do?pn=1">首页</a></li>

                    <c:if test="${page.hasPreviousPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/productInfo.do?pn=${page.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${!page.hasPreviousPage}">
                        <li class="disabled">
                            <a href="${pageContext.request.contextPath}/productInfo.do?pn=${page.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${page.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num ==page.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != page.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/productInfo.do?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${page.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/productInfo.do?pn=${page.nextPage}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!page.hasNextPage}">
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${pageContext.request.contextPath}/productInfo.do?pn=${page.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!--分页信息/-->
</div>
<!--页面主体/-->





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
  });
</script>
</body>
</html>
