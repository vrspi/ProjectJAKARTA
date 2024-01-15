<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- Calculator" />
</jsp:include>


    <!-- breadcrumb -->
    <div class="site-breadcrumb" style="background: url(assets/img/breadcrumb/01.jpg)">
        <div class="container">
            <h2 class="breadcrumb-title">Calculator</h2>
            <ul class="breadcrumb-menu">
                <li><a href="/carcrafter/">Home</a></li>
                <li class="active">Calculator</li>
            </ul>
        </div>
    </div>
    <!-- breadcrumb end -->


    <!-- calculator -->
    <div class="calculator py-120">
        <div class="container">
            <div class="calculator-wrapper">
                <h4>Financing Calculator</h4>
                <div class="row">
                    <div class="col-lg-7">
                        <div class="calculator-form">
                            <form action="#">
                                <div class="form-group">
                                    <input type="text" id="price" class="form-control" placeholder="MAD Price" required>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" id="rate" class="form-control" placeholder="% Rate" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" id="period" class="form-control" placeholder="Loan Period" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="downPayment" class="form-control" placeholder="MAD Down Payment" required>
                                </div>
                                <button type="submit" class="theme-btn">Calculate Now<i class="fas fa-arrow-right-long"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="calculator-img">
                            <img src="assets/img/calculator/01.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- calculator end -->


<jsp:include page="template/bottom.jsp" />