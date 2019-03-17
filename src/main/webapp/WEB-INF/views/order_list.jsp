<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>我的订单</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color:#f2f2f2">
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>

<div class="container" style="background-color:white;margin-top: 30px">
    <div class="row">
        <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
            <h1>我的订单</h1>
            <table class="table table-hover  table-bordered">
                <c:forEach items="${orderList}" var="order">
                    <tbody>
                    <tr class="success">
                        <th colspan="5">订单编号:${order.oid}&nbsp;&nbsp;&nbsp;${order.state==0?"未付款":"已付款"}</th>
                    </tr>
                    <tr class="warning">
                        <th>图片</th>
                        <th>商品</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    <c:forEach items="${order.orderitems}" var="orderitem">
                        <tr class="active">
                            <td width="60" width="40%">
                                <img src="${pageContext.request.contextPath}/pic/${orderitem.product.pimage}" width="70" height="60">
                            </td>
                            <td width="30%"><a target="_blank">${orderitem.product.pname}</a></td>
                            <td width="20%">￥${orderitem.product.price}</td>
                            <td width="10%">${orderitem.count}</td>
                            <td width="15%"><span class="subtotal">￥${orderitem.subtotal}</span></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>

</div>
<br><br><br><br><br><br>
<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>

<script>


</script>

</body>
</html>
