<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>觉老师的书店</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
</head>
<body style="background-color: #f0f3ef">
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>


<!-- Page Content -->
<div class="container">
    <div class="row">

        <div class="col-md-3">
            <form style="margin-top: 20px;margin-bottom: 20px" >
                <input type="text"  placeholder="寻一本好书">
                <button type="submit" class="s btn-primary">搜索</button>
            </form>
            <!-- 商品类别展示 -->
            <div class="list-group">
                <c:forEach items="${categoryList}" var="category">
                    <a href="${pageContext.request.contextPath}/productInfoByCid?cid=${category.cid}" class="list-group-item" id="${category.cid}"><h4>${category.cname}</h4></a>
                </c:forEach>
            </div>
            <div style="margin-top: 20px">
                <a href="#"><img width="255px" height="420px" src="assets/img/pimage/4.jpg"></a>
                <a href="#"><img width="255px" height="420px" style="padding-top: 20px" src="assets/img/pimage/5.jpg"></a>
            </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">

            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <img class="d-block img-fluid" style="height: 350px; width: 900px;"
                             src="assets/img/pimage/1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" style="height: 350px; width: 900px;"
                             src="assets/img/pimage/2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block img-fluid" style="height: 350px; width: 900px;"
                             src="assets/img/pimage/3.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="row">
                <c:forEach items="${hotProduct}" var="product">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card ">
                            <a href="${pageContext.request.contextPath}/productInfoByPid?pid=${product.pid}" style="text-align: center"><img class="card-img-top" style="width: 135px; height: 200px;" src="${pageContext.request.contextPath}/pic/${product.pimage}" alt=""></a>
                            <div class="card">
                                <h4 class="card-title" style="text-align: center">
                                    <a href="${pageContext.request.contextPath}/productInfoByPid?pid=${product.pid}" >${product.pname}</a>
                                </h4>
                                <h5 style="text-align: center">￥${product.price}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
