<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
    <div class="user-profile-wrapper">
        <div class="user-profile-card">
            <h4 class="user-profile-card-title">Add New Listing</h4>
            <div class="col-lg-12">
                <div class="add-listing-form">
                    <h6 class="mb-1">Basic Information</h6>
                    <form action="#">
                        <div class="row align-items-center">
                            <div class="col-lg-12 mb-3">
                                <div class="form-group">
                                    <label for="listingTitle" class="form-label">Listing Title</label>
                                    <input type="text" class="form-control" id="listingTitle" placeholder="Enter title">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="Condition" class="form-label">Condition</label>
                                    
                                        <select name="Condition" class="form-select" id="Condition"></select>
                                        <option value="">Choose</option>
                                        <option value="1">New</option>
                                        <option value="2">Used</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">New</li><li data-value="2" class="option">Used</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="bodyType" class="form-label">Body Type</label>
                                    <select name="bodyType" class="form-select" id="bodyType">
                                        <% 
                                        List<BodyType> bodyTypes = (List<BodyType>) request.getAttribute("bodyTypes");
                                        for(BodyType bodyType : bodyTypes) {
                                        %>
                                            <option value="<%= bodyType.getBodyTypeID() %>"><%= bodyType.getBodyType() %></option>
                                        <%
                                        }
                                        %>
                                    </select>   
                                   
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="makeBrand" class="form-label">Make/Brand</label>
                                    <select name="makeBrand" class="form-select" id="makeBrand">
                                        <% 
                                        List<MakeBrand> makeBrands = (List<MakeBrand>) request.getAttribute("makeBrands");
                                        for(MakeBrand makeBrand : makeBrands) {
                                        %>
                                            <option value="<%= makeBrand.getMakeID() %>"><%= makeBrand.getMakeName() %></option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="model" class="form-label">Model</label>
                                    <select name="model" class="form-select" id="model">
                                        <option value="">Choose</option>
                                        <option value="1">A3</option>
                                        <option value="2">A4</option>
                                        <option value="3">A6</option>
                                        <option value="4">Q4</option>
                                        <option value="5">Q7</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">A3</li><li data-value="2" class="option">A4</li><li data-value="3" class="option">A6</li><li data-value="4" class="option">Q4</li><li data-value="5" class="option">Q7</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="price" class="form-label">Price (USD)</label>
                                    <input type="text" class="form-control" id="price" placeholder="Enter price">
                                </div>
                            </div>
                            
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="year" class="form-label">Year</label>
                                    <select name="year" class="form-select" id="year">
                                        <option value="">Choose</option>
                                        <option value="1">2023</option>
                                        <option value="2">2022</option>
                                        <option value="3">2021</option>
                                        <option value="4">2020</option>
                                        <option value="5">2019</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">2023</li><li data-value="2" class="option">2022</li><li data-value="3" class="option">2021</li><li data-value="4" class="option">2020</li><li data-value="5" class="option">2019</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="driveType" class="form-label">Drive Type</label>
                                    <select name="driveType" class="form-select" id="driveType">
                                        <option value="">Choose</option>
                                        <option value="1">Automatic</option>
                                        <option value="2">Semi Auto</option>
                                        <option value="3">Manual</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Automatic</li><li data-value="2" class="option">Semi Auto</li><li data-value="3" class="option">Manual</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="transmission" class="form-label">Transmission</label>
                                    <select name="transmission" class="form-select" id="transmission">
                                        <option value="">Choose</option>
                                        <option value="1">Automatic</option>
                                        <option value="2">Manual</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Automatic</li><li data-value="2" class="option">Manual</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="fuelType" class="form-label">Fuel Type</label>
                                    <select name="fuelType" class="form-select" id="fuelType">
                                        <option value="">Choose</option>
                                        <option value="1">Diesel</option>
                                        <option value="2">Petrol</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Diesel</li><li data-value="2" class="option">Petrol</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="mileage" class="form-label">Mileage</label>
                                    <input type="text" class="form-control" id="mileage" placeholder="Enter mileage">
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="engineSize" class="form-label">Engine Size</label>
                                    <input type="text" class="form-control" id="engineSize" placeholder="Enter engine size">
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="cylinders" class="form-label">Cylinders</label>
                                    <select name="cylinders" class="form-select" id="cylinders">
                                        <option value="">Choose</option>
                                        <option value="1">4</option>
                                        <option value="2">6</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">4</li><li data-value="2" class="option">6</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="color" class="form-label">Color</label>
                                    <select name="color" class="form-select" id="color">
                                        <option value="">Choose</option>
                                        <option value="1">Red</option>
                                        <option value="2">White</option>
                                        <option value="3">Black</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Red</li><li data-value="2" class="option">White</li><li data-value="3" class="option">Black</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="doors" class="form-label">Doors</label>
                                    <select name="doors" class="form-select" id="doors">
                                        <option value="">Choose</option>
                                        <option value="1">2</option>
                                        <option value="2">4</option>
                                        <option value="3">6</option>
                                    </select>
                                    <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">2</li><li data-value="2" class="option">4</li><li data-value="3" class="option">6</li></ul></div> -->
                                </div>
                            </div>
                            <div class="col-lg-4 mb-3">
                                <div class="form-group">
                                    <label for="vin" class="form-label">VIN</label>
                                    <input type="text" class="form-control" id="vin" placeholder="Enter VIN">
                                </div>
                            </div>
                            <div class="col-lg-12 mb-3">
                                <div class="form-group">
                                    <label for="tags" class="form-label">Tags or Keyword</label>
                                    <input type="text" class="form-control" id="tags" placeholder="Enter tags ex: car,red">
                                </div>
                            </div>
                            <h6 class="fw-bold mt-4 mb-1">Upload Images</h6>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="list-upload-wrapper">
                                        <div class="list-img-upload">
                                            <span><i class="far fa-images"></i> Upload Listing
                                                Images</span>
                                        </div>
                                        <input type="file" class="list-img-file" multiple="">
                                    </div>
                                </div>
                            </div>
                            <h6 class="fw-bold mt-4 mb-1">Location</h6>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control" placeholder="Enter address">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>City</label>
                                    <input type="text" class="form-control" placeholder="Enter city">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>State</label>
                                    <input type="text" class="form-control" placeholder="Enter state">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Zip Code</label>
                                    <input type="text" class="form-control" placeholder="Enter zip code">
                                </div>
                            </div>
                            <h6 class="fw-bold mt-4 mb-1">Detailed Information</h6>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" placeholder="Write description" cols="30" rows="5"></textarea>
                                </div>
                            </div>
                            <h6 class="fw-bold my-4">Features</h6>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature1">
                                    <label class="form-check-label" for="feature1">
                                        Multi-zone A/C
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature2">
                                    <label class="form-check-label" for="feature2">
                                        Adaptive Cruise Control
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature3">
                                    <label class="form-check-label" for="feature3">
                                        Sunroof
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature4">
                                    <label class="form-check-label" for="feature4">
                                        Heated front seats
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature5">
                                    <label class="form-check-label" for="feature5">
                                        Cooled Seats
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature6">
                                    <label class="form-check-label" for="feature6">
                                        Panoramic roof
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature7">
                                    <label class="form-check-label" for="feature7">
                                        Navigation system
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature8">
                                    <label class="form-check-label" for="feature8">
                                        Keyles Start
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature9">
                                    <label class="form-check-label" for="feature9">
                                        Bluetooth
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature10">
                                    <label class="form-check-label" for="feature10">
                                        Antilock brakes
                                    </label>
                                </div>
                            </div>
                            <div class="col-6 col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="feature" type="checkbox" value="" id="feature11">
                                    <label class="form-check-label" for="feature11">
                                        Android Auto
                                    </label>
                                </div>
                            </div>
                            <h6 class="fw-bold mt-4 mb-1">Contact Information</h6>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="form-control" placeholder="Enter name">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" class="form-control" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" placeholder="Enter phone">
                                </div>
                            </div>
                            <div class="col-12 mt-4">
                                <div class="form-check">
                                    <input class="form-check-input" name="agree" type="checkbox" value="" id="agree">
                                    <label class="form-check-label" for="agree">
                                        I Agree With Your Terms Of Services And Privacy Policy.
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-12 my-4">
                                <button type="submit" class="theme-btn"><span class="far fa-save"></span> Save &amp; Publish Listing</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>