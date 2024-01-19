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
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="false"
                                    aria-controls="collapseOne">
                                <span><i class="far fa-question"></i></span> What Happens After I Confirm My Purchase?
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show"
                             aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                Once you confirm your purchase online, you'll have the option to visit our dealership to complete the payment process and take possession of your chosen vehicle. Our team will guide you through the necessary steps, ensuring a smooth and secure transaction. Feel free to reach out to our customer support for any assistance or to schedule your visit.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <span><i class="far fa-question"></i></span> How Can I Become A Member?
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                Becoming a member is simple! Visit our registration page, provide the necessary details, and follow the prompts to create your account. Once registered, you'll unlock exclusive member benefits, personalized services, and the ability to track your transactions effortlessly.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <span><i class="far fa-question"></i></span> How Can I Become A Member?
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                Becoming a member is easy! Simply navigate to our registration page, fill in the required details, and follow the prompts to create your account. Once registered, you'll have access to exclusive member benefits, personalized services, and the ability to track your transactions seamlessly.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false"
                                    aria-controls="collapseFour">
                                <span><i class="far fa-question"></i></span> What Information Do You Collect?
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse"
                             aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                We collect information to enhance your experience, including details provided during registration and transaction processes. Rest assured, your privacy is important to us, and we handle your information with the utmost care. For more details, please refer to our Privacy Policy.
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