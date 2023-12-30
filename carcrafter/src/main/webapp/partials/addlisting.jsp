<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page import="java.util.Map" %>
<div class="user-profile-wrapper">
    <div class="user-profile-card">
        <h4 class="user-profile-card-title">Add New Listing</h4>
        <div class="col-lg-12">
            <div class="add-listing-form">
                <h6 class="mb-1">Basic Information</h6>
                <form action="AddListing" method="post" enctype="multipart/form-data">
                    <div class="row align-items-center">
                        <div class="col-lg-12 mb-3">
                            <div class="form-group">
                                <label for="listingTitle" class="form-label">Listing Title</label>
                                <input name="listingTitle" value="<%= request.getAttribute("listingTitle") %>" type="text" class="form-control" id="listingTitle" placeholder="Enter title">
                                <!-- eror -->
                                <%
                                    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String listingTitleError = errors.get("listingTitle");
                                        if (listingTitleError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= listingTitleError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="Condition" class="form-label">Condition</label>
                                <select name="Condition" class="form-select" id="Condition">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        for(ConditionT ConditionT : (List<ConditionT>) request.getAttribute("ConditionTs")) {
                                            if (ConditionT.getConditionTID() == Integer.parseInt((String) request.getAttribute("selectedcondition")))
                                            {
                                    %>
                                    <option selected value="<%= ConditionT.getConditionTID() %>"><%= ConditionT.getConditionTType() %></option>
                                    <%
                                            }
                                            else
                                            {
                                    %>
                                    <option value="<%= ConditionT.getConditionTID() %>"><%= ConditionT.getConditionTType() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>




                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">New</li><li data-value="2" class="option">Used</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="bodyType" class="form-label">Body Type</label>
                                <select name="bodyType" class="form-select" id="bodyType">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<BodyType> bodyTypes = (List<BodyType>) request.getAttribute("bodyTypes");
                                        for(BodyType bodyType : bodyTypes) {
                                    %>
                                    <option <%= (bodyType.getBodyTypeID() == Integer.parseInt((String) request.getAttribute("selectedbodyType"))) ? "selected" : "" %> value="<%= bodyType.getBodyTypeID() %>"><%= bodyType.getBodyType() %></option>
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
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<MakeBrand> makeBrands = (List<MakeBrand>) request.getAttribute("makeBrands");
                                        for(MakeBrand makeBrand : makeBrands) {
                                    %>
                                    <option <%= (makeBrand.getMakeID() == Integer.parseInt((String) request.getAttribute("selectedmakeBrand"))) ? "selected" : "" %> value="<%= makeBrand.getMakeID() %>"><%= makeBrand.getMakeName() %></option>
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
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Model> models = (List<Model>) request.getAttribute("models");
                                        for (Model model : models) {
                                    %>
                                    <option <%= (model.getModelID() == Integer.parseInt((String) request.getAttribute("selectedmodel"))) ? "selected" : "" %> value="<%= model.getModelID() %>"><%= model.getModelName() %></option>
                                    <%
                                        }
                                    %>

                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">A3</li><li data-value="2" class="option">A4</li><li data-value="3" class="option">A6</li><li data-value="4" class="option">Q4</li><li data-value="5" class="option">Q7</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="price" class="form-label">Price (USD)</label>
                                <input name="price" value="<%= request.getAttribute("price") %>" type="text" class="form-control" id="price" placeholder="Enter price">
                                <!-- eror -->
                                <% if (request.getAttribute("errors") != null)
                                {
                                    String priceError = errors.get("price");
                                    if (priceError != null)
                                    { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= priceError %></div>
                                <%}
                                } %>
                            </div>
                        </div>

                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="year" class="form-label">Year</label>
                                <select name="year" class="form-select" id="year">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Year> years = (List<Year>) request.getAttribute("years");
                                        for(Year year : years) {
                                    %>
                                    <option <%= (year.getYearID() == Integer.parseInt((String) request.getAttribute("selectedyear"))) ? "selected" : "" %> value="<%= year.getYearID() %>"><%= year.getYear() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">2023</li><li data-value="2" class="option">2022</li><li data-value="3" class="option">2021</li><li data-value="4" class="option">2020</li><li data-value="5" class="option">2019</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="driveType" class="form-label">Drive Type</label>
                                <select name="driveType" class="form-select" id="driveType">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<DriveType> driveTypes = (List<DriveType>) request.getAttribute("driveTypes");
                                        for(DriveType driveType : driveTypes) {
                                    %>
                                    <option <%= (driveType.getDriveTypeID() == Integer.parseInt((String) request.getAttribute("selecteddriveType"))) ? "selected" : "" %> value="<%= driveType.getDriveTypeID() %>"><%= driveType.getDriveType() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Automatic</li><li data-value="2" class="option">Semi Auto</li><li data-value="3" class="option">Manual</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="transmission" class="form-label">Transmission</label>
                                <select name="transmission" class="form-select" id="transmission">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Transmission> transmissions = (List<Transmission>) request.getAttribute("transmissions");
                                        for(Transmission transmission : transmissions) {
                                    %>
                                    <option <%= (transmission.getTransmissionID() == Integer.parseInt((String) request.getAttribute("selectedtransmission"))) ? "selected" : "" %> value="<%= transmission.getTransmissionID() %>"><%= transmission.getTransmissionType() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Automatic</li><li data-value="2" class="option">Manual</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="fuelType" class="form-label">Fuel Type</label>
                                <select name="fuelType" class="form-select" id="fuelType">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<FuelType> fuelTypes = (List<FuelType>) request.getAttribute("fuelTypes");
                                        for(FuelType fuelType : fuelTypes) {
                                    %>
                                    <option <%= (fuelType.getFuelTypeID() == Integer.parseInt((String) request.getAttribute("selectedfuelType"))) ? "selected" : "" %> value="<%= fuelType.getFuelTypeID() %>"><%= fuelType.getFuelType() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Diesel</li><li data-value="2" class="option">Petrol</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="mileage" class="form-label">Mileage</label>
                                <input name="mileage" value="<%= request.getAttribute("mileage") %>" type="text" class="form-control" id="mileage" placeholder="Enter mileage">
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String mileageError = errors.get("mileage");
                                        if (mileageError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= mileageError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="engineSize" class="form-label">Engine Size</label>
                                <input name="engineSize" value="<%= request.getAttribute("engineSize") %>" type="text" class="form-control" id="engineSize" placeholder="Enter engine size">
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String engineSizeError = errors.get("engineSize");
                                        if (engineSizeError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= engineSizeError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="cylinders" class="form-label">Cylinders</label>
                                <select name="cylinders" class="form-select" id="cylinders">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Cylinders> cylinders = (List<Cylinders>) request.getAttribute("cylinders");
                                        for(Cylinders cylinder : cylinders) {
                                    %>
                                    <option <%= (cylinder.getCylindersID() == Integer.parseInt((String) request.getAttribute("selectedcylinders"))) ? "selected" : "" %> value="<%= cylinder.getCylindersID() %>"><%= cylinder.getNumberOfCylinders() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">4</li><li data-value="2" class="option">6</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="color" class="form-label">Color</label>
                                <select name="color" class="form-select" id="color">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Color> colors = (List<Color>) request.getAttribute("colors");
                                        for(Color color : colors) {
                                    %>
                                    <option <%= (color.getColorID() == Integer.parseInt((String) request.getAttribute("selectedcolor"))) ? "selected" : "" %> value="<%= color.getColorID() %>"><%= color.getColorName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">Red</li><li data-value="2" class="option">White</li><li data-value="3" class="option">Black</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="doors" class="form-label">Doors</label>
                                <select name="doors" class="form-select" id="doors">
                                    <option selected value="" disabled hidden>Choisir...</option>
                                    <%
                                        List<Doors> doorsList = (List<Doors>) request.getAttribute("doorsList");
                                        for(Doors doors : doorsList) {
                                    %>
                                    <option <%= (doors.getDoorsID() == Integer.parseInt((String) request.getAttribute("selecteddoors"))) ? "selected" : "" %> value="<%= doors.getDoorsID() %>"><%= doors.getNumberOfDoors() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <!-- <div class="nice-select select" tabindex="0"><span class="current">Choose</span><ul class="list"><li data-value="" class="option selected">Choose</li><li data-value="1" class="option">2</li><li data-value="2" class="option">4</li><li data-value="3" class="option">6</li></ul></div> -->
                            </div>
                        </div>
                        <div class="col-lg-4 mb-3">
                            <div class="form-group">
                                <label for="vin" class="form-label">VIN</label>
                                <input name="vin" value="<%= request.getAttribute("vin") %>" type="text" class="form-control" id="vin" placeholder="Enter VIN">
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String vinError = errors.get("vin");
                                        if (vinError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= vinError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <div class="col-lg-12 mb-3">
                            <div class="form-group">
                                <label for="tags" class="form-label">Tags or Keyword</label>
                                <input name="tags" value="<%= request.getAttribute("tags") %>" type="text" class="form-control" id="tags" placeholder="Enter tags ex: car,red">
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String tagsError = errors.get("tags");
                                        if (tagsError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= tagsError %></div>
                                <%}
                                } %>
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
                                    <input type="file" name="file" class="list-img-file" multiple="">
                                </div>
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String imagesError = errors.get("images");
                                        if (imagesError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= imagesError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <h6 class="fw-bold mt-4 mb-1">Detailed Information</h6>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" value="<%= request.getAttribute("description") %>" class="form-control" placeholder="Write description" cols="30" rows="5"></textarea>
                                <!-- eror -->
                                <%
                                    if (request.getAttribute("errors") != null)
                                    {
                                        String descriptionError = errors.get("description");
                                        if (descriptionError != null)
                                        { %>
                                <div class="form-message text-danger" style="font-size: smaller;padding-left: 10px;"><%= descriptionError %></div>
                                <%}
                                } %>
                            </div>
                        </div>
                        <h6 class="fw-bold my-4">Features</h6>
                        <%
                            List<Features> featureList = (List<Features>) request.getAttribute("featureList");
                            for(Features features : featureList) {
                        %>
                        <div class="col-6 col-md-4">
                            <div class="form-check">
                                <input class="form-check-input" name="feature" type="checkbox" value="<%= features.getFeatureID() %>" id="feature1">
                                <label class="form-check-label" for="feature1">
                                    <%= features.getFeatureName() %>
                                </label>
                            </div>
                        </div>
                        <%
                            }
                        %>


                        <h6 class="fw-bold mt-4 mb-1">Contact Information</h6>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Name</label>
                                <input disabled value="<%= request.getAttribute("Name") %>" type="text" class="form-control" placeholder="Enter name">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Email</label>
                                <input disabled value="<%= request.getAttribute("Email") %>" type="text" class="form-control" placeholder="Enter email">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Phone</label>
                                <input disabled value="<%= request.getAttribute("Phone") %>" type="text" class="form-control" placeholder="Enter phone">
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