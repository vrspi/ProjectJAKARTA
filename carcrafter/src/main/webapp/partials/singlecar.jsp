<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/template/top.jsp">
    <jsp:param name="title" value="- Listing Single" />
</jsp:include>

<div class="container">
    <div class="car-single-wrapper">
        <div class="row">
            <div class="col-lg-8">
                <div class="car-single-details">
                    <div class="car-single-widget">
                        <div class="car-single-top">
                            <span class="car-status status-1">Brand New</span>
                            <%
                                List<Listing> lwata7 = (List<Listing>) request.getAttribute("CarsList");
                                if (lwata7 != null) {
                            %>
                            <h3 class="car-single-title"><%= lwata7.get(1).getTitle() %></h3>
                            <% } %>
                            <ul class="car-single-meta">
                                <li><i class="far fa-clock"></i> Listed On: Sat, Jan 25, 2023</li>
                                <li><i class="far fa-eye"></i> Views: 850</li>
                            </ul>
                        </div>
                        <div class="car-single-slider">
                            <div class="item-gallery">
                                <div class="flexslider-thumbnails">

                                    <div class="flex-viewport"
                                         style="overflow: hidden; position: relative;">
<%--                                        <ul class="slides"--%>
<%--                                            style="width: 1200%; transition-duration: 0.6s; transform: translate3d(-1472px, 0px, 0px);">--%>
<%--                                            <%--%>
<%--                                                List<Listing> lwata4 = (List <Listing>)request.getAttribute("CarsList");--%>
<%--                                                if (lwata4 != null) {--%>
<%--                                                    for (Listing loto4 : lwata4) {--%>
<%--                                                        for (int i = 0; i < loto4.getImages().size(); i++) {--%>
<%--                                                            if (loto4.getImages() != null && loto4.getImages().size() > 0 && loto4.getImages().get(i).getImagePath() != null) {--%>
<%--                                            %>--%>
<%--                                            <li class="clone" data-thumb="/assets/img/car/<%= loto4.getImages().get(i).getImagePath() %>" alt="ImageCar">--%>
<%--                                                <img src="assets/img/car/<%= loto4.getImages().get(i).getImagePath() %>" alt="#">--%>
<%--                                            </li>--%>
<%--&lt;%&ndash;                                            <li style="background:url('/assets/img/car/01.jpg')" alt="ImageCar"></li>&ndash;%&gt;--%>
<%--                                            <% } else { %>--%>
<%--                                            <li data-thumb="" alt="ImageCar"></li>--%>
<%--                                            <%  }--%>
<%--                                                if (loto4.getImages() != null && loto4.getImages().size() > 0 && loto4.getImages().get(i).getImagePath() != null) {--%>
<%--                                            %>--%>
<%--                                            <li data-thumb="assets/img/car/<%= loto4.getImages().get(i).getImagePath() %>" class="clone"--%>
<%--                                                style="width: 736px; float: left; display: block;">--%>
<%--                                                <img src="assets/img/car/<%= loto4.getImages().get(i).getImagePath() %>" alt="ImageCar">--%>
<%--                                            </li>--%>
<%--                                            <% }}}} %>--%>
<%--                                        </ul>--%>
                                            <ul class="slides" style="width: 1200%; transition-duration: 0.6s; transform: translate3d(-1472px, 0px, 0px);">--%>
<%--                                                <%--%>
<%--                                                    String path = "assets/img/car/";--%>
<%--                                                    List<Listing> lwata4 = (List <Listing>)request.getAttribute("CarsList");--%>
<%--                                                    if (lwata4 != null) {--%>
<%--                                                        for (Listing loto4 : lwata4) {--%>
<%--                                                            String imagePath = loto4.getImages().toString();--%>
<%--                                                            String pp = String.valueOf(' ');--%>
<%--                                                %>--%>
<%--                                                <li data-thumb="<%= imagePath != null ? path + imagePath : pp %>" alt="ImageCar">--%>
<%--                                                    <img src="<%= imagePath == null ? pp : path + imagePath %>" alt="#">--%>
<%--                                                </li>--%>
<%--                                                <% }} %>--%>
                                            </ul>
                                    </div>
                                    <ol class="flex-control-nav flex-control-thumbs">
                                        <li><img src="assets/img/car/single-1.jpg" class=""></li>
                                        <li><img src="assets/img/car/single-2.jpg" class="flex-active">
                                        </li>
                                        <li><img src="assets/img/car/single-3.jpg" class=""></li>
                                        <li><img src="assets/img/car/single-4.jpg" class=""></li>
                                    </ol>
                                    <ul class="flex-direction-nav">
                                        <li><a class="flex-prev" href="#"></a></li>
                                        <li><a class="flex-next" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="car-single-widget">
                        <h4 class="mb-4">Key Information</h4>
                        <div class="car-key-info">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Body Type</span>
                                            <%
                                                List<Listing> lwata5 = (List<Listing>) request.getAttribute("CarsList");
                                                if (lwata5 != null) {
                                                    BodyType bodyType = lwata5.get(1).getBodyType();
                                                    String bodyTypeName = (bodyType != null) ? bodyType.getBodyType() : "";
                                            %>
                                            <h6><%= bodyTypeName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Condition</span>
                                            <%
                                                if (lwata5 != null) {
                                            %>
                                            <h6><%=lwata5.get(1).getCondition().getConditionTType()%></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-speedometer"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Mileage</span>
                                            <%
                                                if (lwata5 != null) {
                                            %>
                                            <h6><%=lwata5.get(1).getMileage()%> Km</h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-settings"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Transmission</span>
                                            <%
                                                if (lwata5 != null) {
                                                    Transmission transmission = lwata5.get(1).getTransmission();
                                                    String transmissionName = (transmission != null) ? transmission.getTransmissionType() : "";
                                            %>
                                            <h6><%= transmissionName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Year</span>
                                            <%
                                                if (lwata5 != null) {
                                                    Year year = lwata5.get(1).getYear();
                                                    String yearName = (year != null) ? year.getYear() : "";
                                            %>
                                            <h6><%= yearName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-gas-station"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Fuel Type</span>
                                            <%
                                                if (lwata5 != null) {
                                                    FuelType fueltype = lwata5.get(1).getFuelType();
                                                    String fueltypeName = (fueltype != null) ? fueltype.getFuelType() : "";
                                            %>
                                            <h6><%= fueltypeName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Color</span>
                                            <%
                                                if (lwata5 != null) {
                                                    Color colors = lwata5.get(1).getColor();
                                                    String colorName = (colors != null) ? colors.getColorName() : "";
                                            %>
                                            <h6><%= colorName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Doors</span>
                                            <%
                                                if (lwata5 != null) {
                                                    Doors doors = lwata5.get(1).getDoors();
                                                    int doorsName = (doors != null) ? doors.getNumberOfDoors() : 0;
                                            %>
                                            <h6><%= doorsName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Cylinders</span>
                                            <%
                                                if (lwata5 != null) {
                                                    Cylinders cylinders = lwata5.get(1).getCylinders();
                                                    int cylindersName = (cylinders != null) ? cylinders.getNumberOfCylinders() : 0;
                                            %>
                                            <h6><%= cylindersName %></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>Engine Size</span>
                                            <%
                                                if (lwata5 != null) {
                                            %>
                                            <h6><%=lwata5.get(1).getEngineSize()%> (cc)</h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6">
                                    <div class="car-key-item">
                                        <div class="car-key-icon">
                                            <i class="flaticon-drive"></i>
                                        </div>
                                        <div class="car-key-content">
                                            <span>VIN</span>
                                            <%
                                                if (lwata5 != null) {
                                            %>
                                            <h6><%=lwata5.get(1).getVin()%></h6>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="car-single-widget">
                        <div class="car-single-overview">
                            <h4 class="mb-3">Description</h4>
                            <div class="mb-4">
                                <%
                                    List<Listing> lwata2 = (List <Listing>)request.getAttribute("CarsList");
                                    if (lwata2 != null) {
                                %>
                                <p><%=lwata2.get(1).getDescription()%></p>
                                <%}%>
                            </div>
                            <h4 class="mb-3">Car Features</h4>
                            <div class="row mb-3">
                                <div class="col-lg-4">
                                    <ul class="car-single-list">
                                        <%
                                            List<Features> FeaturesList = (List<Features>) request.getAttribute("FeaturesList");
                                            for(Features features : FeaturesList) {
                                        %>
                                        <li><i class="far fa-check-circle"></i>
                                            <%=features.getFeatureName()%>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                            <h4 class="mb-4">Location</h4>
                            <div class="car-single-map">
                                <div class="contact-map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6563.790599875592!2d-1.907568!3d34.657347!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd787ca7abf0facf%3A0x5ea075eea8038ba1!2sEhei%20%3A%20School%20Des%20Hautes%20Studies%20D&#39;ing%C3%A9nierie%20Oujda!5e0!3m2!1sen!2sus!4v1705080596150!5m2!1sen!2sus" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="car-single-widget">
                    <h4 class="car-single-price">$50,560</h4>
                    <ul class="car-single-meta">
                        <li><i class="fa-regular fa-gauge-high"></i> 50k Km</li>
                        <li><i class="far fa-location-dot"></i> 25/B Milford, New York</li>
                    </ul>
                </div>
                <div class="car-single-widget">
                    <div class="car-single-author">
                        <img src="assets/img/car/author.jpg" alt="">
                        <div class="car-single-author-content">
                            <h5>Marid Anderson</h5>
                            <span>Customer Advisor</span>
                            <div class="car-single-author-social">
                                <a href="#"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="car-single-widget">
                    <h5 class="mb-3">Contact Details</h5>
                    <div class="car-single-form">
                        <form action="#">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Name">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Email">
                            </div>
                            <div class="form-group">
                                                <textarea class="form-control" rows="3"
                                                          placeholder="Write Message"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="theme-btn">Send Now<i
                                        class="fas fa-arrow-right-long"></i></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="car-single-related mt-5">
            <h3 class="mb-30">Related Listing</h3>
            <div class="row">
                <%
                    List<Listing> lwata = (List <Listing>)request.getAttribute("CarsList");
                    if (lwata != null) {
                        for (Listing loto : lwata) {
                %>
                <div class="col-md-6 col-lg-4 col-xl-3">
                    <div class="car-item">
                        <div class="car-img">
                            <span class="car-status status-1"><%=loto.getCondition().getConditionTType()%></span>
                            <%
                                if (loto.getImages() != null && loto.getImages().size() > 0 && loto.getImages().get(0).getImagePath() != null) {
                            %>
                            <img src="assets/upload/img/car/<%= loto.getImages().get(0).getImagePath() %>" alt="ImageCar">
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
                                <h4><a href="#"><%=loto.getTitle()%></a></h4>
                            </div>
                            <ul class="car-list">
                                <li><i class="far fa-steering-wheel"></i><%=loto.getTransmission().getTransmissionType()%></li>
                                <li><i class="far fa-road"></i><%=loto.getMileage()%>Km</li>
                                <li><i class="far fa-car"></i>Model: <%=loto.getYear()%></li>
                                <li><i class="far fa-gas-pump"></i><%=loto.getFuelType().getFuelType()%></li>
                            </ul>
                            <div class="car-footer">
                                <span class="car-price"><%=loto.getPrice()%> DH</span>
                                <a href="#" class="theme-btn"><span
                                        class="far fa-eye"></span>Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/template/bottom.jsp" />