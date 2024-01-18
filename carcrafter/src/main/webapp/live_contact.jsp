<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- live Contact" />
</jsp:include>
<div class="col-lg-6 mx-auto mt-5">
    <div class="accordion" id="accordionExample">

        <div class="accordion-item">
            <div class="user-profile-card profile-message">
                <div class="user-profile-card-header">
                    <h4 class="user-profile-card-title">Messages</h4>
                    <div class="user-profile-card-header-right">
                        <div class="header-account">
                            <div class="dropdown">
                                <div data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="assets/img/account/01.jpg" alt="">
                                </div>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="#"><i class="far fa-ban"></i> Block Chat</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="far fa-message-slash"></i> Mute Chat</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="far fa-trash-can"></i> Delete Chat</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="profile-message-wrapper">

                            <div class="message-content">
                                <div class="message-content-info" id="message-content-info">

                                </div>
                                <div class="message-reply">
                                    <textarea cols="40" rows="3" class="form-control" id="messageText" placeholder="Your Message"></textarea>
                                    <button type="submit" id="sendMessageButton" class="theme-btn"><span class="far fa-paper-plane"></span> Send Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        // Function to handle sending messages using AJAX
        function sendMessage() {
            var messageText = $("#messageText").val(); // Assuming you have a textarea with id="messageText"

            // Send AJAX request to the server
            $.ajax({
                type: "POST", // You can use "GET" or "POST" depending on your requirements
                url: "SendMessageServlet", // Update the URL to the actual servlet URL
                data: { message: messageText },
                success: function (response) {
                    console.log("Response from server:", response);
                    displayResponse(response);
                },

                error: function (error) {
                    console.error("Error:", error);
                }
            });
        }

        // Attach a click event handler to the "Send Message" button
        $("#sendMessageButton").click(function () {
            sendMessage();
        });

        // Function to display the response in the UI
        function displayResponse(response) {
            // Assuming you have a div with class "message-item me" for the sender's message
            var senderMessageHtml = '<div class="message-item me">' +
                '<div class="message-avatar">' +
                '<img src="assets/img/faq/OIP.jpeg" alt="Your Avatar">' +
                '</div>' +
                '<div class="message-description">' +
                '<p>' + response.message + '</p>' +
                '</div>' +
                '</div>';

            // Assuming you have a div with class "message-item" for the chatbot's message
            var chatbotMessageHtml = '<div class="message-item">' +
                '<div class="message-avatar">' +
                '<img src="assets/img/faq/OIP.jpeg" alt="Chatbot Avatar">' +
                '</div>' +
                '<div class="message-description">' +
                '<p>' + response.chatbotresp + '</p>' +
                '</div>' +
                '</div>';

            // Append both messages to the message-content-info section
            $(".message-content-info").append(senderMessageHtml);
            $(".message-content-info").append(chatbotMessageHtml);

            // You can customize this function to update the UI based on your specific requirements
        }


    });
</script>

<jsp:include page="template/bottom.jsp" />