<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>商品列表</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
</head>
<body style="background-color: #f0f3ef">
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>
<div  style="background-color: #696969;">
        <h2 style="color: white">---->${category.cname}</h2>
</div>
<div class="container">
    <!--商品展示-->
    <div class="row">
        <c:forEach items="${productList}" var="product" >
            <div class=" col-md-4" style="margin-bottom: 20px">
                <div class="card ">
                    <a href="#" style="text-align: center"><img class="card-img-top" style="width: 135px; height: 200px;" src="${pageContext.request.contextPath}/pic/${product.pimage}" alt=""></a>
                    <div class="card-body" style="height: 184px">
                        <h4 class="card-title" style="text-align: center">
                            <a href="#">${product.pname}</a>
                        </h4>
                        <h5 style="text-align: center">$${product.price}</h5>
                        <p class="card-text">${product.pdesc}</p>
                    </div>

                </div>
            </div>
        </c:forEach>

    </div>
</div>

<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
