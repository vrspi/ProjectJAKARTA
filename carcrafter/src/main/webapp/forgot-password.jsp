<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <!-- meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- title -->
    <title>Motex - Forgot Password</title>

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
                    <a href="Login"><i class="far fa-arrow-right-to-arc"></i> Login</a>
                    <a href="Register"><i class="far fa-user-vneck"></i> Register</a>
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
<!-- end top header -->
<!-- forgot password -->
<div class="login-area py-120">
    <div class="container">
        <div class="col-md-5 mx-auto">
            <div class="login-form">
                <div class="login-header">
                    <img src="assets/img/logo/logo.png" alt="">
                    <p>Reset your motex account password</p>
                </div>
                <form action="UserController" method="post">
                    <%
                        String errorMessage = (String) session.getAttribute("errorMessage");
                        if (errorMessage != null && !errorMessage.isEmpty()) {
                    %>
                    <div class="alert alert-danger" id="error-alert" role="alert">
                        <%= errorMessage %>
                    </div>
                    <% }
                        session.removeAttribute("errorMessage");%>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" placeholder="Your Email" name="email">
                    </div>
                    <div class="d-flex align-items-center">
                        <button type="submit" class="theme-btn" name="action" value="verifyEmail"><i class="fas fa-check"></i> Verify Email</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- forgot password end -->
<!-- js -->
<script>
    window.setTimeout(function () {
        $("#error-alert").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 5000);
</script>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/imagesloaded.pkgd.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/isotope.pkgd.min.js"></script>
<script src="assets/js/jquery.appear.min.js"></script>
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/counter-up.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
<!-- login area end -->
<%--<jsp:include page="template/bottom.jsp" />--%>