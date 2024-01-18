<%@ page import="java.util.List" %>
<%@ page import="com.carcrafter.model.*" %>
<%@ page import="java.util.Map" %>
<div class="col-lg-9" style="width:1000px;">
    <div class="user-profile-wrapper">
        <div class="user-profile-card profile-message">
            <div class="user-profile-card-header">
                <h4 class="user-profile-card-title">Messages</h4>
                <div class="user-profile-card-header-right">
                    <div class="header-account">
                        <div class="dropdown">
                            <div data-bs-toggle="dropdown" aria-expanded="false">
                                <%
                                // Initialize variables and set them to null
                                Integer currentUserId = null; 
                                Integer otherUserId = null;
                                List<Message> conversations = (List<Message>) request.getAttribute("conversations");
                                    Map<Integer, String> userIdToNameMap = (Map<Integer, String>) request.getAttribute("userIdToNameMap");
                                     currentUserId = (int) request.getAttribute("id"); 
                                for(Message conversation : conversations) {
                                   
                                %>
                                <img src='<%= conversation.getReceiver().getImage() != null && !conversation.getReceiver().getImage().isEmpty() ? "assets/upload/img/user/" + conversation.getReceiver().getImage() : "assets/img/account/user.png" %>' alt="">
                                <%
                                break;
                                }
                                %>
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
                        <div class="profile-message-inbox">
                            <ul class="profile-message-list">
                                <%
                              for(Message conversation : conversations) {
                                    otherUserId = (conversation.getSenderID() == currentUserId) ? conversation.getReceiverID() : conversation.getSenderID();
                                    String otherUserName = userIdToNameMap.get(otherUserId);
                                    String displayMessage = (conversation.getSenderID() == currentUserId) ? "You: " : otherUserName + ": ";
                                    String All=""+currentUserId+"-"+otherUserId;
                                    
                                    displayMessage += conversation.getContent();
                                %>
                                <li data-other-user-id="<%= otherUserId %>" onclick="load('<%= All %>')">
                                    <a href="javascript:void(0);" class="conversation-link" >
                                                <div class="message-avatar">
                                                    <img src='<%= conversation.getSender().getImage() != null && !conversation.getSender().getImage().isEmpty() ? "assets/upload/img/user/" + conversation.getSender().getImage() : "assets/img/account/user.png" %>' alt="">
                                                </div>
                                        <div class="message-by">
                                            <div class="message-by-content">
                                                <h5><%= otherUserName %></h5>
                                                <p><%= displayMessage %></p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                
                            <% } %>
                            
                            </ul>
                        </div>
                        <div class="message-content" style="padding-bottom: 200px;">
                            <div class="message-content-info">
                               
                            </div>
                            <div class="message-reply">
                                <form action="Messages" method="post">
                                    <% if(currentUserId != null) { %>
                                        <input type="hidden" name="currentUserId" value='<%= currentUserId.toString() %>'>
                                    <% } %>
                                    
                                    <% if(otherUserId != null) { %>
                                        <input type="hidden" name="otherUserId" value='<%= otherUserId.toString() %>'>
                                    <% } %>
                                    <textarea cols="40" rows="3" class="form-control" name="message"
                                        placeholder="Your Message"></textarea>
                                    <button type="submit" class="theme-btn"><span class="far fa-paper-plane"></span> Send Message</button>
                                </form>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
</div>

