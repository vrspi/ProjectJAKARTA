
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Long" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../template/top.jsp">
    <jsp:param name="title" value="Listing Grid" />
</jsp:include>

<!-- sidebar-popup end -->


  <!-- breadcrumb -->
<!--<div class="site-breadcrumb" style="background: url('../assets/img/breadcrumb/01.jpg');">

    <div class="container">
      <h2 class="breadcrumb-title">Listing Grid</h2>
      <ul class="breadcrumb-menu">
        <li><a href="/">Home</a></li>
        <li class="active">Listing Grid</li>
      </ul>
    </div>
  </div>-->
  <!-- breadcrumb end -->



  <!-- car area -->
  <div class="car-area grid bg py-120">
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
              <h6>Showing 1 of <%= request.getAttribute("carsnumber") %> Results</h6>
              <div class="car-sort-list-grid">
                <a class="car-sort-grid active" href="ListingList"><i
                        class="far fa-grid-2"></i></a>
                <a class="car-sort-list" href="ListingList"><i class="far fa-list-ul"></i></a>
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
              List<Listing> cars = (List<Listing>) request.getAttribute("cars");
              if (cars != null) {
                for (Listing car : cars) {
            %>
            <div class="col-md-6 col-lg-4">
              <div class="car-item">
                <div class="car-img">
                  <% if(car.getCondition().getConditionTType().equals("New")) {%>
                      <span class="car-status status-2">New</span>
                  <% } else if(car.getCondition().getConditionTType().equals("Used")) {%>
                  <span class="car-status status-1">Used</span>
                  <% } else if(car.getCondition().getConditionTType().equals("Certified Pre-Owned")) {%>
                  <span class="car-status status-2 bg-primary">Certified Pre-Owned</span>
                    <% }
                        if (car.getImages() != null && car.getImages().size() > 0 && car.getImages().get(0).getImagePath() != null) {
                    %>
                    <img src="assets/upload/img/car/<%= car.getImages().get(0).getImagePath() %>" alt="ImageCar">
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
                    <h4><a href="#"><%=car.getTitle()%></a></h4>
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
                    <li><i class="far fa-steering-wheel"></i><%=car.getTransmission().getTransmissionType()%></li>
                    <li><i class="far fa-road"></i><%=car.getMileage()%>Km</li>
                    <li><i class="far fa-car"></i><%=car.getModel().getModelName()%></li>
                    <li><i class="far fa-gas-pump"></i><%=car.getFuelType().getFuelType()%></li>
                  </ul>
                  <div class="car-footer">
                    <span class="car-price"><%=car.getPrice()%>MAD</span>
                    <a href="singlecar?id=<%=car.getListingID()%>" class="theme-btn"><span class="far fa-eye"></span>Details</a>
                  </div>
                </div>
              </div>
            </div>
            <%
                }
              }
            %>
          </div>
          <!-- pagination -->
<%--          <div class="pagination-area">--%>
<%--            <div aria-label="Page navigation example">--%>
<%--              <ul class="pagination">--%>
<%--                <li class="page-item">--%>
<%--                  <a class="page-link" href="#" aria-label="Previous">--%>
<%--                    <span aria-hidden="true"><i class="far fa-arrow-left"></i></span>--%>
<%--                  </a>--%>
<%--                </li>--%>
<%--                <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                <li class="page-item">--%>
<%--                  <a class="page-link" href="#" aria-label="Next">--%>
<%--                    <span aria-hidden="true"><i class="far fa-arrow-right"></i></span>--%>
<%--                  </a>--%>
<%--                </li>--%>
<%--              </ul>--%>
<%--            </div>--%>
<%--          </div>--%>
          <!-- pagination end -->
        </div>
      </div>
    </div>
  </div>
  <!-- car area end -->
<jsp:include page="../template/bottom.jsp" />
