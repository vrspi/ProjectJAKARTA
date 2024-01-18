<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Car Crafter Response</title>
</head>
<body>
<h2>Response from Car Crafter</h2>
<%
    // Get the API response from the request attribute
    String apiResponse = (String) request.getAttribute("apiResponse");
    if(apiResponse != null) {
%>
        <p> <%= apiResponse %> </p>
<%
    } else {
%>
        <p>No response received</p>
<%
    }
%>
</body>
</html>