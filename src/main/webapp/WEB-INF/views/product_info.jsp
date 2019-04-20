<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${product.pname}</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
</head>
<body style="background-color: #f0f3ef">
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>
<div class="container" style="background-color: white">
    <div class="row">
        <div
                style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
            <a href="index">首页&nbsp;&nbsp;&gt;</a> <a href="productInfoByCid?cid=${category.cid}">${category.cname}&nbsp;&nbsp;&gt;</a>
            <a>${product.pname}</a>
        </div>
    </div>
    <div class="row" style="margin: 0 auto; width: 950px;">
        <div class="col-md-6 col-lg-6">
            <img style="opacity: 1; width: 400px; height: 350px;" title=""
                 class="medium"
                 src="${pageContext.request.contextPath}/pic/${product.pimage}">
        </div>

        <div class="col-md-6 col-lg-6">
            <div>
                <strong>${product.pname}</strong>
            </div>
            <div
                    style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
                <div>编号：${product.pid}</div>
            </div>

            <div style="margin: 10px 0 10px 0;">
                市场价: <strong style="color: #ef0101;">￥：${product.price}元</strong> 参 考 价：
                <del>￥${product.price+20}元</del>
            </div>
            <br>
            <div
                    style="padding: 10px; border: 1px solid #e7dbb1; width: 330px;  background-color: #7bfffa;">
                <div
                        style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
                    购买数量: <input id="buyNum" name="buyNum" value="1"
                                 maxlength="4" size="10" type="number" onkeyup="this.value=this.value.replace(/[^-|\d*]/,'')">
                </div>

                <div style="margin: 20px 0 10px 0;; text-align: center;">
                    <button id="cartBtn" class="badge-light btn btn-primary"><span class="glyphicon glyphicon-tower" ></span>加入购物车</button>
                </div>
            </div>
        </div>
    </div>
    <div style="width: 950px; margin: 0 auto;">
        <div
                style="background-color: #d3d3d3; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
            <strong>商品介绍</strong>
        </div>

        <div style="background-color: white">
            <p>${product.pdesc}</p>
        </div>
        <div style="background-color: #d3d3d3; width: 900px;">
            <table class="table table-bordered">
                <tbody>
                <tr class="active">
                    <th><strong>商品评论</strong></th>
                </tr>
                <tr class="warning">
                    <th>暂无商品评论信息 <a>[发表商品评论]</a></th>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="background-color: #d3d3d3; width: 900px;">
            <table class="table table-bordered">
                <tbody>
                <tr class="active">
                    <th><strong>商品咨询</strong></th>
                </tr>
                <tr class="warning">
                    <th>暂无商品咨询信息 <a>[发表商品咨询]</a></th>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $("#cartBtn").click(function () {
        var buyNum = $("#buyNum").val();
      if(confirm("您确定要把此图书添加到购物车吗")){
        var $buyNum=$("#buyNum").val();
        if($buyNum==null||$buyNum<=0){
          alert("请输入正确的购买数量!");
          return;
        }



        location.href="${pageContext.request.contextPath}/cartAdd?pid=${product.pid}&buyNum="+buyNum;

      }
    });



</script>
</body>
</html>
