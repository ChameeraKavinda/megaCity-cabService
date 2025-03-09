<%@page import="com.doa.BookingDAO"%>
<%@page import="com.model.Booking"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    
    String bookingIdParam = request.getParameter("bookingId");
    Booking booking = null;
    
    if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
        try {
            int bookingId = Integer.parseInt(bookingIdParam);
            BookingDAO bookingDAO = new BookingDAO();
            booking = bookingDAO.getBookingById(bookingId);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Booking ID</p>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Driver</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/regDriver.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .update-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .back-button {
            color: white;
            background: hsl(220, 24%, 15%);
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 20px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
            font-size: 14px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #006D5B;
        }

        .primary-button {
            width: 100%;
            padding: 12px;
            background: hsl(220, 24%, 15%);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s;
        }

        .primary-button:hover {
            background: #005a4b;
        }
    </style>
</head>
<body>
 <%
        String customerId = request.getParameter("customerId");
        String driverId = request.getParameter("driverId");
        String vehicleId = request.getParameter("vehicleId");
    %>

    <div class="update-container">
            <button class="back-button" onclick="history.back()">
            <i class="ri-arrow-left-s-line"></i>
        </button>
        <h1>Update Booking Details</h1>

        <% if (booking != null) { %>
            <form action="updateBooking" method="POST">
                                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
            
          <label for="bookingDate">Booking Date:</label>
        <input type="date" id="bookingDate" name="bookingDate" readonly required value="<%= booking.getBookingDate() %>"><br><br>

        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" readonly  required value="<%= booking.getPickupLocation() %>"><br><br>

        <label for="dropLocation">Drop Location:</label>
        <input type="text" id="dropLocation" name="dropLocation" readonly  required  value="<%= booking.getDropLocation() %>"><br><br>

        <label for="distance">Distance:</label>
        <input type="text" id="distance" name="distance" readonly required value="<%= booking.getDistance() %>"><br><br>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" readonly required value="<%= booking.getPrice() %>"><br><br>
        
        <label for="tax">Tax:</label>
        <input type="text" id="tax" name="tax" readonly required value="<%= booking.getTax() %>"><br><br>
        
        <label for="discount">Discount:</label>
        <input type="text" id="discount" name="discount" readonly required value="<%= booking.getDiscount() %>"><br><br>
        
        <label for="totalPrice">Total Price:</label>
        <input type="text" id="totalPrice" name="totalPrice" readonly required value="<%= booking.getTotalPrice() %>"><br><br>

 <label for="bookingStatus">Booking Status:</label>
<select id="bookingStatus" name="bookingStatus" required>
    <option value="Booked" <%= "Booked".equals(booking.getBookingStatus()) ? "selected" : "" %>>Booked</option>
    <option value="Confirmed" <%= "Confirmed".equals(booking.getBookingStatus()) ? "selected" : "" %>>Confirmed</option>
    <option value="Pending" <%= "Pending".equals(booking.getBookingStatus()) ? "selected" : "" %>>Pending</option>
    <option value="Canceled" <%= "Canceled".equals(booking.getBookingStatus()) ? "selected" : "" %>>Canceled</option>
    <option value="Complete" <%= "Complete".equals(booking.getBookingStatus()) ? "selected" : "" %>>Complete</option>
</select>

<br><br>


        <input type="hidden" id="customerId" name="customerId" value="<%= booking.getCustomerId() %>"><br><br>

        <input type="hidden" id="driverId" name="driverId" value="<%=  booking.getDriverId() %>"><br><br>

        <input type="hidden" id="vehicleId" name="vehicleId" value="<%= booking.getVehicleId() %>"><br><br>

                <button type="submit" class="primary-button">Update</button>
            </form>
        <% } else { %>
            <p style="color: red; text-align: center;">Booking not found! Please check the Booking ID.</p>
        <% } %>
    </div>
</body>
</html>