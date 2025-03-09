<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Driver Registration Portal - Sign up as a driver partner">
    <title>Admin Registration</title>
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
            padding: 1.25rem;
            line-height: 1.5;
        }

        .container {
            display: flex;
            width: 100%;
            max-width: 800px; /* Reduced size */
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .image-section {
            width: 40%; /* Reduced size */
            position: relative;
        }

        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-section {
            width: 60%; /* Increased size */
            padding: 32px; /* Reduced padding */
        }

        .back-button {
            color: white;
            background: var(--secondary-color);
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 20px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        h2 {
            font-size: 28px; /* Reduced font size */
            color: var(--text-color);
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-description {
            color: var(--text-secondary);
            margin-bottom: 24px;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            color: var(--text-secondary);
            margin-bottom: 6px;
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
            transform: translateY(-2px);
            color: white;
        }

        .divider {
            text-align: center;
            margin: 24px 0;
            position: relative;
        }

        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background: var(--border-color);
        }

        .divider-text {
            background: white;
            padding: 0 8px;
            color: var(--text-secondary);
            font-size: 12px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 14px;
            margin-top: 16px;
        }

        .social-icons a {
            text-decoration: none;
            font-size: 22px;
            color: var(--text-color);
            transition: all 0.3s;
        }

        .social-icons a:hover {
            color: var(--secondary-color);
            background: var(--primary-color);
            border-radius: 50%;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
            color: var(--text-secondary);
            font-size: 12px;
        }

        .signup-link a {
            color: var(--secondary-color);
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
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
            
            <h2>Admin Registration</h2>
            <p class="form-description">Register to manage your platform efficiently.</p>
            
            <form action="adminRegister" method="post" id="registrationForm">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" required placeholder="Enter your full name">
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required placeholder="Enter your email">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required placeholder="Create a password">
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" name="phoneNumber" id="phoneNumber" required placeholder="Enter your phone number">
                </div>

                <label>Role:</label>
                <select name="role" id="role" required>
                    <option value="">Select Your Role</option>
                    <option value="Admin">Admin</option>
                    <option value="Staff">Staff</option>
                </select>
<br><br>
                <button type="submit" class="submit-button">
                    Register
                </button>
            </form>

            <div class="signup-link">
                Already have an account? <a href="<%= request.getContextPath() %>/Admin/adminLogin.jsp">Sign in</a>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            if (password.length < 8) {
                e.preventDefault();
                alert("Password must be at least 8 characters long");
            }
        });
    </script>
</body>
</html>
