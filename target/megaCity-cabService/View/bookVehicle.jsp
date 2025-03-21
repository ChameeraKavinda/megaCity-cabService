<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.doa.DBConnectionFactory"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book a Vehicle</title>
    <style>
        .car-list { padding: 20px; background-color: #f8f9fa; }
        .category-title { font-size: 22px; font-weight: bold; margin-bottom: 10px; }
        .car-category { margin-bottom: 30px; }
        .car-card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 280px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease-in-out;
            display: inline-block;
            margin: 10px;
        }
        .car-card:hover { transform: translateY(-5px); }
        .car-image {
            width: 100%; height: 180px; object-fit: cover; border-radius: 8px;
        }
        .book-now {
            background: #ff6600; color: #fff; padding: 10px 15px;
            border-radius: 5px; font-size: 14px; text-decoration: none;
            font-weight: 600; transition: background 0.3s ease-in-out; display: block;
        }
        .book-now:hover { background: #e55a00; }
    </style>
</head>
<body>

<h2 style="text-align: center;">Choose Your Vehicle</h2>

<div class="car-list">
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String[] categories = {"Flex", "Mini", "Car", "Van"};

        try {
            conn = DBConnectionFactory.getConnection();
            for (String category : categories) {
                stmt = conn.prepareStatement("SELECT * FROM vehicle WHERE passenger_type = ?");
                stmt.setString(1, category);
                rs = stmt.executeQuery();
    %>

    <div class="car-category">
        <h3 class="category-title"><%= category %> Vehicles</h3>
        <%
            boolean hasVehicles = false;
            while (rs.next()) {
                hasVehicles = true;
        %>
        <div class="car-card">
            <% if (rs.getString("image_path") != null && !rs.getString("image_path").isEmpty()) { %>
                <img class="car-image" src="<%= request.getContextPath() + "/" + rs.getString("image_path") %>" alt="Vehicle Image">
            <% } else { %>
                <p>No Image Available</p>
            <% } %>

            <p>Color: <%= rs.getString("vehicle_color") %></p>
            <h2><%= rs.getString("vehicle_type") %></h2>
            <p>Manufacture Date: <%= rs.getString("manufacture_date") %></p>
            <p>AC: <%= rs.getString("isAC").equalsIgnoreCase("AC") ? "AC" : "NonAC" %></p>

<%
    // Retrieve customerId from session (assuming user is logged in)
    Integer customerId = (Integer) session.getAttribute("customerId");
%>

<a href="<%= request.getContextPath() %>/Booking/addBooking.jsp?vehicleId=<%= rs.getInt("id") %>&driverId=<%= rs.getInt("driverId") %>&customerId=<%= customerId %>&passengerType=<%= category %>" class="book-now">Book Now</a>
        </div>
        <%
            }
            if (!hasVehicles) {
                out.println("<p>No vehicles available in this category.</p>");
            }
        %>
    </div>

    <%
            rs.close();
            stmt.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (conn != null) conn.close();
    }
    %>
</div>

</body>
</html>
