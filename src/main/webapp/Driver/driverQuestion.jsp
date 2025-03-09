<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Driver Questions</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #f39c12;
            --text-color: #333;
            --background-color: #f8f9fa;
            --border-color: #ddd;
            --success-color: #27ae60;
            --error-color: #e74c3c;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
            padding-top: 5%;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        h2 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--secondary-color);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--primary-color);
        }
        
        input[type="radio"] {
            margin-right: 5px;
            cursor: pointer;
        }
        
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            font-size: 16px;
        }
        
        input[type="number"]:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 5px rgba(243, 156, 18, 0.3);
        }
        
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background-color: white;
            font-size: 16px;
            cursor: pointer;
        }
        
        select:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 5px rgba(243, 156, 18, 0.3);
        }
        
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }
        
        .radio-option {
            display: flex;
            align-items: center;
        }
        
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        button {
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
        }
        
        .back-button {
            background-color: #95a5a6;
            color: white;
        }
        
        .back-button:hover {
            background-color: #7f8c8d;
        }
        
        .next-button {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .next-button:hover {
            background-color: #d35400;
        }
        
        i {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Mega City Taxi Service</h2>
        <form action="DriverQuestionController" method="post">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            
            <div class="form-group">
                <label>Do you have a valid driving license?</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="license-yes" name="license" value="Yes" required>
                        <label for="license-yes">Yes</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="license-no" name="license" value="No" required>
                        <label for="license-no">No</label>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="experience">How many years of driving experience do you have?</label>
                <input type="number" id="experience" name="experience" min="0" required>
            </div>
            
            <div class="form-group">
                <label>Do you own a vehicle?</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="vehicle-yes" name="ownVehicle" value="Yes" required>
                        <label for="vehicle-yes">Yes</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="vehicle-no" name="ownVehicle" value="No" required>
                        <label for="vehicle-no">No</label>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="preferredWorkType">Preferred Work Type</label>
                <select id="preferredWorkType" name="preferredWorkType" required>
                    <option value="">Select an option</option>
                    <option value="Full-Time">Full-time</option>
                    <option value="Part-Time">Part-time</option>
                </select>
            </div>
            
            <div class="button-group">
               <button type="button" class="back-button" onclick="history.back()">
    			<i class="ri-arrow-left-s-line"></i> Back
			</button>

                <button type="submit" class="next-button">
                    Next <i class="ri-arrow-right-s-line"></i>
                </button>
            </div>
        </form>
    </div>
</body>
</html>