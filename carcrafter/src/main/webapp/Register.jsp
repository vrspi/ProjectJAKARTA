<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>-->


<mt:Template title="- Register">
  <!-- existing content -->

  <style>
    .row { display: flex; }
    .column { flex: 50%; }
    .form-group { margin-bottom: 15px; }
  </style>

  <div class="login-area py-120">
    <div class="container">
      <div class="col-md-9 mx-auto">
        <div class="login-form">
          <div class="login-header">
            <img src="assets/img/logo/logo.png" alt="">
            <p>Create your motex account</p>
          </div>
          <form action="UserController" method="post">

<%--            <%--%>
<%--              String errorMessage = (String) request.getAttribute("errorMessage");--%>
<%--              if (errorMessage != null && !errorMessage.isEmpty()) {--%>
<%--            %>--%>
<%--            <div class="alert alert-danger" role="alert">--%>
<%--              <%= errorMessage %>--%>
<%--            </div>--%>
<%--            <% } %>--%>

            <div class="row">
              <div class="column">
                <!-- Left column inputs -->
                <div class="form-group">
                  <label>First Name</label>
                  <input type="text" class="form-control" placeholder="First Name" name="firstName" required>
                </div>
                <div class="form-group">
                  <label>Last Name</label>
                  <input type="text" class="form-control" placeholder="Last Name" name="lastName" required>
                </div>
                <div class="form-group">
                  <label>Email Address</label>
                  <input type="email" class="form-control" placeholder="Your Email" name="email" required
                         pattern="^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$"
                         title="Email should be in the format: username@domain.com. Username can contain alphanumeric characters, underscores, pluses, and hyphens. Domain must include alphanumeric characters and a top-level domain between 2 to 7 letters long.">
                </div>
                <div class="form-group">
                  <label>Phone Number</label>
                  <input type="text" class="form-control" placeholder="Phone Number" name="phone" required>
                </div>
              </div>
              <div class="column">
                <!-- Right column inputs -->
                <div class="form-group">
                  <label>Address</label>
                  <input type="text" class="form-control" placeholder="Address" name="address" required>
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input type="password" class="form-control" placeholder="Your Password" name="password" required>
                </div>
                <div class="form-group">
                  <label>Confirm Password</label>
                  <input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword" required>
                </div>
              </div>
            </div>

            <div class="form-check form-group">
              <input class="form-check-input" type="checkbox" value="" id="agree">
              <label class="form-check-label" for="agree">
                I agree with the <a href="terms">Terms Of Service.</a>
              </label>
            </div>
            <div class="d-flex align-items-center">
              <button type="submit" name="action" value="Register" class="theme-btn"><i class="far fa-paper-plane"></i> Register</button>
            </div>
          </form>
          <div class="login-footer">
            <p>Already have an account? <a href="Login">Login.</a></p>
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
  <!-- rest of the content -->
</mt:Template>
