

document.addEventListener('DOMContentLoaded', function() {
  var conversationLinks = document.querySelectorAll('.conversation-link');
  conversationLinks.forEach(function(link) {
      link.addEventListener('click', function() {
          var otherUserId = this.parentElement.getAttribute('data-other-user-id');
          loadConversationMessages(otherUserId);
      });
  });
});
function load(element) {
    console.log("Function load called with element: ", element);

    var splitArray = element.split("-"); 
    var secondElement = splitArray[1]; 

    var otherUserId = secondElement;
    console.log("Other Users ID: ", otherUserId);

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var messages = JSON.parse(this.responseText);
            console.log(messages);

            updateMessageDiv(messages,splitArray[0]);
        }
    };
    xhttp.open("GET", "FetchMessages?otherUserId=" + otherUserId + "&CurrentUserId="+ splitArray[0], true);
    xhttp.send();

}
// function loadConversationMessages(otherUserId) {
//   alert("Here");
//   // The rest of your AJAX call remains the same
//   var xhttp = new XMLHttpRequest();
//   xhttp.onreadystatechange = function() {
//       if (this.readyState == 4 && this.status == 200) {
//           var messages = JSON.parse(this.responseText);
//           updateMessageDiv(messages);
//       }
//   };
//   xhttp.open("GET", "/ConversationController?otherUserId=" + otherUserId, true);
//   xhttp.send();
// }


function updateMessageDiv(messages,currentUserId) {
  var messageContentDiv = document.querySelector('.message-content-info');
  messageContentDiv.innerHTML = ''; // Clear existing messages
    console.log(currentUserId);
  messages.forEach(function(message) {
    
      var messageItemDiv = document.createElement('div');
      messageItemDiv.className = message.senderId ===  currentUserId? 'message-item me' : 'message-item';
      
      var avatarDiv = document.createElement('div');
      avatarDiv.className = 'message-avatar';
      avatarDiv.innerHTML = '<img src="path_to_avatar_image" alt="">';

      var descriptionDiv = document.createElement('div');
      descriptionDiv.className = 'message-description';
      descriptionDiv.innerHTML = '<p>' + message.content + '</p>';

      messageItemDiv.appendChild(avatarDiv);
      messageItemDiv.appendChild(descriptionDiv);

      messageContentDiv.appendChild(messageItemDiv);
  });
}
