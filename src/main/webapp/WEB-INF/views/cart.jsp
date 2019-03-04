<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>购物车</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
</head>
<body>
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>
    <c:if test="${!empty cart.cartItemMap}">
        <div class="container">
            <div class="row" style="margin-top: 30px">
                <div class="col-md-4">
                    <h1>购物车详情</h1>
                </div>
                <div class="col-md-2 col-md-offset-6" >
                    <a href="${pageContext.request.contextPath}/cartDel"><button class="btn btn-danger">清空购物车</button></a>
                </div>
            </div>
            <div class="row">
                <table class="table table-hover table-bordered">
                    <tr>
                        <td>图片</td>
                        <td>商品名</td>
                        <td>价格</td>
                        <td>数量</td>
                        <td>小计</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${cart.cartItemMap}" var="entry">
                        <tr>
                            <td>
                                <img style="width: 75px; height: 100px;" src="${pageContext.request.contextPath}/pic/${entry.value.product.pimage}">
                            </td>
                            <td>
                                    ${entry.value.product.pname}
                            </td>
                            <td>
                                    ${entry.value.product.price}
                            </td>
                            <td>
                                    ${entry.value.buyNum}
                            </td>
                            <td>
                                    ${entry.value.subTotal}
                            </td>
                            <td>
                                <a href="cartItemDel?pid=${entry.value.product.pid}"><button class="btn btn-danger">删除</button></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="row">
                <div class="col-md-2 col-md-offset-10">
                    <span>总价：￥${cart.total}</span>
                    <button class="btn btn-primary">提交订单</button>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${empty cart.cartItemMap}">
        <img src="${pageContext.request.contextPath}/assets/img/pimage/cart.gif">
        <a href="index"><button class="btn btn-primary">返回主页继续购物</button></a>
    </c:if>
<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
