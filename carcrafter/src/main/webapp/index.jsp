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
                                Motex!</h6>
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
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="car-img">
                            <span class="car-status status-1">Used</span>
                            <img src="assets/img/car/01.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">Mercedes Benz Car</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$45,620</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="car-img">
                            <img src="assets/img/car/02.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">Yellow Ferrari 458</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$90,250</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="car-img">
                            <img src="assets/img/car/03.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">Black Audi Q7</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$44,350</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay="1s">
                        <div class="car-img">
                            <span class="car-status status-2">New</span>
                            <img src="assets/img/car/04.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">BMW Sports Car</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$78,760</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="car-img">
                            <span class="car-status status-1">Used</span>
                            <img src="assets/img/car/05.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">White Tesla Car</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$64,230</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="car-img">
                            <span class="car-status status-2">New</span>
                            <img src="assets/img/car/06.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">White Nissan Car</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$34,540</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="car-img">
                            <img src="assets/img/car/07.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">Mercedes Benz Suv</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$75,820</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item wow fadeInUp" data-wow-delay="1s">
                        <div class="car-img">
                            <img src="assets/img/car/08.jpg" alt="">
                            <div class="car-btns">
                                <a href="#"><i class="far fa-heart"></i></a>
                                <a href="#"><i class="far fa-arrows-repeat"></i></a>
                            </div>
                        </div>
                        <div class="car-content">
                            <div class="car-top">
                                <h4><a href="#">Red Hyundai Car</a></h4>
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
                                <li><i class="far fa-steering-wheel"></i>Automatic</li>
                                <li><i class="far fa-road"></i>10.15km / 1-litre</li>
                                <li><i class="far fa-car"></i>Model: 2023</li>
                                <li><i class="far fa-gas-pump"></i>Hybrid</li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price">$25,620</span>
                                <a href="#" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
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
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="category-img">
                            <img src="assets/img/category/01.png" alt="">
                        </div>
                        <h5>Sedan</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="category-img">
                            <img src="assets/img/category/02.png" alt="">
                        </div>
                        <h5>Compact</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="category-img">
                            <img src="assets/img/category/03.png" alt="">
                        </div>
                        <h5>Convertible</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1s">
                        <div class="category-img">
                            <img src="assets/img/category/04.png" alt="">
                        </div>
                        <h5>SUV</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1.25s">
                        <div class="category-img">
                            <img src="assets/img/category/05.png" alt="">
                        </div>
                        <h5>Crossover</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1.50s">
                        <div class="category-img">
                            <img src="assets/img/category/06.png" alt="">
                        </div>
                        <h5>Wagon</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="category-img">
                            <img src="assets/img/category/07.png" alt="">
                        </div>
                        <h5>Sports</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="category-img">
                            <img src="assets/img/category/08.png" alt="">
                        </div>
                        <h5>Pickup</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="category-img">
                            <img src="assets/img/category/09.png" alt="">
                        </div>
                        <h5>Family MPV</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1s">
                        <div class="category-img">
                            <img src="assets/img/category/10.png" alt="">
                        </div>
                        <h5>Coupe</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1.25s">
                        <div class="category-img">
                            <img src="assets/img/category/11.png" alt="">
                        </div>
                        <h5>Electric</h5>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-2">
                    <a href="#" class="category-item wow fadeInUp" data-wow-delay="1.50s">
                        <div class="category-img">
                            <img src="assets/img/category/12.png" alt="">
                        </div>
                        <h5>Luxury</h5>
                    </a>
                </div>
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


    <!-- car dealer -->
    <!--<div class="car-dealer pb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="site-heading text-center">
                        <span class="site-title-tagline"><i class="flaticon-drive"></i> Car Dealers</span>
                        <h2 class="site-title">Best Dealers In <span>Your City</span></h2>
                        <div class="heading-divider"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="dealer-img">
                            <span class="dealer-listing">25 Listing</span>
                            <img src="assets/img/dealer/01.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Automotive Gear</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="dealer-img">
                            <span class="dealer-listing">35 Listing</span>
                            <img src="assets/img/dealer/02.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Keithson Car</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="dealer-img">
                            <span class="dealer-listing">15 Listing</span>
                            <img src="assets/img/dealer/03.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Superious Automotive</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay="1s">
                        <div class="dealer-img">
                            <span class="dealer-listing">20 Listing</span>
                            <img src="assets/img/dealer/04.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Racing Gear Car</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".25s">
                        <div class="dealer-img">
                            <span class="dealer-listing">19 Listing</span>
                            <img src="assets/img/dealer/05.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Car Showromio</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".50s">
                        <div class="dealer-img">
                            <span class="dealer-listing">40 Listing</span>
                            <img src="assets/img/dealer/06.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Fastspeedio Car</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay=".75s">
                        <div class="dealer-img">
                            <span class="dealer-listing">59 Listing</span>
                            <img src="assets/img/dealer/07.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Star AutoMall</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="dealer-item wow fadeInUp" data-wow-delay="1s">
                        <div class="dealer-img">
                            <span class="dealer-listing">28 Listing</span>
                            <img src="assets/img/dealer/08.png" alt="">
                        </div>
                        <div class="dealer-content">
                            <h4><a href="#">Superspeed Auto</a></h4>
                            <ul>
                                <li><i class="far fa-location-dot"></i> 25/B Milford Road, New York</li>
                                <li><i class="far fa-phone"></i> <a href="tel:+21236547898">+2 123 654 7898</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
    <!-- car dealer end-->


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
                                At <strong>Motex</strong>, we are committed to delivering exceptional service with integrity. Our mission is to provide top-notch automotive solutions, ensuring your journey with us is reliable and worry-free.
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
                            <p>At <strong>Motex</strong>, we make car ownership easy and affordable. Explore a curated selection of quality vehicles that fit your lifestyle. Your dream car is just a click away!</p>
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
                                <h2 class="site-title mb-10">Download <span>Our Motex</span> App For Free</h2>
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