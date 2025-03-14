<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    
    <title>Driver Registration Guide | MegaCity Cab Service</title>
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
            
            <div class="logo-text"> 
            <a href="#" onclick="history.back()" class="nav__logo" style="text-decoration: none;color: black;">
    			<i class="ri-arrow-left-s-line" style="margin-right: 20px;font-size: 35px;color: black;"></i>
            <i class="ri-car-fill" style="margin-right: 10px;font-size: 35px;"></i>Mega<span>City</span> Cab Service</a></div>
			
        </div>
        
 		<h1><i class="ri-user-add-line"></i> Driver Registration Guide</h1>        <p>Welcome to MegaCity Cab Service! Follow these simple steps to create your account and View booking your rides.</p>
        
        <div class="step">
            <h2><i class="ri-global-line"></i>  Step 1: Visit Our Website</h2>
            <p><b>Option:1 </b>Go to <a href="<%= request.getContextPath() %>/index.jsp">MegaCityCab.com</a> and click on the <strong>"Carrers"</strong> button located at the top  of the Navigation bar.</p>
            <p>Click  on the <strong>"Apply Now"</strong> button.</p>
           <img src="<%= request.getContextPath() %>/Driver/img/driverGuidlineApply1.jpg" alt="applybtn">
            
        </div>
        
        <div class="step">
            <h2><i class="ri-edit-box-line"></i> Step 2: Fill in Your Details</h2>
           <ul>
                <li><i class="ri-user-line"></i> <strong>Full Name:</strong> Enter your name.</li>
                <li><i class="ri-mail-line"></i> <strong>Email Address:</strong> Provide a valid email.</li>
                <li><i class="ri-lock-line"></i> <strong>Password:</strong> Create a strong password.</li>
                 <li><i class="ri-pass-pending-line"></i> <strong>Licence Number:</strong> Enter your valid Licence number.</li>
                <li><i class="ri-phone-line"></i> <strong>Phone Number:</strong> Enter your active contact number.</li>
                <li><i class="ri-user-search-line"></i><strong>Availability:</strong> Choose your Availability(<b>Availble</b> or <b>Not</b>).</li>
                
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
        			<label for="nicNumber">Licence Number*</label>
        			<input type="text" name="nicNumber" id="nicNumber" required placeholder="Enter your Licence number">
    			</div>
                
                <div class="form-group">
                    <label for="phoneNumber">Phone Number*</label>
                    <input type="tel" name="phoneNumber" id="phoneNumber" required placeholder="Enter your phone number" autocomplete="tel" pattern="[0-9]{10}">
                </div>
                
                <div class="form-group">
        			<label for="address">Availability*</label>
        			<input type="text" name="address" id="address" required placeholder="Choose Your Availability" autocomplete="street-address">
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
            <h2><i class="ri-checkbox-circle-line"></i> Step 3: Fill in your Ask Questions</h2>           
           <img src="<%= request.getContextPath() %>/Driver/img/Question.jpg" alt="question">         
        </div>
        
         <div class="step">
            <h2><i class="ri-checkbox-circle-line"></i> Step 4: Vehicle Register Option</h2>           
            <p>After clicking <b>"Next"</b>button and you can Register Your Vehicle Easily.</p>
           <img src="<%= request.getContextPath() %>/Driver/img/vehicleRegister.jpg" alt="vehicleRegister">         
        </div>
        
        
        <div class="step">
             <h2><i class="ri-login-box-line"></i> Step 5: Registered In & Start Ride</h2>
            <p>Return to the website, successfully registered, and start your first ride with MegaCity Cab Service!</p>
           	<img src="<%= request.getContextPath() %>/Driver/img/driverHome.jpg" alt="driverHome"> 
           	<br><br><p>	Clicke there <b> "View Your Ride" </b>button and Searching what are the  avialble bookings!</p>
           	        
            
        </div>
        
        
        <div class="step">
             <h2><i class="ri-login-box-line"></i> Step 6:How to Start Your Ride .</h2>
             <img src="<%= request.getContextPath() %>/Driver/img/StartRide.jpg" alt="StartRide"> 
            <br><br><p>Click the "Start Ride" button and You can start your Ride,  First you want Update Ride Status.</p>
			
        </div>
        
       
         <div class="step">
             <h2><i class="ri-refresh-line"></i> Step 7:  How To Upadte Ride Status?.</h2>
            <p>After clicking the 'Start Ride' button, when you can see a <b>  'Booking Staus' option and You can manage it.</b> '.</p>
       		<img src="<%= request.getContextPath() %>/Driver/img/UpdateStatus.jpg" alt="UpdateStatus">
		</div>
        
        <div class="step">
             <h2><i class="ri-chat-history-line"></i> Step 8:  View Ride details in 'Ride History'.</h2>
            <p>After successfully completing the your ride, you will be redirected to the home page, where you can view all the details of your ride by clicking on 'Ride History' in the Navigation bar.</p>
        	<img src="<%= request.getContextPath() %>/Driver/img/RideHistory.jpg" alt="RideHistory">
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