<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>觉老师的书店|订单</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/shop-homepage.css" rel="stylesheet">
</head>
<body>
<!-- Navigation head文件 -->
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="row">
        <div style="margin: 0 auto; margin-top: 50px; width: 950px;">
            <strong>订单详情</strong>
            <table class="table table-hover table-bordered">
                <tbody>
                <tr class="warning">
                    <th colspan="5">订单编号:9005</th>
                </tr>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <tr class="active">
                    <td  style="text-align: center"><input type="hidden" name="id"
                                                      value="22"> <img src="${pageContext.request.contextPath}/pic/454a2e.jpg" width="50"
                                                                       height="80"></td>
                    <td width="30%"><a target="_blank"> 你好，旧时光</a></td>
                    <td width="20%">￥298.00</td>
                    <td width="10%">2</td>
                    <td width="15%"><span class="subtotal">￥596.00</span></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="text-align: left; margin-right: 120px;">
            商品金额: <strong style="color: #ff6600;">￥596.00元</strong>
        </div>

    </div>

    <div>
        <hr />
        <form class="form-horizontal" id="orderForm"
              style="margin-top: 5px; margin-left: 150px;">
            <div class="form-group">
                <label for="username" class="col-sm-1 control-label">地址</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="username"
                           placeholder="请输入收货地址">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-1 control-label">收货人</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="inputPassword3"
                           placeholder="请输收货人">
                </div>
            </div>
            <div class="form-group">
                <label for="confirmpwd" class="col-sm-1 control-label">电话</label>
                <div class="col-sm-5">
                    <input type="password" class="form-control" id="confirmpwd"
                           placeholder="请输入联系方式">
                </div>
            </div>
        </form>

        <hr />

        <div style="margin-top: 5px; margin-left: 150px;">
            <strong>选择银行：</strong>
            <p>
                <br /> <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"
                              checked="checked" />工商银行 <img src="assets/bank_img/icbc.bmp"
                                                            align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
                                                                                                             name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
                    src="assets/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
                    src="assets/bank_img/abc.bmp" align="middle" /> <br /> <br /> <input
                    type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
                    src="assets/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
                <img src="assets/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
                    src="assets/bank_img/ccb.bmp" align="middle" /> <br /> <br /> <input
                    type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
                    src="assets/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
                <img src="assets/bank_img/cmb.bmp" align="middle" />

            </p>
            <hr />
            <p style="text-align: right; margin-right: 100px;">
                <a href="javascript:document.getElementById('orderForm').submit();">
                    <button class="btn btn-primary">订单支付</button>
                </a>
            </p>
            <hr />

        </div>
    </div>

</div>




<!-- Footer  结尾 -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

