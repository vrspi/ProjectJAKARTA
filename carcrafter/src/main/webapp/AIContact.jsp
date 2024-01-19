<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="template/top.jsp">
    <jsp:param name="title" value="- live Contact" />
</jsp:include>
<div class="col-lg-6 mx-auto mt-5">
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <div class="user-profile-card profile-message">
                <div class="user-profile-card-header">
                    <h4 class="user-profile-card-title">FAQ Chat</h4>
                    <div class="user-profile-card-header-right">
                        <div class="header-account">
                            <div class="dropdown">
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
            var messageText = $("#messageText").val(); // Get the user's message

            $.ajax({
                type: "POST",
                url: "Ai",
                data: { message: messageText },
                dataType: "json",  // Expecting JSON response
                success: function (response) {
                    console.log("Full response from server:", response); // Log the full response
                    displayResponse(messageText, response.chatbotresp);
                },
                error: function (error) {
                    console.error("Error:", error);
                }
            });
        }


        $("#sendMessageButton").click(function () {
            sendMessage();
        });

        $("#messageText").keypress(function (event) {
            if (event.which === 13) {
                event.preventDefault();

                sendMessage();
            }
        });

        function displayResponse(userMessage, chatbotResponse) {
            var senderMessageHtml = "<div class='message-item me'>"
                + "<div class='message-description'>"
                + "<p>" + userMessage + "</p>"
                + "</div>"
                + "</div>";

            var chatbotMessageHtml = "<div class='message-item'>"
                + "<div class='message-description'>"
                + "<p>" + chatbotResponse.trim() + "</p>"  // Added .trim() to remove any leading/trailing newlines or spaces
                + "</div>"
                + "</div>";

            $(".message-content-info").append(senderMessageHtml);
            if (chatbotResponse) {
                $(".message-content-info").append(chatbotMessageHtml);
            } else {
                console.error("Chatbot response is undefined.");
            }

            // Scroll to the bottom of the messages to show the latest
            var messagesContainer = $(".message-content-info");
            messagesContainer.scrollTop(messagesContainer.prop("scrollHeight"));
            // Clear the message input
            $("#messageText").val('');
        }
    });
</script>

<jsp:include page="template/bottom.jsp" />