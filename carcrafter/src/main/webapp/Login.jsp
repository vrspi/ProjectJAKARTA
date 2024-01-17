<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
  <!-- meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- title -->
  <title>Car Crafter - Login</title>

  <!-- favicon -->
  <link rel="icon" type="image/x-icon" href="assets/img/logo/favicon.svg">

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
          <a href="Home"><i class="fas fa-home"></i> Home</a>
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
<!-- login area -->
<div class="login-area py-120">
  <div class="container">
    <div class="col-md-5 mx-auto">
      <div class="login-form">
        <div class="login-header">
          <img src="assets/img/logo/logo.svg" alt="">
          <p>Login with your Car Crafter account</p>
        </div>
        <form action="UserController" method="post">
          <%
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
          %>
          <div class="alert alert-danger" id="success-alert" role="alert">
            <%= errorMessage %>
          </div>
          <% } %>

          <%
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null && !successMessage.isEmpty()) {
          %>
          <div class="alert alert-success" id="error-alert" role="alert">
            <%= successMessage %>
          </div>
          <% }
          session.removeAttribute("successMessage");
          session.removeAttribute("errorMessage");

          %>
          <div class="form-group">
            <label>Email Address</label>
            <input type="email" class="form-control" name="email" placeholder="Your Email"required
                   pattern="^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$"
                   title="Email should be in the format: username@domain.com. Username can contain alphanumeric characters, underscores, pluses, and hyphens. Domain must include alphanumeric characters and a top-level domain between 2 to 7 letters long.">
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" name="password" placeholder="Your Password"required>
          </div>
          <div class="d-flex justify-content-between mb-4">
<%--            <div class="form-check">--%>
<%--              <input class="form-check-input" type="checkbox" value="" name="remember" id="remember">--%>
<%--              <label class="form-check-label" for="remember">--%>
<%--                Remember Me--%>
<%--              </label>--%>
<%--            </div>--%>
            <a href="ForgotPassword" class="forgot-pass">Forgot Password?</a>
          </div>
          <div class="d-flex align-items-center">
            <button type="submit" name="action" value="Login" class="theme-btn"><i class="far fa-sign-in"></i> Login</button>
          </div>
        </form>
        <div class="login-footer">
          <p>Don't have an account? <a href="Register">Register.</a></p>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- js -->
<script>
  window.setTimeout(function () {
    $("#error-alert").fadeTo(500, 0).slideUp(500, function () {
      $(this).remove();
    });
  }, 5000);

  window.setTimeout(function () {
    $("#success-alert").fadeTo(500, 0).slideUp(500, function () {
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



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <!-- Head content -->
</head>
<body class="home-3">
<!-- Body content -->

<script type="text/javascript">
  // This script attempts to prevent users from going back to the previous page after logging out
  function noBack() {
    window.history.forward();
  }

  // Ensure the function is called when the page is loaded and when the page is shown after navigation
  window.onload = noBack;
  window.onpageshow = function(event) {
    if (event.persisted) {
      noBack();
    }
  };
  window.onunload = function() {}; // Needed for certain browsers
</script>
</body>
</html>

</body>
<!-- login area end -->
<%--<jsp:include page="template/bottom.jsp" />--%>