<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page import="static java.util.Optional.empty" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="Listing List" />
</jsp:include>

<!-- breadcrumb -->
<%--<div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">--%>
<%--    <div class="container">--%>
<%--        <h2 class="breadcrumb-title">Listing List</h2>--%>
<%--        <ul class="breadcrumb-menu">--%>
<%--            <li><a href="Home">Home</a></li>--%>
<%--            <li class="active">Listing List</li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- breadcrumb end -->



<!-- car area -->
<div class="car-area list bg py-120">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="car-sidebar">
                    <div class="car-widget">
                        <div class="car-search-form">
                            <h4 class="car-widget-title">Search</h4>
                            <form action="#">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                    <button type="search"><i class="far fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="car-widget">
                        <h4 class="car-widget-title">Brands</h4>
                        <ul>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="brand">
                                    <label class="form-check-label" for="brand"> All Brands</label>
                                </div>
                            </li>

                            <%
                                List<MakeBrand> BrandList = (List<MakeBrand>) request.getAttribute("Brands");
                                for(MakeBrand brand : BrandList) {
                            %>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="<%=brand.getMakeID()%>">
                                        <label class="form-check-label" for="<%=brand.getMakeID()%>"> <%=brand.getMakeName()%></label>
                                    </div>
                                </li>
                            <%
                                }
                            %>



                        </ul>
                    </div>
                    <div class="car-widget">
                        <h4 class="car-widget-title">Price Range</h4>
                        <div class="price-range-box">
                            <div class="price-range-input">
                                <input type="text" id="price-amount" readonly>
                            </div>
                            <div class="price-range"></div>
                        </div>
                    </div>
                    <div class="car-widget">
                        <h4 class="car-widget-title">Transmission</h4>
                        <ul>
                            <%
                                List<Transmission> TransmissionsList = (List<Transmission>) request.getAttribute("Transmissions");
                                for(Transmission transmission : TransmissionsList) {
                            %>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="<%=transmission.getTransmissionID()%>">
                                    <label class="form-check-label" for="<%=transmission.getTransmissionID()%>"><%=transmission.getTransmissionType()%></label>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <div class="car-widget">
                        <h4 class="car-widget-title">Fuel Type</h4>
                        <ul>
                            <%
                                List<FuelType> fuelTypesList = (List<FuelType>) request.getAttribute("fuelTypes");
                                for(FuelType fueltype : fuelTypesList) {
                            %>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="<%=fueltype.getFuelTypeID()%>">
                                    <label class="form-check-label" for="<%=fueltype.getFuelTypeID()%>"><%=fueltype.getFuelType()%></label>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <div class="car-widget">
                        <h4 class="car-widget-title">Features</h4>
                        <ul>
                            <%
                                List<Features> FeaturesList = (List<Features>) request.getAttribute("featureList");
                                for(Features features : FeaturesList) {
                            %>
                            <li>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="<%=features.getFeatureID()%>">
                                    <label class="form-check-label" for="<%=features.getFeatureID()%>"><%=features.getFeatureName()%></label>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="col-md-12">
                    <div class="car-sort">
                        <%
                            int totalCars = (int) request.getAttribute("CountCar");
                            int totalPages = (int) Math.ceil((double) totalCars / 10);

                            if (totalCars <= 10) {
                        %>
                        <h6>Showing 1 of <%= totalCars %> Results</h6>
                        <%
                        } else {
                        %>
                        <h6>Showing 1-<%= totalPages %> of <%= totalCars %> Results</h6>
                        <%
                            }
                        %>

                        <div class="car-sort-list-grid">
                            <a class="car-sort-grid" href="Shop"><i
                                    class="far fa-grid-2"></i></a>
                            <a class="car-sort-list active" href="ListingList"><i class="far fa-list-ul"></i></a>
                        </div>
                        <div class="col-md-3 car-sort-box">
                            <select class="select">
                                <option value="1">Sort By Default</option>
                                <option value="5">Sort By Featured</option>
                                <option value="2">Sort By Latest</option>
                                <option value="3">Sort By Low Price</option>
                                <option value="4">Sort By High Price</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%
                        List<Listing> lwata = (List<Listing>) request.getAttribute("Cars");
                        if (lwata != null) {
                            for (Listing loto : lwata) {
                    %>
                    <div class="col-md-6 col-lg-12">
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
                                    <li><i class="far fa-road"></i><%=loto.getMileage()%>km / 1-litre</li>
                                    <li><i class="far fa-car"></i>Model: <%=loto.getYear().getYear()%></li>
                                    <li><i class="far fa-gas-pump"></i><%=loto.getFuelType().getFuelType()%></li>
                                </ul>
                                <p>
                                    <%=loto.getDescription()%>
                                </p>
                                <div class="car-footer">
                                    <span class="car-price"><%=loto.getPrice()%>MAD</span>
                                    <a href="singlecar?id=<%=loto.getListingID()%>" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%
                            }
                        }
                    %>

                <div>

                <!-- pagination -->
<%--                <div class="pagination-area">--%>
<%--                    <div aria-label="Page navigation example">--%>
<%--                        <ul class="pagination">--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#" aria-label="Previous">--%>
<%--                                    <span aria-hidden="true"><i class="far fa-arrow-left"></i></span>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                            <li class="page-item">--%>
<%--                                <a class="page-link" href="#" aria-label="Next">--%>
<%--                                    <span aria-hidden="true"><i class="far fa-arrow-right"></i></span>--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <!-- pagination end -->
            </div>
        </div>
    </div>
        </div>
    </div>
</div>

    <!-- car area end -->
<!-- privacy policy end -->

<jsp:include page="template/bottom.jsp" />