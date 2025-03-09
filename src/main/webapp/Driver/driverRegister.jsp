<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driver Register</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">

<link rel="stylesheet" href="CSS/regDriver.css">
<style>
@charset "UTF-8";
@charset "UTF-8";
 
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .signup-container {
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

        .divider {
            text-align: center;
            margin: 20px 0;
            color: #666;
            font-size: 14px;
        }

        .signin-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .signin-link a {
            color: #006D5B;
            text-decoration: none;
            font-weight: bold;
        }

        .signin-link a:hover {
            text-decoration: underline;
        }
        .social-icons {
    display: flex;
    justify-content: center;
    gap: 16px;
    margin-top: 16px;
}

.social-icons a {
    text-decoration: none; 
    font-size: 24px;
    color: #333;
    transition: color 0.3s;
}

.social-icons a:hover {
    color: hsl(220, 24%, 15%);
    background: #ffd700;
    border-radius: 90%;
}
  </style>


<body>
<div class="signup-container">
        <button class="back-button" onclick="window.location.href='<%= request.getContextPath() %>/intro.jsp'">
            <i class="ri-arrow-left-s-line"></i>
        </button>
        <h1>Signup to drive with Mega City Cab</h1>
        <form action="driverRegister" method="POST">
            <input type="hidden" name="driverId" value="">
    
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter Your Full Name" required>
            </div>
    
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
            </div>
    
            <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter Your Password" required>
    </div> 
    
           
    
            <div class="form-group">
                <label for="nic">Licence Number</label>
                <input type="text" id="nic" name="nic" placeholder="Licence Number" required>
            </div>
    
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" required>
            </div>
    
           
    
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">Select an option</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
    
            <button type="submit" class="primary-button">Sign Up With Email</button>
        </form>
    
        <div class="divider">or sign up with</div>
        <div class="social-icons">
                    <a href="#" class="icon"><i class="ri-google-line"></i></a>
                    <a href="#" class="icon"><i class="ri-facebook-circle-line"></i></a>
                    <a href="#" class="icon"><i class="ri-whatsapp-line"></i></a>
                </div>
        <div class="signin-link">
            Already have an account? <a href="driverLogin.jsp">Sign In</a>

        </div>
    </div>
</body>
</html>