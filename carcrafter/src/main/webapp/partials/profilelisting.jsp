<%@ page import="com.carcrafter.model.*" %>
<%@ page import="java.util.List" %>


<div class="user-profile-wrapper">
    <div class="user-profile-card profile-ad">
        <div class="user-profile-card-header">
            <h4 class="user-profile-card-title">My Listing</h4>
            <div class="user-profile-card-header-right">
                <div class="user-profile-search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <i class="far fa-search"></i>
                    </div>
                </div>
                <a href="AddListing" class="theme-btn"><span class="far fa-plus-circle"></span>Add Listing</a>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="table-responsive">
                <table class="table text-nowrap">
                    <thead>
                    <tr>
                        <th>Car Info</th>
                        <th>Brand</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Listing> lwata = (List<Listing>) request.getAttribute("Cars");
                        if (lwata != null) {
                            for (Listing loto : lwata) {
                    %>
                    <tr>
                        <td>
                            <div class="table-list-info">
                                <a href="#">
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
                                    <div class="table-list-content">
                                        <h6><%= loto.getTitle() %></h6>
                                        <span>Car ID: #<%=loto.getListingID()%></span>
                                    </div>
                                </a>
                            </div>
                        </td>
                        <td><%=loto.getMakeBrand().getMakeName()%></td>
                        <td><%=loto.getYear().getYear()%></td>
                        <td><%=loto.getPrice()%></td>
                        <td>
                            <a href="#" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" aria-label="Details"><i class="far fa-eye"></i></a>
                            <a href="UpdateListing?listingId=<%=loto.getListingID()%>" class="btn btn-outline-secondary btn-sm rounded-2" data-bs-toggle="tooltip" aria-label="Edit"><i class="far fa-pen"></i></a>
                            <a href="DeleteListing?listingId=<%=loto.getListingID()%>" class="btn btn-outline-danger btn-sm rounded-2" data-bs-toggle="tooltip" aria-label="Delete">
                                <i class="far fa-trash-can"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <!-- pagination -->
            <div class="pagination-area">
                <div aria-label="Page navigation example">
                    <ul class="pagination my-3">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true"><i class="far fa-angle-double-left"></i></span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true"><i class="far fa-angle-double-right"></i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>