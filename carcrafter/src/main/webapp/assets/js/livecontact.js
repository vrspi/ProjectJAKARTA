<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
        console.log(response.message);

        // Assuming you have a div with class "message-item me" for the sender's message
        var senderMessageHtml = '<div class="message-item me">' +
            '<div class="message-avatar">' +
            '<img  alt="Your Avatar">' +
            '</div>' +
            '<div class="message-description">' +
            '<p>' + response.message + '</p>' +
            '</div>' +
            '</div>';

        // Append the sender's message to the message-reply section
        $(".message-reply").append(senderMessageHtml);

        // You can customize this function to update the UI based on your specific requirements
    }

});

