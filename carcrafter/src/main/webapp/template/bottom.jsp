<%@ page contentType="text/html;charset=UTF-8" language="java" %>

</main>

<!-- footer area -->
<footer class="footer-area">
    <div class="footer-widget">
        <div class="container">
            <div class="row footer-widget-wrapper pt-100 pb-70">
                <div class="col-md-6 col-lg-4">
                    <div class="footer-widget-box about-us">
                        <a href="/carcrafter/" class="footer-logo">
                            <img src="assets/img/logo/logo-light.png" alt="">
                        </a>
                        <p class="mb-3">
                            Explore possibilities with us. Our commitment to authenticity defines our journey. Join us where every word is heard and believed.
                        </p>
                        <ul class="footer-contact">
                            <li><a href="mailto:<%@ include file="/info/email.jsp" %>"><i class="far fa-envelope"></i><%@ include file="/info/email.jsp" %></a></li>
                            <li><a href="tel:<%@ include file="/info/phone.jsp" %>"><i class="far fa-phone"></i><%@ include file="/info/phone.jsp" %></a></li>
                            <li><i class="far fa-map-marker-alt"></i><%@ include file="/info/address.jsp" %></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title">Quick Links</h4>
                        <ul class="footer-list">
                            <li><a href="/carcrafter/"><i class="fas fa-caret-right"></i> Home</a></li>
                            <li><a href="services"><i class="fas fa-caret-right"></i> Services</a></li>
                            <li><a href="blog"><i class="fas fa-caret-right"></i> Blog</a></li>
                            <li><a href="shop"><i class="fas fa-caret-right"></i> Shop</a></li>
                            <li><a href="team"><i class="fas fa-caret-right"></i> Our Team</a></li>
                            <li><a href="calculator"><i class="fas fa-caret-right"></i> Calculator</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title">Support Center</h4>
                        <ul class="footer-list">
                            <li><a href="about"><i class="fas fa-caret-right"></i> About Us</a></li>
                            <li><a href="contact"><i class="fas fa-caret-right"></i> Contact Us</a></li>
                            <li><a href="testimonials"><i class="fas fa-caret-right"></i> Testimonials</a></li>
                            <li><a href="terms"><i class="fas fa-caret-right"></i> Terms Of Service</a></li>
                            <li><a href="privacy"><i class="fas fa-caret-right"></i> Privacy policy</a></li>
                            <li><a href="faq"><i class="fas fa-caret-right"></i> FAQ's</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="footer-widget-box list">
                        <h4 class="footer-widget-title">Newsletter</h4>
                        <div class="footer-newsletter">
                            <p>Subscribe Our Newsletter To Get Latest Update And News</p>
                            <div class="subscribe-form">
                                <form action="#">
                                    <input type="email" class="form-control" placeholder="Your Email">
                                    <button class="theme-btn" type="submit">
                                        Subscribe Now <i class="far fa-paper-plane"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <p class="copyright-text">
                        &copy; Copyright <span id="date"></span> <a href="/carcrafter/"> MOTEX </a> All Rights Reserved.
                    </p>
                </div>
                <div class="col-md-6 align-self-center">
                    <ul class="footer-social">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-x-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer area end -->


<!-- scroll-top -->
<a href="#" id="scroll-top"><i class="far fa-arrow-up"></i></a>
<!-- scroll-top end -->


<!-- js -->
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/imagesloaded.pkgd.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/isotope.pkgd.min.js"></script>
<script src="assets/js/jquery.appear.min.js"></script>
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/counter-up.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/jquery.nice-select.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/flex-slider.js"></script>
<script src="assets/js/main.js"></script>

<script src="assets/js/messages.js"></script>
<script>
    function previewAndSubmit() {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('previewImage').src = e.target.result;
                // Soumettre le formulaire après l'affichage de l'aperçu
                document.getElementById('uploadForm').submit();
            }

            reader.readAsDataURL(file);
        }
    }

    function loadPartial(event, partialPath) {
        event.preventDefault();
        // Remove 'active' class from all similar elements
        document.querySelectorAll('.user-profile-sidebar-list a').forEach(function(element) {
            element.classList.remove('active');
        });

        // Add 'active' class to the clicked element
        event.target.classList.add('active');
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById('partialContainer').innerHTML = xhr.responseText;
            }
        };
        xhr.open('GET', '/carcrafter/RouterController?partial=' + partialPath, true);
        xhr.send();
    }
</script>

<% if (request.getAttribute("is in calculator page") != null) { %>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Function to calculate the monthly payment
        function calculateMonthlyPayment(price, rate, period, downPayment) {
            // Convert rate to decimal
            rate = rate / 100.0;

            // Monthly interest rate
            var monthlyRate = rate / 12.0;

            // Number of monthly payments
            var numberOfPayments = period * 12;

            // Calculate monthly payment using the formula
            var monthlyPayment =
                (price - downPayment) *
                (monthlyRate * Math.pow(1 + monthlyRate, numberOfPayments)) /
                (Math.pow(1 + monthlyRate, numberOfPayments) - 1);

            return monthlyPayment;
        }

        // Function to handle form submission
        function handleFormSubmit(event) {
            event.preventDefault();

            // Get form values
            var price = parseFloat(document.getElementById('price').value);
            var rate = parseFloat(document.getElementById('rate').value);
            var period = parseFloat(document.getElementById('period').value);
            var downPayment = parseFloat(document.getElementById('downPayment').value);

            // Calculate monthly payment
            if (price == null || isNaN(price) || rate == null || isNaN(rate) || period == null || isNaN(period) || downPayment == null || isNaN(downPayment)){
                alert('All the fields are required !');
            } else {
                var monthlyPayment = calculateMonthlyPayment(price, rate, period, downPayment);

                // Display the result (you can customize this part)
                alert('Your monthly payment : ' + monthlyPayment.toFixed(2) + ' MAD');
            }
        }

        // Attach form submit event listener
        var form = document.querySelector('.calculator-form form');
        form.addEventListener('submit', handleFormSubmit);
    });
</script>
<% } %>

</body>
</html>