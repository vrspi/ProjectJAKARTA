<%@ page import="com.carcrafter.model.Listing" %>
<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.BodyType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Jawad - Ayoub - Khalil -->
<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="" />
</jsp:include>

    <!-- hero area -->
    <div class="hero-section">
        <div class="hero-single">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-12 col-lg-6">
                        <div class="hero-content">
                            <h6 class="hero-sub-title wow fadeInUp" data-wow-delay=".25s">Welcome To
                                Car Crafter!</h6>
                            <h1 class="hero-title wow fadeInRight" data-wow-delay=".50s">
                                Best Way To Find Your <span>Dream</span> Car
                            </h1>
                            <p class="wow fadeInLeft" data-wow-delay=".75s">
                                Ready to embark on your car-buying journey?<br>Click now to explore our diverse selection and experience a seamless and transparent process.<br>Your dream car awaits!
                            </p>
                            <div class="hero-btn wow fadeInUp" data-wow-delay="1s">
                                <a href="Shop" class="theme-btn">Find Your Dream Car<i
                                        class="fas fa-arrow-right-long"></i></a>
                                <a href="about" class="theme-btn theme-btn2">Learn More<i
                                        class="fas fa-arrow-right-long"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-6">
                        <div class="hero-right">
                            <div class="hero-img wow fadeInRight" data-wow-delay=".25s">
                                <img src="assets/img/slider/hero-2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- hero area end -->

    
    
    <!-- car brand -->
    <%@ include file="partials/brands.jsp" %>
    <!-- car brand end-->
    
    
    <!-- about area -->
    <%@ include file="partials/about.jsp" %>
    <!-- about area end -->
    
    
    <!-- car area -->
    <div class="car-area bg py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> New Arrivals</span>
                        <h2 class="site-title">Let's Check Latest <span>Cars</span></h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                    List<Listing> cars = (List<Listing>) request.getAttribute("Cars");
                    if (cars != null) {
                        for (Listing car : cars) {
                %>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="car-img">
                            <% if(car.getCondition().getConditionTType().equals("New")) {%>
                            <span class="car-status status-2">New</span>
                            <% } else if(car.getCondition().getConditionTType().equals("Used")) {%>
                            <span class="car-status status-1">Used</span>
                            <% } else if(car.getCondition().getConditionTType().equals("Certified Pre-Owned")) {%>
                            <span class="car-status status-2 bg-primary">Certified Pre-Owned</span>
                            <% }
                                if (car.getImages() != null && car.getImages().size() > 0 && car.getImages().get(0).getImagePath() != null) {
                            %>
                            <img src="assets/upload/img/car/<%= car.getImages().get(0).getImagePath() %>" alt="ImageCar">
                            <%
                            } else {
                            %>
                            <img src="" alt="ImageCar">
                            <%
                                }
                            %>
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="singlecar?id=<%=car.getListingID()%>"><%=car.getTitle()%></a></h4>
                                <div class="car-rate">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <span>5.0 (58.5k Review)</span>
                                </div>
                            </div>
                            <ul class="car-list">
                                <li><i class="far fa-steering-wheel"></i><%=car.getTransmission().getTransmissionType()%></li>
                                <li><i class="far fa-road"></i><%=car.getMileage()%>km</li>
                                <li><i class="far fa-car"></i>Model: <%=car.getYear().getYear()%></li>
                                <li><i class="far fa-gas-pump"></i><%=car.getFuelType().getFuelType()%></li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price"><%=car.getPrice().intValue()%> MAD</span>
                                <a href="singlecar?id=<%=car.getListingID()%>" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="text-center mt-4">
                <a href="Shop" class="theme-btn">See More <i class="fas fa-arrow-right-long"></i> </a>
            </div>
        </div>
    </div>
    <!-- car area end -->

    
    <!-- counter area -->
    <%@ include file="partials/counter.jsp" %>
    <!-- counter area end -->
    
    
    <!-- car category -->
    <div class="car-category py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> Car Category</span>
                        <h2 class="site-title">Car By Body <span>Types</span></h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <%
                    List<BodyType> bodyTypes = (List<BodyType>) request.getAttribute("BodyTypes");
                    if (cars != null) {
                        for (BodyType body : bodyTypes) {
                %>
                <div class="col-6 col-md-4 col-lg-2">
                    <a class="category-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="category-img">
                            <img src="assets/img/category/<%= body.getBodyType() %>.png" alt="">
                        </div>
                        <h5><%= body.getBodyType() %></h5>
                    </a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
    <!-- car category end-->
    
    
    <!-- video area -->
    <div class="video-area pb-120">
        <div class="container-fluid px-0">
            <div class="video-content" style="background-image: url(assets/img/video/01.jpg);">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <div class="video-wrapper">
                            <a class="play-btn popup-youtube" href="https://www.youtube.com/watch?v=fkk211tx07Q">
                                <i class="fas fa-play"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- video area end -->


    <!-- testimonial area -->
    <%@ include file="partials/testimonials.jsp" %>
    <!-- testimonial area end -->


    <!-- choose area -->
    <div class="choose-area py-120">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="choose-content">
                        <div class="site-heading wow fadeInDown" data-wow-delay=".25s">
            <span class="site-title-tagline text-white justify-content-start">
                <i class="flaticon-drive"></i> Why Choose Us
            </span>
                            <h2 class="site-title text-white mb-10">We are dedicated <span>to provide</span> quality service</h2>
                            <p class="text-white">
                                At <strong>Car Crafter</strong>, we are committed to delivering exceptional service with integrity. Our mission is to provide top-notch automotive solutions, ensuring your journey with us is reliable and worry-free.
                            </p>
                        </div>
                        <div class="choose-img wow fadeInUp" data-wow-delay=".25s">
                            <img src="assets/img/choose/01.png" alt="">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="choose-content-wrapper wow fadeInRight" data-wow-delay=".25s">
                        <div class="row">
                            <div class="col-md-6 col-lg-6 mt-lg-5">
                                <div class="choose-item">
                                    <span class="choose-count">01</span>
                                    <div class="choose-item-icon">
                                        <i class="flaticon-car"></i>
                                    </div>
                                    <div class="choose-item-info">
                                        <h3>Best Quality Cars</h3>
                                        <p>Explore our curated selection of high-quality cars, ensuring you drive away with the best-in-class vehicles that meet your standards.</p>
                                    </div>
                                </div>
                                <div class="choose-item mb-lg-0">
                                    <span class="choose-count">03</span>
                                    <div class="choose-item-icon">
                                        <i class="flaticon-drive-thru"></i>
                                    </div>
                                    <div class="choose-item-info">
                                        <h3>Popular Brands</h3>
                                        <p>Discover renowned automotive brands in our collection, providing you with a wide range of options from trusted manufacturers.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div class="choose-item">
                                    <span class="choose-count">02</span>
                                    <div class="choose-item-icon">
                                        <i class="flaticon-chauffeur"></i>
                                    </div>
                                    <div class="choose-item-info">
                                        <h3>Certified Mechanics</h3>
                                        <p>Trust our certified mechanics for expert care and maintenance, ensuring your vehicle operates at peak performance.</p>
                                    </div>
                                </div>
                                <div class="choose-item mb-lg-0">
                                    <span class="choose-count">04</span>
                                    <div class="choose-item-icon">
                                        <i class="flaticon-online-payment"></i>
                                    </div>
                                    <div class="choose-item-info">
                                        <h3>Reasonable Price</h3>
                                        <p>Enjoy competitive and reasonable prices on our services, providing you with value for your investment in automotive excellence.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- choose area end -->


    <!-- cta-area -->
    <div class="cta-area pt-20">
        <div class="container">
            <div class="cta-wrapper" style="background-image: url(assets/img/cta/01.jpg);">
                <div class="row align-items-center">
                    <div class="col-lg-7 text-center text-lg-start">
                        <div class="cta-text cta-divider">
                            <h1>Discover Your Dream Car It's Simple and Affordable</h1>
                            <p>At <strong>Car Crafter</strong>, we make car ownership easy and affordable. Explore a curated selection of quality vehicles that fit your lifestyle. Your dream car is just a click away!</p>
                        </div>
                    </div>
                    <div class="col-lg-5 text-center text-lg-end">
                        <div class="mb-20">
                            <a href="tel:<%@ include file="/info/phone.jsp" %>" class="cta-number"><i class="far fa-headset"></i><%@ include file="/info/phone.jsp" %></a>
                        </div>
                        <div class="cta-btn">
                            <a href="Shop" class="theme-btn">Find Your Dream Car<i class="fas fa-arrow-right-long"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cta-area end -->


    <!-- blog area -->
    <div class="blog-area py-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> Our Blog</span>
                        <h2 class="site-title">Latest News & <span>Blog</span></h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <div class="blog-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="blog-item-img">
                            <img src="assets/img/blog/01.jpg" alt="Thumb">
                        </div>
                        <div class="blog-item-info">
                            <div class="blog-item-meta">
                                <ul>
                                    <li><a href="#"><i class="far fa-user-circle"></i> By Alicia Davis</a></li>
                                    <li><a href="#"><i class="far fa-calendar-alt"></i> January 29, 2023</a></li>
                                </ul>
                            </div>
                            <h4 class="blog-title">
                                <a href="blog?s=test">There are many variations of passage available.</a>
                            </h4>
                            <a class="theme-btn" href="blog?s=test">Read More<i class="fas fa-arrow-right-long"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="blog-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="blog-item-img">
                            <img src="assets/img/blog/02.jpg" alt="Thumb">
                        </div>
                        <div class="blog-item-info">
                            <div class="blog-item-meta">
                                <ul>
                                    <li><a href="#"><i class="far fa-user-circle"></i> By Alicia Davis</a></li>
                                    <li><a href="#"><i class="far fa-calendar-alt"></i> January 29, 2023</a></li>
                                </ul>
                            </div>
                            <h4 class="blog-title">
                                <a href="blog?s=test">There are many variations of passage available.</a>
                            </h4>
                            <a class="theme-btn" href="blog?s=test">Read More<i class="fas fa-arrow-right-long"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="blog-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="blog-item-img">
                            <img src="assets/img/blog/03.jpg" alt="Thumb">
                        </div>
                        <div class="blog-item-info">
                            <div class="blog-item-meta">
                                <ul>
                                    <li><a href="#"><i class="far fa-user-circle"></i> By Alicia Davis</a></li>
                                    <li><a href="#"><i class="far fa-calendar-alt"></i> January 29, 2023</a></li>
                                </ul>
                            </div>
                            <h4 class="blog-title">
                                <a href="blog?s=test">There are many variations of passage available.</a>
                            </h4>
                            <a class="theme-btn" href="blog?s=test">Read More<i class="fas fa-arrow-right-long"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog area end -->
    
    
    <!-- download area -->
    <div class="download-area mb-120">
        <div class="container">
            <div class="download-wrapper">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="download-content">
                            <div class="site-heading mb-4">
                                <span class="site-title-tagline justify-content-start">
                                    <i class="flaticon-drive"></i> Get Our App
                                </span>
                                <h2 class="site-title mb-10">Download <span>Our Car Crafter</span> App For Free</h2>
                                <p>
                                    There are many variations of passages available but the majority have suffered in some form going to use a passage by injected humour. 
                                </p>
                            </div>
                            <div class="download-btn">
                                <a href="#">
                                    <i class="fab fa-google-play"></i>
                                    <div class="download-btn-content">
                                        <span>Get It On</span>
                                        <strong>Google Play</strong>
                                    </div>
                                </a>
                                <a href="#">
                                    <i class="fab fa-app-store"></i>
                                    <div class="download-btn-content">
                                        <span>Get It On</span>
                                        <strong>App Store</strong>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="download-img">
                    <img src="assets/img/download/01.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- download area end -->
    

<jsp:include page="template/bottom.jsp" />