<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- Contact Us" />
</jsp:include>


<!-- breadcrumb -->
<div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
    <div class="container">
        <h2 class="breadcrumb-title">Contact Us</h2>
        <ul class="breadcrumb-menu">
            <li><a href="/">Home</a></li>
            <li class="active">Contact Us</li>
        </ul>
    </div>
</div>
<!-- breadcrumb end -->


<!-- contact area -->
<div class="contact-area py-120">
    <div class="container">
        <div class="contact-content">
            <div class="row">
                <div class="col-md-3">
                    <div class="contact-info">
                        <div class="contact-info-icon">
                            <i class="fal fa-map-location-dot"></i>
                        </div>
                        <div class="contact-info-content">
                            <h5>Office Address</h5>
                            <p><%@ include file="/info/address.jsp" %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="contact-info">
                        <div class="contact-info-icon">
                            <i class="fal fa-phone-volume"></i>
                        </div>
                        <div class="contact-info-content">
                            <h5>Call Us</h5>
                            <p><a href="tel:<%@ include file="/info/phone.jsp" %>"><%@ include file="/info/phone.jsp" %></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="contact-info">
                        <div class="contact-info-icon">
                            <i class="fal fa-envelopes"></i>
                        </div>
                        <div class="contact-info-content">
                            <h5>Email Us</h5>
                            <p><a href="mailto:<%@ include file="/info/email.jsp" %>"><%@ include file="/info/email.jsp" %></a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="contact-info">
                        <div class="contact-info-icon">
                            <i class="fal fa-alarm-clock"></i>
                        </div>
                        <div class="contact-info-content">
                            <h5>Open Time</h5>
                            <p><%@ include file="/info/open time.jsp" %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact-wrapper">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="contact-img">
                        <img src="assets/img/contact/01.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 align-self-center">
                    <div class="contact-form">
                        <div class="contact-form-header">
                            <h2>Get In Touch</h2>
                            <p>Ready to take the next step? Reach out to us and let's start the conversation. Your inquiries matter, and we're here to help. Get in touch today!</p>
                        </div>
                        <form method="post" action="https://www.pickuptrucks.co.tz/motex/assets/php/contact.php" id="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="name"
                                            placeholder="Your Name" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email"
                                            placeholder="Your Email" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject"
                                    placeholder="Your Subject" required>
                            </div>
                            <div class="form-group">
                                <textarea name="message" cols="30" rows="5" class="form-control"
                                    placeholder="Write Your Message"></textarea>
                            </div>
                            <button type="submit" class="theme-btn">Send
                                Message <i class="far fa-paper-plane"></i></button>
                            <div class="col-md-12 mt-3">
                                <div class="form-messege text-success"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end contact area -->

<!-- map -->
<div class="contact-map">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1330.942932842571!2d-1.9081062223840703!3d34.65718711594323!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd787ca7abf0facf%3A0x5ea075eea8038ba1!2sEhei%20%3A%20School%20Des%20Hautes%20Studies%20D&#39;ing%C3%A9nierie%20Oujda!5e0!3m2!1sen!2sma!4v1701896882429!5m2!1sen!2sma" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</div>

<jsp:include page="template/bottom.jsp" />