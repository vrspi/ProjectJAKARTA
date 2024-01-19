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
            <div class="col-lg-6">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <span><i class="far fa-question"></i></span> How Long Does A Car Buy Take ?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show"
                             aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                We denounce with righteous indignation and dislike men who
                                are so beguiled and demoralized by the charms of pleasure of the moment, so
                                blinded by desire. Ante odio dignissim quam, vitae pulvinar turpis erat ac elit
                                eu orci id odio facilisis pharetra.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <span><i class="far fa-question"></i></span> How Can I Become A Member
                                ?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                We denounce with righteous indignation and dislike men who
                                are so beguiled and demoralized by the charms of pleasure of the moment, so
                                blinded by desire. Ante odio dignissim quam, vitae pulvinar turpis erat ac elit
                                eu orci id odio facilisis pharetra.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false"
                                    aria-controls="collapseThree">
                                <span><i class="far fa-question"></i></span> What Payment Gateway You Support ?
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse"
                             aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                We denounce with righteous indignation and dislike men who
                                are so beguiled and demoralized by the charms of pleasure of the moment, so
                                blinded by desire. Ante odio dignissim quam, vitae pulvinar turpis erat ac elit
                                eu orci id odio facilisis pharetra.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false"
                                    aria-controls="collapseFour">
                                <span><i class="far fa-question"></i></span> How Can I Cancel My Request ?
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse"
                             aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                We denounce with righteous indignation and dislike men who
                                are so beguiled and demoralized by the charms of pleasure of the moment, so
                                blinded by desire. Ante odio dignissim quam, vitae pulvinar turpis erat ac elit
                                eu orci id odio facilisis pharetra.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- faq area end -->

<jsp:include page="template/bottom.jsp" />