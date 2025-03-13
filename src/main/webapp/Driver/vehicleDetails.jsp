<%@page import="com.doa.VehicleDAO"%>
<%@page import="com.model.Vehicle"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    int driverId = Integer.parseInt(request.getParameter("driverId"));
    VehicleDAO vehicleDAO = new VehicleDAO();
    Vehicle vehicle = vehicleDAO.getVehicleByDriverId(driverId);

    if (vehicle == null) {
%>
    <h2>No vehicle details found for this driver.</h2>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .vehicle-info {
            margin-bottom: 10px;
        }
        .vehicle-image {
            display: block;
            width: 100%;
            max-width: 500px;
            margin: 20px auto;
            border-radius: 10px;
            border: 1px solid #ddd;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Vehicle Details</h2>
        <p class="vehicle-info"><strong>Vehicle Type:</strong> <%= vehicle.getVehicleType() %></p>
        <p class="vehicle-info"><strong>License Number:</strong> <%= vehicle.getLicenseNumber() %></p>
        <p class="vehicle-info"><strong>Vehicle Color:</strong> <%= vehicle.getVehicleColor() %></p>
        <p class="vehicle-info"><strong>Manufacture Year:</strong> <%= vehicle.getManufactureDate() %></p>
        <p class="vehicle-info"><strong>AC Type:</strong> <%= vehicle.getIsAC() %></p>
        <p class="vehicle-info"><strong>Passenger Type:</strong> <%= vehicle.getPassengerType() %></p>
        
        <% if (vehicle.getImagePath() != null && !vehicle.getImagePath().isEmpty()) { %>
            <img class="vehicle-image" src="<%= request.getContextPath() + "/" + vehicle.getImagePath() %>" alt="Vehicle Image">
        <% } else { %>
            <p class="vehicle-info"><strong>No image available</strong></p>
        <% } %>

<a href="<%= request.getContextPath() %>/driverDashboard.jsp?driverId=<%= request.getParameter("driverId") %>" class="back-link">Back to Dashboard</a>
        
    </div>
</body>
</html>
<% } %>
