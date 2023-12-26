<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:Template title="- Team">
    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
        <div class="container">
            <h2 class="breadcrumb-title">Our Team</h2>
            <ul class="breadcrumb-menu">
                <li><a href="index.html">Home</a></li>
                <li class="active">Our Team</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->


    <!-- team-area -->
    <%@ include file="partials/team.jsp" %>
    <!-- team-area end -->
</mt:Template>