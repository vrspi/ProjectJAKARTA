<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- Testimonials" />
</jsp:include>

<!-- breadcrumb -->
<div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
    <div class="container">
        <h2 class="breadcrumb-title">Testimonials</h2>
        <ul class="breadcrumb-menu">
            <li><a href="/carcrafter/">Home</a></li>
            <li class="active">Testimonials</li>
        </ul>
    </div>
</div>
<!-- breadcrumb end -->


<!-- testimonial area -->
<%@ include file="partials/testimonials.jsp" %>
<!-- testimonial area end -->

<jsp:include page="template/bottom.jsp" />