<%@page import="com.doa.AdminDOA"%>
<%@page import="com.model.Admin"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Retrieve customer ID from request
    String AdminId = request.getParameter("adminId");
    Admin admin = null;
    
    if (AdminId != null && !AdminId.isEmpty()) {
        try {
            int adminId = Integer.parseInt(AdminId);
            AdminDOA adminDOA = new AdminDOA();
            admin = adminDOA.getAdminrById(adminId);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Admin ID</p>");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Update Admin Details - Manage Admin Information">
    <title>Update Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ffd700;
            --secondary-color: hsl(220, 24%, 15%);
            --background-gradient: linear-gradient(to bottom right, #f8f9fa, #e9ecef);
            --text-color: #333;
            --text-secondary: #666;
            --border-color: #e0e0e0;
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
            padding: 1.25rem;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 800px;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .image-section {
            width: 40%;
            position: relative;
        }

        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-section {
            width: 60%;
            padding: 32px;
        }

        .back-button {
            color: white;
            background: var(--secondary-color);
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: var(--text-secondary);
        }

        input, select {
            width: 100%;
            padding: 10px 14px;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(255, 215, 0, 0.1);
        }

        .submit-button {
            width: 100%;
            background: var(--primary-color);
            border: none;
            padding: 10px;
            border-radius: 8px;
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
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                max-width: 400px;
            }

            .image-section {
                width: 100%;
                height: 180px;
            }

            .form-section {
                width: 100%;
                padding: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section">
            <img src="https://5.imimg.com/data5/SELLER/Default/2023/3/294997220/ZX/OC/BE/3365461/acrylic-admin-office-door-sign-board.jpg">
        </div>
        <div class="form-section">
            <button class="back-button" onclick="history.back()">
                <i class="ri-arrow-left-s-line"></i>
            </button>
            <h2>Update Admin Details</h2>
            <% if (admin != null) { %>
            <form action="UpdateAdmin" method="POST">
                <input type="hidden" name="adminId" value="<%= admin.getAdminId() %>">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" value="<%= admin.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" value="<%= admin.getEmail() %>" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" value="<%= admin.getPassword() %>" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" name="phoneNumber" value="<%= admin.getPhoneNumber() %>" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select name="role" required>
                        <option value="">Select Your Role</option>
                        <option value="Admin" <%= admin.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                        <option value="Staff" <%= admin.getRole().equals("Staff") ? "selected" : "" %>>Staff</option>
                    </select>
                </div>
                <button type="submit" class="submit-button">Update</button>
            </form>
            <% } else { %>
                <p style="color: red;">Admin not found! Please check the Admin ID.</p>
            <% } %>
        </div>
    </div>
</body>
</html>