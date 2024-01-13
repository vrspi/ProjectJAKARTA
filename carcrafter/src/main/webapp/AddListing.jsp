<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- Account" />
</jsp:include>


<%
    String imagePath = "assets/img/account/user.jpg";

    String sessionImagePath = (String) session.getAttribute("Image");
    String FullName = (String) session.getAttribute("FullName");
    String Email = (String) session.getAttribute("Email");
    if (sessionImagePath != null && !sessionImagePath.isEmpty() ) {
        imagePath = "assets/upload/img/user/" + sessionImagePath;
    }
%>


<!-- user-profile -->
<div class="user-profile py-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="user-profile-sidebar">
                    <div class="user-profile-sidebar-top">
                        <form id="uploadForm" action="UserController" method="post" enctype="multipart/form-data">
                            <div class="user-profile-img">
                                <img id="previewImage" src="<%= imagePath %>" alt="User Image">
                                <button type="button" id="chooseImageButton" class="profile-img-btn">
                                    <i class="far fa-camera"></i>
                                </button>
                                <input type="file" id="fileInput" accept="image/*" class="profile-img-file" name="file" onchange="previewAndSubmit()">
                            </div>
                        </form>
                        <% if(!Email.isEmpty() && !FullName.isEmpty()) {%>
                        <h5><%= FullName %></h5>
                        <p><%= Email %></p>
                        <% }else { %>
                        <h5>test test</h5>
                        <p>test@example.com</p>
                        <%} %>
                    </div>
                    <ul class="user-profile-sidebar-list">
                        <li><a href="#"  onclick="loadPartial(event, 'partials/Dashboard.jsp')"><i class="far fa-gauge-high"></i> Dashboard</a></li>
                        <li><a href="#"  onclick="loadPartial(event, 'partials/profile.jsp')"><i class="far fa-user"></i> My Profile</a></li>
                        <li><a href="#"  onclick="loadPartial(event, 'partials/Listing.jsp')"><i class="far fa-layer-group"></i> My Listing</a>
                        </li>
                        <li><a class="active" href="#"  onclick="loadPartial(event, '/addlisting')"><i class="far fa-plus-circle"></i> Add
                            Listing</a></li>
                        <li><a href="#"  onclick="loadPartial(event, 'partials/Favorites.jsp')"><i class="far fa-heart"></i> My Favorites</a></li>
                        <li><a href="#"  onclick="loadPartial(event, 'partials/Messages.jsp')"><i class="far fa-envelope"></i> Messages <span class="badge badge-danger">02</span></a></li>
                        <li><a href="#"  onclick="loadPartial(event, 'partials/Settings.jsp')"><i class="far fa-gear"></i> Settings</a></li>
                        <li><a href="logout"><i class="far fa-sign-out"></i> Log Out</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div id="partialContainer">
                    <jsp:include page="partials/addlisting.jsp" />
                </div>
            </div>
        </div>
    </div>
</div>
<!-- user-profile end -->

<jsp:include page="template/bottom.jsp" />