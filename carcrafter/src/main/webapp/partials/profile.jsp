
    <div class="user-profile-wrapper">
        <div class="row">
            <div class="col-lg-7">
                <div class="user-profile-card">
                    <h4 class="user-profile-card-title">Profile Info</h4>
                    <div class="user-profile-form">
                        <%
                            String errorMessage = (String) session.getAttribute("errorMessage");
                            String successMessage = (String) session.getAttribute("successMessage");%>

                        <% if (errorMessage != null && !errorMessage.isEmpty()) {
                        %>
                        <div class="alert alert-danger" id="success-alert" role="alert">
                            <%= errorMessage %>
                        </div>
                        <% } %>

                        <%
                            if (successMessage != null && !successMessage.isEmpty()) {
                        %>
                        <div class="alert alert-success" id="error-alert" role="alert">
                            <%= successMessage %>
                        </div>
                        <% }
                            session.removeAttribute("successMessage");
                            session.removeAttribute("errorMessage");%>
                        <form action="UserController" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" name="firstName"
                                               placeholder="<%= session.getAttribute("FirstName") != null ? session.getAttribute("FirstName") : "" %>"
                                              >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" name="lastName"
                                               placeholder=<%= session.getAttribute("LastName") != null ? session.getAttribute("LastName") : "" %>
                                               >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email"
                                               placeholder="<%= session.getAttribute("Email") != null ? session.getAttribute("Email") : "" %>"
                                              >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone"
                                               placeholder="<%= session.getAttribute("Phone") != null ? session.getAttribute("Phone") : "" %>"
                                               >
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" class="form-control" name="address"
                                               placeholder="<%= session.getAttribute("Address") != null ? session.getAttribute("Address") : "" %>"
                                               >
                                    </div>
                                </div>
                            </div>
                            <button type="submit" name="action" value="updateProfile" class="theme-btn my-3">
                                <span class="far fa-user"></span> Save Changes
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="user-profile-card">
                    <h4 class="user-profile-card-title">Change Password</h4>
                    <%
                        String errorMessageD = (String) session.getAttribute("errorMessageD");
                        String successMessageD = (String) session.getAttribute("successMessageD");%>
                    <% if (errorMessageD != null && !errorMessageD.isEmpty()) {
                    %>
                    <div class="alert alert-danger" id="success-alert" role="alert">
                        <%= errorMessageD %>
                    </div>
                    <% } %>

                    <%
                        if (successMessageD != null && !successMessageD.isEmpty()) {
                    %>
                    <div class="alert alert-success" id="error-alert" role="alert">
                        <%= successMessageD %>
                    </div>
                    <% }
                        session.removeAttribute("successMessageD");
                        session.removeAttribute("errorMessageD");%>
                    <div class="col-lg-12">
                        <div class="user-profile-form">

                            <form action="UserController" method="post">
                                <div class="form-group">
                                    <label>Old Password</label>
                                    <input name="oldPassword"type="password" class="form-control"
                                        placeholder="oldPassword">
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input  name="newPassword" type="password" class="form-control"
                                        placeholder="newPassword">
                                </div>
                                <div class="form-group">
                                    <label>Re-Type Password</label>
                                    <input name="confirmPassword" type="password" class="form-control"
                                        placeholder="Re-Type Password">
                                </div>
                                <button type="submit"  name="action" value="changePasswordInDashboard" class="theme-btn my-3"><span class="far fa-key"></span> Change Password</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

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
