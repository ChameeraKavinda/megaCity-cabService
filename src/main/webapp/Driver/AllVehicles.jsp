<%@page import="com.doa.VehicleDAO"%>
<%@page import="com.model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    VehicleDAO vehicleDAO = new VehicleDAO();
    List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Drivers' Vehicle Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .vehicle-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
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
        <h2>All Drivers' Vehicle Details</h2>

        <% 
            String[] passengerTypes = {"Flex", "Mini", "Car", "Van"};
            for (String type : passengerTypes) {
        %>
        <h3><%= type %> Vehicles</h3>
        <table>
            <tr>
                <th>Driver ID</th>
                <th>Vehicle Type</th>
                <th>Vehicle Number</th>
                <th>Vehicle Color</th>
                <th>Manufacture Year</th>
                <th>AC Type</th>
                <th>Passenger Type</th>
                <th>Vehicle Image</th>
            </tr>
            <% 
                for (Vehicle vehicle : vehicleList) { 
                    if (vehicle.getPassengerType().equals(type)) {
            %>
                <tr>
                    <td><%= vehicle.getDriverId() %></td>
                    <td><%= vehicle.getVehicleType() %></td>
                    <td><%= vehicle.getLicenseNumber() %></td>
                    <td><%= vehicle.getVehicleColor() %></td>
                    <td><%= vehicle.getManufactureDate() %></td>
                    <td><%= vehicle.getIsAC() %></td>
                    <td><%= vehicle.getPassengerType() %></td>
                    <td>
                        <% if (vehicle.getImagePath() != null && !vehicle.getImagePath().isEmpty()) { %>
                            <img class="vehicle-image" src="<%= request.getContextPath() + "/" + vehicle.getImagePath() %>" alt="Vehicle Image">
                        <% } else { %>
                            No Image
                        <% } %>
                    </td>
                </tr>
            <% 
                    }
                } 
            %>
        </table>
        <% } %>

<span class="back-link" style="cursor: pointer; color: blue;" onclick="history.back()">Back to Dashboard</span>
    </div>
</body>
</html>
