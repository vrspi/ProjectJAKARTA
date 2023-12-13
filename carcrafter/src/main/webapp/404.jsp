<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:Template title="- Not Found">
    <jsp:attribute name="content">
        <!-- breadcrumb -->
        <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
            <div class="container">
                <h2 class="breadcrumb-title">404 Error</h2>
                <ul class="breadcrumb-menu">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">404 Error</li>
                </ul>
            </div>
        </div>
        <!-- breadcrumb end -->


        <!-- error area -->
        <div class="error-area py-120">
            <div class="container">
                <div class="col-md-8 mx-auto">
                    <div class="error-wrapper">
                        <div class="error-img">
                            <img src="assets/img/error/404.png" alt="">
                        </div>
                        <h2>Opos... Page Not Found!</h2>
                        <p>The page you looking for not found may be it not exist or removed.</p>
                        <a href="index.html" class="theme-btn">Go Back Home <i class="far fa-home"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- error area end -->
    </jsp:attribute>
</mt:Template>