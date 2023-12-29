<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:TemplateLoggedin title="- AddListing">
    <!-- breadcrumb -->
    <!-- <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
        <div class="container">
            <h2 class="breadcrumb-title">Add Listing</h2>
            <ul class="breadcrumb-menu">
                <li><a href="index.html">Home</a></li>
                <li class="active">Add Listing</li>
            </ul>
        </div>
    </div> -->
    <!-- breadcrumb end -->

    <div id="partialContainer">
    <!-- testimonial area -->
    <jsp:include page="partials/addlisting.jsp" />
    </div>


        
    <!-- testimonial area end -->
</mt:TemplateLoggedin>