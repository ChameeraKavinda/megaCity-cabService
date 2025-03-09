<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    
    <title>Customer Registration Guide | MegaCity Cab Service</title>
    <style>
        /* Base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f5f5f5;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid hsl(220, 24%, 15%);
        }
        
        p {
            margin-bottom: 25px;
            font-size: 16px;
        }
        
        .step {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-left: 4px solid hsl(220, 20%, 18%);;
            border-radius: 4px;
        }
        
        h2 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 20px;
        }
        
        ul {
            padding-left: 20px;
            margin-bottom: 15px;
        }
        
        li {
            margin-bottom: 10px;
        }
        
        a {
            color: #3498db;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        strong {
            color: #2c3e50;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #eee;
            color: #666;
        }
        
        /* Step indicators */
        .step h2::before {
            content: "";
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-right: 10px;
            background-color: hsl(220, 20%, 18%);;
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 30px;
            font-size: 16px;
        }
        .step img {
    max-width: 100%;
    height: auto;
    border-radius: 6px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
}
        
        .step:nth-child(3) h2::before {
            content: "1";
        }
        
        .step:nth-child(4) h2::before {
            content: "1";
        }
        
        .step:nth-child(5) h2::before {
            content: "2";
        }
        
        .step:nth-child(6) h2::before {
            content: "3";
        }
        
        .step:nth-child(7) h2::before {
            content: "4";
        }
         .step:nth-child(8) h2::before {
            content: "5";
        }
         .step:nth-child(9) h2::before {
            content: "6";
        }
         .step:nth-child(10) h2::before {
            content: "7";
        }
         .step:nth-child(11) h2::before {
            content: "8";
        }
         .step:nth-child(12) h2::before {
            content: "9";
        }
        
        /* Header logo */
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .logo-text span {
            color: hsl(220, 40%, 78%);;
        }
        
        /* Additional information */
        .info-box {
            background-color: #ebf5fb;
            border: 1px solid #d4e6f1;
            padding: 15px;
            margin: 30px 0;
            border-radius: 4px;
        }
        
        .info-title {
            font-weight: bold;
            margin-bottom: 10px;
            color: #2980b9;
        }
                .form-section {
            width: 55%; /* Adjusted for balance */
            padding: 32px; 
           margin-left: 40px;
                       border: 4px solid hsl(220, 20%, 18%);;
           
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
            background: hsl(220, 20%, 18%);;
            border: none;
            padding: 10px; /* Smaller button */
            border-radius: 6px;
            color: white;
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
            background:orange;
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
            
        }

        .sign-with::before {
            left: 0;
        }

        .sign-with::after {
            right: 0;
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
        /* Responsive design */
        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }
            
            .step {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <div class="logo-text"> <i class="ri-car-fill" style="margin-right: 10px;font-size: 35px;"></i>Mega<span>City</span> Cab Service</div>
        </div>
        
 		<h1><i class="ri-user-add-line"></i> Customer Registration Guide</h1>        <p>Welcome to MegaCity Cab Service! Follow these simple steps to create your account and start booking your rides.</p>
        
        <div class="step">
            <h2><i class="ri-global-line"></i>  Step 1: Visit Our Website</h2>
            <p><b>Option:1 </b>b>Go to <a href="<%= request.getContextPath() %>/intro.jsp">MegaCityCab.com</a> and click on the <strong>"User"</strong> button located at the top right corner of the Navigation bar.</p>
            <p>Click it and Choose Register button and click on the <strong>"Register"</strong> button located at the drop menuu of the User .</p>
            <img src="<%= request.getContextPath() %>/View/img/Register.jpg" alt="Register">
            
           <br> <br><br><p><b>Option:2 </b>b>Go to <a href="#">MegaCityCab.com</a> and click on the <strong>"Book Your Ride  Now"</strong> button.</p>
           <img src="<%= request.getContextPath() %>/View/img/Register2.jpg" alt="Register2">
            
        </div>
        
        <div class="step">
            <h2><i class="ri-edit-box-line"></i> Step 2: Fill in Your Details</h2>
           <ul>
                <li><i class="ri-user-line"></i> <strong>Full Name:</strong> Enter your name.</li>
                <li><i class="ri-mail-line"></i> <strong>Email Address:</strong> Provide a valid email.</li>
                <li><i class="ri-lock-line"></i> <strong>Password:</strong> Create a strong password.</li>
                <li><i class="ri-lock-password-line"></i> <strong>Password:</strong> Confirm a password.</li>
                <li><i class="ri-id-card-line"></i> <strong>NIC Number:</strong> Enter your valid NIC number.</li>
                <li><i class="ri-phone-line"></i> <strong>Phone Number:</strong> Enter your active contact number.</li>
                <li><i class="ri-home-4-line"></i> <strong>Adress:</strong> Enter your home address.</li>
                
            </ul>
            
           <div class="form-section">
      
            
            <form  id="registrationForm" novalidate>
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
                Don't have an account? Sign in
            </div>
        </div>
    </div>

            
       
        
        <div class="step">
            <h2><i class="ri-checkbox-circle-line"></i> Step 3: Click the Register button and Move Login page</h2>
            <p>Once verified, return to the website, log in with your email and password, and you're ready to book your first ride with MegaCity Cab Service!</p>
             <div class="form-section">
      
            
            <form  id="registrationForm" novalidate>
                
                
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" name="email" id="email" required placeholder="Enter your email" autocomplete="email">
                </div>
                
                <div class="form-group">
                    <label for="password">Password*</label>
                    <input type="password" name="password" id="password" required placeholder="Create a password" autocomplete="new-password">
                </div>

             
                <button type="submit" class="submit-button">Login</button>
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
               Don't have an account? Sign Up
            </div>
        </div>
        </div>
        
        
        <div class="step">
             <h2><i class="ri-login-box-line"></i> Step 4: Log In & Start Booking</h2>
            <p>Return to the website, log in with your email and password, and book your first ride with MegaCity Cab Service!</p>
        </div>
        
        
        <div class="step">
             <h2><i class="ri-login-box-line"></i> Step 5: Click the Book  button.</h2>
            <p>Click the "Book Management" button and You can see a drop menu, Clicked <b>"Book"</b> button or Clicked <b>"Book a ride Now"</b> ,  you will be taken to the "You can choose a vehicle" page.!</p>
			<p><b>Option 01</b></p><img src="<%= request.getContextPath() %>/View/img/Booking.jpg" alt="Booking"><br><br>
           <p><b>Option 02</b></p><img src="<%= request.getContextPath() %>/View/img/Register2.jpg" alt="Register2">
        </div>
        
        <div class="step">
             <h2><i class="ri-login-box-line"></i> Step 6: Click the Book Now button.</h2>
            <p>After booking a vehicle of your choice and clicking on the "Book Now" button, you will be taken to the "Booking Location" page.</p>
        	<img src="<%= request.getContextPath() %>/View/img/BookNow.jpg" alt="BookNow">
        
        </div>
        
         <div class="step">
             <h2><i class="ri-map-pin-line"></i> Step 7:  Access the 'Booking Location' page.</h2>
            <p>After accessing the 'Booking Location' page, when data is entered in <b>'Booking Date'</b> <b>'Pickup Location'</b>and<b>  'Drop Location'</b> the Destination, Tax Fee, Discount Fee, and Price are calculated, and the 'Total Price' is displayed to the user. The booking can then be successfully made by clicking on 'Confirm Booking'.</p>
       		<img src="<%= request.getContextPath() %>/View/img/BookingConfirm.jpg" alt="BookingConfirm">
		</div>
        
        <div class="step">
             <h2><i class="ri-chat-history-line"></i> Step 8:  View booking details in 'Book History'.</h2>
            <p>After successfully completing the booking, you will be redirected to the home page, where you can view all the details of your booking by clicking on 'Book History' in the dropdown menu under 'Booking Management'..</p>
        	<img src="<%= request.getContextPath() %>/View/img/BookingHistory.jpg" alt="BookingHistory">
        </div>
        
        
        
       <div class="info-box">
    	<div class="info-title">Need to visit our website?</div>
    	<p>For the best experience, access our services through our website:</p>
    	<ul>
        <li>Visit our website for seamless booking and account management</li>
        <li>Use the same login credentials across both platforms</li>
        <li>Enjoy exclusive features and promotions through the website</li>
   		</ul>
		</div>

        
        <p class="footer">If you need assistance, contact our support team at <strong><a href="mailto:megacitycabservice@gmail.com">Email: megacitycabservice@gmail.com</a></strong> or call <strong><a href="callTo:94705220990 "><br>Hot Line:  07052209##</a></strong>.<br> Thank you for choosing <strong>MegaCity Cab Service</strong>!</p>
    </div>
</body>
</html>