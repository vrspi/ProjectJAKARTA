<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- FAQ" />
</jsp:include>

<!-- breadcrumb -->
<div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
    <div class="container">
        <h2 class="breadcrumb-title">Frequently Asked Questions</h2>
        <ul class="breadcrumb-menu">
            <li><a href="/carcrafter/">Home</a></li>
            <li class="active">FAQ</li>
        </ul>
    </div>
</div>
<!-- breadcrumb end -->


<!-- faq area -->
<div class="faq-area py-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="faq-right">
                    <div class="site-heading mb-3">
                        <span class="site-title-tagline justify-content-start">Faq's</span>
                        <h2 class="site-title my-3">General <span>frequently</span> asked questions</h2>
                    </div>
                    <p class="about-text">Have questions? We've got answers. Explore our General FAQs to find quick solutions to common queries. If you don't see what you're looking for, feel free to reach out to our dedicated support team for personalized assistance.</p>
                    <div class="faq-img mt-3">
                        <img src="assets/img/faq/01.jpg" alt="">
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- faq area end -->

<jsp:include page="template/bottom.jsp" />