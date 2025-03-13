<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cab Details</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
</head>
<body>

<%
    String error = (String) request.getAttribute("error");
    Boolean cabFound = (Boolean) request.getAttribute("cabFound");

    if (error != null) {
%>
    <p style="color: red;"><%= error %></p>
<%
    } else if (cabFound != null && cabFound) {
%>
    <div class="car-card">
        <p><%= request.getAttribute("cabId") %></p> <!-- Cab ID will show here -->
        <p class="driver-charges">&#128663; Driver charges &#8377; 400/- per day</p>
        <h2><%= request.getAttribute("carModel") %></h2>
        <p class="rating">&#9733; &#9733; &#9733; &#9733; &#9733; (5.0)</p>
        <div class="car-details">
            <span>&#10052; <%= request.getAttribute("isAC") %></span>
            <span> <%= request.getAttribute("rate") %>/KM</span>
            <span>4+1</span>
        </div>
        <p class="min-charges">Minimum 130km charges need to pay.</p>
        <div class="buttons">
           <div class="buttons">
<a href="<%= request.getContextPath() %>/View/login.jsp?cabId=<%= request.getAttribute("cabId") %>" class="book-now">Book Now</a>

            <button class="call-now">Call Now</button>
        </div>
    </div>
<%
    } else {
%>
    <p style="color: red;">No cab details found for the given ID.</p>
<%
    }
%>

</body>
</html>
