<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    
    <title>Admin Login</title>
    <style>
/* Reset and base styles */
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
    background: linear-gradient(to bottom right, #f8f9fa, #e9ecef);
    padding: 20px;
}

/* Container styles */
.container {
    display: flex;
    width: 100%;
    max-width: 1000px;
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

/* Image section */
.image-section {
    width: 50%;
    position: relative;
    overflow: hidden;
}

.image-section img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.image-section img:hover {
    transform: scale(1.05);
}

/* Form section */
.form-section {
    width: 50%;
    padding: 48px;
}

/* Back button */
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

.back-button:hover {
    color: white;
}

/* Typography */
h2 {
    font-size: 32px;
    color: #333;
    margin-bottom: 8px;
    font-weight: 600;
}

p {
    color: #666;
    margin-bottom: 32px;
}

/* Form elements */
.form-group {
    margin-bottom: 24px;
}

label {
    display: block;
    color: #666;
    margin-bottom: 8px;
}

input {
    width: 100%;
    padding: 12px 16px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s;
}

input:focus {
    outline: none;
    border-color: #ffd700;
    box-shadow: 0 0 0 4px rgba(255, 215, 0, 0.1);
}

/* Links */
.forgot-password {
    display: block;
    text-align: right;
    color: #666;
    text-decoration: none;
    font-size: 14px;
    margin-bottom: 24px;
}

.forgot-password:hover {
    text-decoration: underline;
    color: hsl(220, 24%, 15%);
}

/* Buttons */
.submit-button {
    width: 100%;
    background: #ffd700;
    border: none;
    padding: 12px;
    border-radius: 8px;
    color: #333;
    font-weight: 600;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.submit-button:hover {
    background: hsl(220, 24%, 15%);;
    transform: translateY(-2px);
    color: white;
}

/* Divider */
.divider {
    text-align: center;
    margin: 32px 0;
    position: relative;
}

.divider::before,
.divider::after {
    content: '';
    position: absolute;
    top: 50%;
    width: 45%;
    height: 1px;
    background: #e0e0e0;
}

.divider::before {
    left: 0;
}

.divider::after {
    right: 0;
}

.divider-text {
    background: white;
    padding: 0 10px;
    color: #666;
    font-size: 14px;
}

/* Social icons */
.social-icons {
    display: flex;
    justify-content: center;
    gap: 16px;
    margin-top: 16px;
}

.social-icons a {
    text-decoration: none; /* Removes underline */
    font-size: 24px;
    color: #333;
    transition: color 0.3s;
}

.social-icons a:hover {
    color: hsl(220, 24%, 15%);
    background: #ffd700;
    border-radius: 50%;
}

/* Error message */
.error-message {
    margin-top: 16px;
    padding: 12px;
    background: #fff5f5;
    border: 1px solid #fed7d7;
    border-radius: 8px;
    color: #e53e3e;
}

/* Sign up link */
.signup-link {
    text-align: center;
    margin-top: 24px;
    color: #666;
    font-size: 14px;
}

.signup-link a {
    color: hsl(220, 24%, 15%);
    text-decoration: none;
}

.signup-link a:hover {
    text-decoration: underline;
}

/* Responsive design */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }

    .image-section {
        width: 100%;
        height: 200px;
    }

    .form-section {
        width: 100%;
        padding: 32px 24px;
    }
}


    </style>
</head>
<body>
    <div class="container">
        <div class="image-section">
            <img src="https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg" alt="Admin Login">
        </div>
        <div class="form-section">
             <button class="back-button" onclick="history.back()">
            <i class="ri-arrow-left-s-line"></i>
        </button>
            <h2>Admin Login</h2>
            
            <form action="../AdminLoginServlet" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>

                <a href="#" class="forgot-password">Forgot Password?</a>

                <button type="submit" class="submit-button">
                     Sign In With Email
                </button>
            </form>

            <div class="divider">
                <span class="divider-text">or sign in with</span>
            </div>
<div class="social-icons">
                    <a href="#" class="icon"><i class="ri-google-line"></i></a>
                    <a href="#" class="icon"><i class="ri-facebook-circle-line"></i></a>
                    <a href="#" class="icon"><i class="ri-whatsapp-line"></i></a>
                </div>
<% if (request.getAttribute("errorMessage") != null) { %>
    <div class="error-message">
        <i class="fa fa-exclamation-circle"></i> 
        <%= request.getAttribute("errorMessage") %>
    </div>
<% } %>


            
             <div class="signup-link">
               If you have any problems, call us. <a href="callTo:">077-456#6785</a>
            </div>
        </div>
    </div>
</body>
</html>