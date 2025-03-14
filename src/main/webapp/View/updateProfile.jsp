<%@page import="com.doa.CustomerDOA"%>
<%@page import="com.model.Customer"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Retrieve customer ID from request
    String customerIdParam = request.getParameter("customerId");
    Customer customer = null;
    
    if (customerIdParam != null && !customerIdParam.isEmpty()) {
        try {
            int customerId = Integer.parseInt(customerIdParam);
            CustomerDOA customerDOA = new CustomerDOA();
            customer = customerDOA.getCustomerById(customerId);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Customer ID</p>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ffd700;
            --secondary-color: hsl(220, 24%, 15%);
            --background-gradient: linear-gradient(to bottom right, #f8f9fa, #e9ecef);
            --text-color: #333;
            --text-secondary: #666;
            --border-color: #e0e0e0;
            --error-color: #e53e3e;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--background-gradient);
            color: var(--text-color);
            padding: 1rem;
            line-height: 1.5;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 800px;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            width: 100%;
            padding: 32px;
        }

        .back-button {
            color: white;
            background: var(--secondary-color);
            border: none;
            padding: 6px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 15px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        h2 {
            font-size: 26px;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            color: var(--text-secondary);
            margin-bottom: 6px;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 10px 14px;
            border: 2px solid var(--border-color);
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }

        input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(255, 215, 0, 0.1);
        }

        .submit-button {
            width: 100%;
            background: var(--primary-color);
            border: none;
            padding: 10px;
            border-radius: 6px;
            color: var(--text-color);
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .submit-button:hover {
            background: var(--secondary-color);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-section">
            <button class="back-button" onclick="history.back()">
                <i class="ri-arrow-left-s-line"></i>
            </button>
            <h2>Update Customer Details</h2>
            <% if (customer != null) { %>
                <form action="customerProfile" method="POST">
                    <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" value="<%= customer.getName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" value="<%= customer.getEmail() %>" required>
                    </div>
                    <div class="form-group">
                     
                        <input type="hidden" name="password" value="<%= customer.getPassword() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="nicNumber">NIC Number</label>
                        <input type="text" name="nicNumber" value="<%= customer.getNicNumber() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" name="phoneNumber" value="<%= customer.getPhoneNumber() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" value="<%= customer.getAddress() %>" required>
                    </div>
                    <button type="submit" class="submit-button">Update</button>
                </form>
            <% } else { %>
                <p style="color: red;">Customer not found! Please check the Customer ID.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
