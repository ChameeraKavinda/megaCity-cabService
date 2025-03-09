<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Driver Registration Portal - Sign up as a driver partner">
    <title>Customer Registration Portal</title>
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
            max-width: 800px; /* Reduced from 1000px */
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .image-section {
            width: 45%; /* Reduced from 50% */
            position: relative;
        }

        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-section {
            width: 55%; /* Adjusted for balance */
            padding: 32px; /* Reduced padding */
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
            font-size: 26px; /* Slightly smaller */
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-description {
            color: var(--text-secondary);
            margin-bottom: 24px;
            font-size: 14px;
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
            padding: 10px 14px; /* Smaller input */
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
            padding: 10px; /* Smaller button */
            border-radius: 6px;
            color: var(--text-color);
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .submit-button:hover {
            background: var(--secondary-color);
            color: white;
        }

        .sign-with {
            text-align: center;
            margin: 24px 0;
            position: relative;
        }

        .sign-with::before,
        .sign-with::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 40%;
            height: 1px;
            background: var(--border-color);
        }

        .sign-with::before {
            left: 0;
        }

        .sign-with::after {
            right: 0;
        }

        .sign-with-text {
            background: white;
            padding: 0 8px;
            color: var(--text-secondary);
            font-size: 12px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 16px;
        }

        .social-icons a {
            text-decoration: none;
            font-size: 20px; /* Reduced size */
            color: var(--text-color);
            transition: all 0.3s;
        }

        .social-icons a:hover {
            color: var(--secondary-color);
            background: var(--primary-color);
            border-radius: 50%;
        }

       
        .error-message {
            display: none;
            margin-top: 12px;
            padding: 10px;
            background: #fff5f5;
            border: 1px solid #fed7d7;
            border-radius: 6px;
            color: var(--error-color);
            font-size: 14px;
        }
        .signup-link {
            text-align: center;
            margin-top: 18px;
            font-size: 13px;
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
            <img src="https://static8.depositphotos.com/1258191/1030/i/450/depositphotos_10300933-stock-photo-two-businessmen-shaking-hands.jpg">
        </div>
        <div class="form-section">
            <button class="back-button" onclick="history.back()">
                <i class="ri-arrow-left-s-line"></i>
            </button>
            
            <h2>Customer Registration</h2>
            <p class="form-description">Experience seamless rides with our professional drivers. Book your ride today!</p>
            
            <form action="customerRegister" method="post" id="registrationForm" novalidate>
                <div class="form-group">
                    <label for="name">Name*</label>
                    <input type="text" name="name" id="name" required placeholder="Enter your name" autocomplete="name">
                </div>
                
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" name="email" id="email" required placeholder="Enter your email" autocomplete="email">
                </div>
                
                <div class="form-group">
                    <label for="password">Password*</label>
                    <input type="password" name="password" id="password" required placeholder="Create a password" autocomplete="new-password">
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password*</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" required placeholder="Confirm your password">
                </div>
                
                <div class="form-group">
        			<label for="nicNumber">NIC Number*</label>
        			<input type="text" name="nicNumber" id="nicNumber" required placeholder="Enter your NIC number">
    			</div>
                
                <div class="form-group">
                    <label for="phoneNumber">Phone Number*</label>
                    <input type="tel" name="phoneNumber" id="phoneNumber" required placeholder="Enter your phone number" autocomplete="tel" pattern="[0-9]{10}">
                </div>
                
                <div class="form-group">
        			<label for="address">Address*</label>
        			<input type="text" name="address" id="address" required placeholder="Enter your address" autocomplete="street-address">
    			</div>
                
                <div class="error-message" id="errorContainer"></div>
                <button type="submit" class="submit-button">Register</button>
            </form>


            <div class="sign-with">
                <span class="sign-with-text">or sign in with</span>
            </div>

            <div class="social-icons">
                <a href="#" aria-label="Sign up with Google">
                    <i class="ri-google-line"></i>
                </a>
                <a href="#" aria-label="Sign up with Facebook">
                    <i class="ri-facebook-circle-line"></i>
                </a>
                <a href="#" aria-label="Sign up with WhatsApp">
                    <i class="ri-whatsapp-line"></i>
                </a>
            </div>

            <div class="signup-link">
                Don't have an account? <a href="<%= request.getContextPath() %>/View/login.jsp">Sign in</a>
            </div>
        </div>
    </div>

     <script>
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            let isValid = true;
            const errorContainer = document.getElementById('errorContainer');
            errorContainer.innerHTML = '';
            errorContainer.style.display = 'none';
            
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password.length < 8) {
                errorContainer.innerHTML += "Password must be at least 8 characters.<br>";
                isValid = false;
            }
            if (password !== confirmPassword) {
                errorContainer.innerHTML += "Passwords do not match.<br>";
                isValid = false;
            }
            
            const phoneNumber = document.getElementById('phoneNumber').value;
            if (!/^[0-9]{10}$/.test(phoneNumber)) {
                errorContainer.innerHTML += "Phone number must be exactly 10 digits.<br>";
                isValid = false;
            }
            
            const name = document.getElementById('name').value;
            if (!/^[A-Za-z\s]{2,}$/.test(name)) {
                errorContainer.innerHTML += "Name should contain only letters.<br>";
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                errorContainer.style.display = 'block';
            }
        });
    </script>
</body>
</html>