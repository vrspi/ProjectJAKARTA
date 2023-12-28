<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>-->

<mt:Template title="- LOGIN">
  <!-- breadcrumb -->
  <!-- breadcrumb -->

  <!-- breadcrumb end -->


  <!-- login area -->
  <div class="login-area py-120">
    <div class="container">
      <div class="col-md-5 mx-auto">
        <div class="login-form">
          <div class="login-header">
            <img src="assets/img/logo/logo.png" alt="">
            <p>Login with your motex account</p>
          </div>
          <form action="UserController" method="post">
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
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="remember">
                <label class="form-check-label" for="remember">
                  Remember Me
                </label>
              </div>
              <a href="forgot-password.html" class="forgot-pass">Forgot Password?</a>
            </div>
            <div class="d-flex align-items-center">
              <button type="submit" name="action" value="Login" class="theme-btn"><i class="far fa-sign-in"></i> Login</button>
            </div>
          </form>
          <div class="login-footer">
            <p>Don't have an account? <a href="Register">Register.</a></p>
            <div class="social-login">
              <p>Continue with social media</p>
              <div class="social-login-list">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-google"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- login area end -->
  <!-- team-area end -->
</mt:Template>