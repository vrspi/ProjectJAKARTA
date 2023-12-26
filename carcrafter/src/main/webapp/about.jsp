<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:Template title="- About Us">
    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
        <div class="container">
            <h2 class="breadcrumb-title">About Us</h2>
            <ul class="breadcrumb-menu">
                <li><a href="index.html">Home</a></li>
                <li class="active">About Us</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->


    <!-- about area -->
    <div class="pt-60"></div>
    <%@ include file="partials/about.jsp" %>
    <!-- about area end -->


    <!-- counter area -->
    <%@ include file="partials/counter.jsp" %>
    <!-- counter area end -->


    <!-- testimonial area -->
    <%@ include file="partials/testimonials.jsp" %>
    <!-- testimonial area end -->


    <!-- team-area -->
    <%@ include file="partials/team.jsp" %>
    <!-- team-area end -->


    <!-- car brand -->
    <%@ include file="partials/brands.jsp" %>
    <!-- car brand end-->
</mt:Template>