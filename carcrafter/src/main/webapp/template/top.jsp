<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- title -->
    <title>Motex <%= request.getParameter("title") %></title>

    <!-- favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/logo/favicon.png">

    <!-- css -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/all-fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .logout-button {
            background-color: #0000;
        }

        .logout-button:hover {
            color: red;
        }
    </style>

    <!-- check this script if it works -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var path = window.location.pathname.replace(/^\/carcrafter\//, '');
            document.querySelectorAll(".navbar-nav .nav-link, .navbar-nav .dropdown-item").forEach(function (element) {
                var elementPath = element.getAttribute("href").replace(/^\/carcrafter\//, '');
                element.classList.toggle("active", elementPath === path);
            });
        });
    </script>



</head>

<body class="home-3">

<!-- preloader -->
<div class="preloader">
    <div class="loader-ripple">
        <div></div>
        <div></div>
    </div>
</div>
<!-- preloader end -->


<!-- header area -->
<header class="header">
    <!-- top header -->
    <div class="header-top">
        <div class="container">
            <div class="header-top-wrapper">
                <div class="header-top-left">
                    <div class="header-top-contact">
                        <ul>
                            <li><a href="mailto:<%@ include file="/info/email.jsp" %>"><i class="far fa-envelopes dark-icon"></i><%@ include file="/info/email.jsp" %></a></li>
                            <li><a href="tel:<%@ include file="/info/phone.jsp" %>"><i class="far fa-phone-volume"></i><%@ include file="/info/phone.jsp" %></a>
                            </li>
                            <li><a href="#"><i class="far fa-alarm-clock"></i><%@ include file="/info/open time.jsp" %></a></li>
                        </ul>
                    </div>
                </div>
                <div class="header-top-right">
                    <div class="header-top-link">
                        <% if (session != null && session.getAttribute("Email") != null) { %>
                        <form action="UserController" method="post">
                            <input type="hidden" name="action" value="Logout">
                            <button type="submit" class="theme-btn logout-button">
                                <i class="far fa-sign-out-alt"></i> Logout
                            </button>
                        </form>
                        <% } else { %>
                        <a href="Login"><i class="far fa-arrow-right-to-arc"></i> Login</a>
                        <a href="Register"><i class="far fa-user-vneck"></i> Register</a>
                        <% } %>

                    </div>
                    <div class="header-top-social">
                        <span>Follow Us: </span>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-x-twitter"></i></a>
                        <a href="#" class="dark-hover"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="dark-hover"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-navigation">
        <nav class="navbar navbar-expand-lg">
            <div class="container position-relative">
                <a class="navbar-brand" href="/carcrafter/">
                    <img src="assets/img/logo/logo.png" alt="logo">
                </a>
                <div class="mobile-menu-right">
                    <div class="search-btn">
                        <button type="button" class="nav-right-link"><i class="far fa-search"></i></button>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-mobile-icon"><i class="far fa-bars"></i></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="main_nav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="/carcrafter/">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">About</a>
                            <ul class="dropdown-menu fade-down">
                                <li><a class="dropdown-item" href="about">About Us</a></li>
                                <li><a class="dropdown-item" href="contact">Contact Us</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="shop">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="blog">Blog</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Others</a>
                            <ul class="dropdown-menu fade-down">
                                <li><a class="dropdown-item" href="testimonials">Testimonials</a></li>
                                <li><a class="dropdown-item" href="team">Our Team</a></li>
                                <li><a class="dropdown-item" href="terms">Terms Of Service</a></li>
                                <li><a class="dropdown-item" href="privacy">Privacy Policy</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="faq">FAQ</a></li>
                        <% if (session != null && "admin".equals(session.getAttribute("role"))) { %>
                        <li class="nav-item"><a class="nav-link" href="#">Listing</a></li>
                        <% } %>
                    </ul>
                    <div class="nav-right">
                        <div class="search-btn">
                            <button type="button" class="nav-right-link"><i class="far fa-search"></i></button>
                        </div>
                        <div class="cart-btn">
                            <a href="cart" class="nav-right-link"><i class="far fa-cart-plus"></i><span>0</span></a>
                        </div>
                        <% if (session != null && "admin".equals(session.getAttribute("role"))) { %>
                        <div class="nav-right-btn mt-2">
                            <a href="AddListing" class="theme-btn"><span class="far fa-plus-circle"></span>Add Listing</a>
                        </div>
                        <% } %>
                        <div class="sidebar-btn">
                            <button type="button" class="nav-right-link"><i class="far fa-bars-sort"></i></button>
                        </div>
                    </div>
                </div>
                <!-- search area -->
                <div class="search-area">
                    <form action="#">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Type Keyword...">
                            <button type="submit" class="search-icon-btn"><i class="far fa-search"></i></button>
                        </div>
                    </form>
                </div>
                <!-- search area end -->
            </div>
        </nav>
    </div>
</header>
<!-- header area end -->


<!-- sidebar-popup -->
<div class="sidebar-popup">
    <div class="sidebar-wrapper">
        <div class="sidebar-content">
            <button type="button" class="close-sidebar-popup"><i class="far fa-xmark"></i></button>
            <div class="sidebar-logo">
                <img src="assets/img/logo/logo.png" alt="">
            </div>
            <div class="sidebar-about">
                <h4>About Us</h4>
                <p>We're a dedicated team in Oujda, Morocco, redefining convenience and transparency in the online marketplace. Welcome to a new era in car shopping with us.</p>
            </div>
            <div class="sidebar-contact">
                <h4>Contact Info</h4>
                <ul>
                    <li>
                        <h6>Email</h6>
                        <a href="mailto:<%@ include file="/info/email.jsp" %>"><i class="far fa-envelope"></i><%@ include file="/info/email.jsp" %></a>
                    </li>
                    <li>
                        <h6>Phone</h6>
                        <a href="tel:<%@ include file="/info/phone.jsp" %>"><i class="far fa-phone"></i><%@ include file="/info/phone.jsp" %></a>
                    </li>
                    <li>
                        <h6>Address</h6>
                        <a href="#"><i class="far fa-location-dot"></i><%@ include file="/info/address.jsp" %></a>
                    </li>
                </ul>
            </div>
            <div class="sidebar-social">
                <h4>Follow Us</h4>
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-x-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
    </div>
</div>