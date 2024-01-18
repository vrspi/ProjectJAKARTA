<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/template/top.jsp">
    <jsp:param name="title" value="- Listing Single" />
</jsp:include>
 <!-- breadcrumb -->
 <!-- <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
    <div class="container">
        <h2 class="breadcrumb-title">Listing Single</h2>
        <ul class="breadcrumb-menu">
            <li><a href="index.html">Home</a></li>
            <li class="active">Listing Single</li>
        </ul>
    </div>
</div> -->
<!-- breadcrumb end -->


<!-- car single -->
<div class="car-item-single bg py-120">
    <div class="container">
        <div class="car-single-wrapper">
            <div class="row">
                <div class="col-lg-8">
                    <div class="car-single-details">
                        <div class="car-single-widget">
                            <div class="car-single-top">
                                <span class="car-status status-1">Brand New</span>
                                <% Listing car = (Listing) request.getAttribute("Car");%>
                                <h3 class="car-single-title"><%= car.getTitle()%></h3>
                                <ul class="car-single-meta">
                                    <li><i class="far fa-clock"></i> Listed On: Sat, Jan 25, 2023</li>
                                    <li><i class="far fa-eye"></i> Views: 850</li>
                                </ul>
                            </div>
                            <div class="car-single-slider">
                                <div class="item-gallery">
                                    <div class="flexslider-thumbnails">
                                        <ul class="slides">
                                          

                                                <%
                                                List<Image> ImageList = (List<Image>) car.getImages();


                                                    StringBuffer urlBuffer = request.getRequestURL();

                                                    // Get the query string (e.g., "id=32")
                                                    String queryString = request.getQueryString();

                                                    if (queryString != null) {
                                                        urlBuffer.append("?").append(queryString);
                                                        String fullUrl = urlBuffer.toString();
                                                        // String referer = request.getHeader("referer");
                                                        session.setAttribute("URLCARLISTING", fullUrl);
                                                    }
            
                                                for(Image image : ImageList) {
                                                    
                                                        %>
                                                        <li data-thumb="assets/upload/img/car/<%=image.getImagePath()%>">
                                                            <img src="assets/upload/img/car/<%=image.getImagePath()%>" alt="#">
                                                        </li>
                                                        <%
                                                   
                                                }
            
                                               
                                                 %>
            
                                           
                                            <!-- <li data-thumb="assets/img/car/single-2.jpg">
                                                <img src="assets/img/car/single-2.jpg" alt="#">
                                            </li>
                                            <li data-thumb="assets/img/car/single-3.jpg">
                                                <img src="assets/img/car/single-3.jpg" alt="#">
                                            </li>
                                            <li data-thumb="assets/img/car/single-4.jpg">
                                                <img src="assets/img/car/single-4.jpg" alt="#">
                                            </li> -->
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
                                                <h6><%= car.getBodyType().getBodyType()%></h6>
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
                                                <h6><%= car.getCondition().getConditionTType()%></h6>
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
                                                <h6><%= car.getMileage() %> (Mi)</h6>
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
                                                <h6><%= car.getTransmission().getTransmissionType()%></h6>
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
                                                <h6><%= car.getYear().getYear()%></h6>
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
                                                <h6><%= car.getFuelType().getFuelType()%></h6>
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
                                                <h6><%= car.getColor().getColorName()%></h6>
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
                                                <h6><%= car.getDoors().getNumberOfDoors()%> Doors</h6>
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
                                                <h6><%= car.getCylinders().getNumberOfCylinders()%></h6>
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
                                                <h6><%= car.getEngineSize()%> (cc)</h6>
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
                                                <h6><%= car.getVin()%></h6>
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
                                    <p><%= car.getDescription()%></p>
                                    <!-- <p class="mt-2">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters as opposed to using Content here content here making it look like readable English.</p> -->
                                </div>
                                <h4 class="mb-3">Car Features</h4>



                                <div class="row mb-3">
                                    <%
                                    List<ListingFeature> featureList = (List<ListingFeature>) car.getListingFeatures();
                                    int counter = 0;

                                    for(ListingFeature features : featureList) {
                                        if (counter % 4 == 0) {
                                            if (counter > 0) {
                                                %>
                                    </ul></div>
                                <%
                                            }
                                            %><div class="col-lg-4"><ul class="car-single-list"><%
                                        }

                                        %><li><i class="far fa-check-circle"></i><%= features.getFeature().getFeatureName() %></li><%

                                        counter++;
                                    }

                                    if (!featureList.isEmpty()) {
                                        %></ul></div><%
                                    }
                                %>

                                    
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
                        <h4 class="car-single-price"><%=car.getPrice() %> MAD</h4>
                        <ul class="car-single-meta">
                            <li><i class="fa-regular fa-gauge-high"></i> <%=car.getMileage() %> Miles</li>
                            <li><i class="far fa-location-dot"></i> Hay El Quds, Oujda</li>
                        </ul>
                    </div>
                    <div class="car-single-widget">
                        <div class="car-single-author">
                            
                            <img src="assets/upload/img/user/<%=car.getUserProfile().getImage() %>" alt="">
                            <div class="car-single-author-content">
                                <h5><%=car.getUserProfile().getFirstName() %> <%=car.getUserProfile().getLastName() %></h5>
                                <span>Admin</span>
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
                            <% if(request.getAttribute("id") != null){
                                int id = (int)request.getAttribute("id");
                                int AdminID = car.getUserID();

                                %>

                                <form action="singlecar" method="POST">
                                    <input type="hidden" name="currentID" value='<%= id %>'>
                                    <input type="hidden" name="AdminID" value='<%= AdminID %>'>

                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Enter Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Enter Email">
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3" name="message" placeholder="Write Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="theme-btn">Send Now<i class="fas fa-arrow-right-long"></i></button>
                                    </div>
                                </form>

                            <%
                            }else{
                                %>
                            <div class="alert alert-danger" id="success-alert" role="alert">
                                <h2>You have to login first</h2>
                            </div>


                                <%
                            }
                            %>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="car-single-related mt-5">
                <h3 class="mb-30">Related Listing</h3>
                <div class="row">
                    <%
                        List<Listing> lwata = (List<Listing>) request.getAttribute("RandomListings");
                        if (lwata != null) {
                            for (Listing loto : lwata) {
                    %>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="car-item">
                            <div class="car-img">
                                <% if(loto.getCondition().getConditionTType().equals("New")) {%>
                                <span class="car-status status-2">New</span>
                                <% } else if(loto.getCondition().getConditionTType().equals("Used")) {%>
                                <span class="car-status status-1">Used</span>
                                <% } else if(loto.getCondition().getConditionTType().equals("Certified Pre-Owned")) {%>
                                <span class="car-status status-2 bg-primary">Certified Pre-Owned</span>
                                <% }
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
                                    <h4><a href="singlecar?id=<%=loto.getListingID()%>"><%=loto.getTitle()%></a></h4>
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
                                    <li><i class="far fa-steering-wheel"></i><%=loto.getTransmission().getTransmissionType()%></li>
                                    <li><i class="far fa-road"></i><%=loto.getMileage()%>km</li>
                                    <li><i class="far fa-car"></i>Model: <%=loto.getYear().getYear()%></li>
                                    <li><i class="far fa-gas-pump"></i><%=loto.getFuelType().getFuelType()%></li>
                                </ul>
                                <div class="car-footer">
                                    <span class="car-price"><%=loto.getPrice()%> MAD</span>
                                    <a  href="singlecar?id=<%=loto.getListingID()%>" class="theme-btn"><span class="far fa-eye"></span>Details</a>
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
</div>
<jsp:include page="/template/bottom.jsp" />