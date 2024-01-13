
    <div class="user-profile-wrapper">
        <div class="row">
            <div class="col-lg-7">
                <div class="user-profile-card">
                    <h4 class="user-profile-card-title">Profile Info</h4>
                    <div class="user-profile-form">
                        <%
                            String errorMessage = (String) request.getAttribute("errorMessage");
                            if (errorMessage != null && !errorMessage.isEmpty()) {
                        %>
                        <div class="alert alert-danger" id="success-alert" role="alert">
                            <%= errorMessage %>
                        </div>
                        <% } %>

                        <%
                            String successMessage = (String) request.getAttribute("successMessage");
                            if (successMessage != null && !successMessage.isEmpty()) {
                        %>
                        <div class="alert alert-success" id="error-alert" role="alert">
                            <%= successMessage %>
                        </div>
                        <% } %>
                        <form action="UserController" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" name="firstName"
                                               value="<%= session.getAttribute("FirstName") != null ? session.getAttribute("FirstName") : "" %>"
                                               placeholder="First Name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" name="lastName"
                                               value="<%= session.getAttribute("LastName") != null ? session.getAttribute("LastName") : "" %>"
                                               placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name="email"
                                               value="<%= session.getAttribute("Email") != null ? session.getAttribute("Email") : "" %>"
                                               placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone"
                                               value="<%= session.getAttribute("Phone") != null ? session.getAttribute("Phone") : "" %>"
                                               placeholder="Phone">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" class="form-control" name="address"
                                               value="<%= session.getAttribute("Adress") != null ? session.getAttribute("Adress") : "" %>"
                                               placeholder="Address">
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
                    <div class="col-lg-12">
                        <div class="user-profile-form">
                            <form action="#">
                                <div class="form-group">
                                    <label>Old Password</label>
                                    <input type="password" class="form-control"
                                        placeholder="Old Password">
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input type="password" class="form-control"
                                        placeholder="New Password">
                                </div>
                                <div class="form-group">
                                    <label>Re-Type Password</label>
                                    <input type="password" class="form-control"
                                        placeholder="Re-Type Password">
                                </div>
                                <button type="button" class="theme-btn my-3"><span class="far fa-key"></span> Change Password</button>
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
