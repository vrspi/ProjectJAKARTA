<div class="counter-area pt-30 pb-30">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="counter-box">
                    <div class="icon">
                        <i class="flaticon-car-rental"></i>
                    </div>
                    <div>
                        <% var count_cars = request.getAttribute("Cars_count");
                        if (count_cars == null) { %>
                        <span class="counter" data-count="+" data-to="500" data-speed="3000">500</span>
                        <% } else { %>
                        <span class="counter" data-count="+" data-to="<%= count_cars %>" data-speed="3000"><%= count_cars %></span>
                        <% } %>
                        <h6 class="title">+ Available Cars </h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="counter-box">
                    <div class="icon">
                        <i class="flaticon-car-key"></i>
                    </div>
                    <div>
                        <% var count_users = request.getAttribute("Users_count");
                            if (count_users == null) { %>
                        <span class="counter" data-count="+" data-to="900" data-speed="3000">900</span>
                        <% } else { %>
                        <span class="counter" data-count="+" data-to="<%= count_users %>" data-speed="3000"><%= count_users %></span>
                        <% } %>
                        <h6 class="title">+ Happy Clients</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="counter-box">
                    <div class="icon">
                        <i class="flaticon-screwdriver"></i>
                    </div>
                    <div>
                        <span class="counter" data-count="+" data-to="50" data-speed="3000">50</span>
                        <h6 class="title">+ Team Workers</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="counter-box">
                    <div class="icon">
                        <i class="flaticon-review"></i>
                    </div>
                    <div>
                        <span class="counter" data-count="+" data-to="15" data-speed="3000">15</span>
                        <h6 class="title">+ Years Of Experience</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>