<%@page import="com.doa.DriverDOA"%>
<%@page import="com.model.Driver"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Retrieve driver ID from request
    String driverIdParam = request.getParameter("driverId");
    Driver driver = null;
    
    if (driverIdParam != null && !driverIdParam.isEmpty()) {
        try {
            int driverId = Integer.parseInt(driverIdParam);
            DriverDOA driverDOA = new DriverDOA();
            driver = driverDOA.getDriverById(driverId);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Driver ID</p>");
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
    <div class="update-container">
            <button class="back-button" onclick="history.back()">
            <i class="ri-arrow-left-s-line"></i>
        </button>
        <h1>Update Driver Details</h1>

        <% if (driver != null) { %>
            <form action="UpdateDriver" method="POST">
                <input type="hidden" name="driverId" value="<%= driver.getDriverId() %>">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%= driver.getName() %>" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%= driver.getEmail() %>" required>
                </div>

                <div class="form-group">
                    <input type="hidden" id="password" name="password" value="<%= driver.getPassword() %>" required>
                </div>

                <div class="form-group">
                    <label for="nic">NIC Number</label>
                    <input type="text" id="nic" name="nic" value="<%= driver.getNic() %>" required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= driver.getPhoneNumber() %>" required>
                </div>

                <div class="form-group">
                    <label for="availability">Avilability</label>
                    <select id="availability" name="availability" required>
                        <option value="">Select an option</option>
                        <option value="Available" <%= driver.getAvailability().equals("Available") ? "selected" : "" %>>Available</option>
                        <option value="NotAvailable" <%= driver.getAvailability().equals("NotAvailable") ? "selected" : "" %>>Not Available</option>
                    </select>
                </div>

                <button type="submit" class="primary-button">Update</button>
            </form>
        <% } else { %>
            <p style="color: red; text-align: center;">Driver not found! Please check the Driver ID.</p>
        <% } %>
    </div>
</body>
</html>