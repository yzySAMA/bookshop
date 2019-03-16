<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
            <img width="50px" height="30px" src="assets/img/pimage/113.png">
            <a class="navbar-brand" href="index">觉老师的书店</a>




        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">


            <ul class="navbar-nav ml-auto">
                <c:if test="${empty user}">
                    <li class="nav-item active">
                        <a class="nav-link" href="login">登陆/注册</a>
                    </li>
                </c:if>
                <c:if test="${!empty user}">
                    <li class="nav-item " >
                        <a class="nav-link" style="color: white" href="#">欢迎您！${user.name}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="loginout.do">注销</a>
                    </li>
                </c:if>

                <li class="nav-item">
                    <a class="nav-link" href="cart">购物车</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">我的订单</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
