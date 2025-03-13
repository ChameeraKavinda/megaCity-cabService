<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
      <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f7f7f7;
            position: relative;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 350px;
            position: relative;
        }
        .back-button {
            position: absolute;
            top: 15px;
            left: 15px;
            font-size: 20px;
            cursor: pointer;
        }
        h2 {
            margin-bottom: 10px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .password-wrapper {
            position: relative;
        }
        .password-wrapper i {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        .social-icons a {
            margin: 5px;
            padding: 10px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
        }
        .social-icons i {
            font-size: 20px;
        }
        .register-link {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <i class="ri-arrow-left-wide-line"onclick="goBack()"> </i>
        <i class="ri-arrow-left-wide-line"></i>
        <h2>Welcome back! Glad to see you, Again!</h2>
        <input type="email" placeholder="Enter your email">
        <div class="password-wrapper">
            <input type="password" id="password" placeholder="Enter your password">
            <i class="fa fa-eye" id="togglePassword"></i>
        </div>
        <p><a href="#">Forgot Password?</a></p>
        <button class="login-btn">Login</button>
        <p>Or Login with</p>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-google"></i></a>
            <a href="#"><i class="fab fa-apple"></i></a>
        </div>
        <p class="register-link">Don't have an account? <a href="#">Register Now</a></p>
    </div>
    <script>
        document.getElementById("togglePassword").addEventListener("click", function() {
            let passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                this.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passwordField.type = "password";
                this.classList.replace("fa-eye-slash", "fa-eye");
            }
        });
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>