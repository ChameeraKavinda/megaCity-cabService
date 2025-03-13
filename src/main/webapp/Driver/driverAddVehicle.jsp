<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Vehicle Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
            padding-top: 5%;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            
        }

        h2 {
           
           
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
			border-bottom: 2px solid #f39c12;        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-group {
            flex: 1 1 45%;
            min-width: 250px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid ;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #f39c12;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
            outline: none;
            
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button[type="submit"] {
            background-color: #2ecc71;
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(46, 204, 113, 0.2);
        }

        .back-button {
            display: flex;
            align-items: center;
            gap: 5px;
            background-color: #ecf0f1;
            color: #34495e;
        }

        .back-button:hover {
            background-color: #dfe6e9;
        }

        .back-button i {
            font-size: 18px;
        }

        /* Form validation styles */
        input:invalid,
        select:invalid {
            border-color:black ;
        }

        /* Additional professional touches */
        .form-header {
            margin-bottom: 10px;
        }

        .form-subtitle {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
        }

        @media (max-width: 600px) {
            .form-group {
                flex: 1 1 100%;
            }
            
            .container {
                padding: 20px 15px;
            }
            
            .actions {
                flex-direction: column;
                gap: 10px;
            }
            
            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Your Vehicle</h2>
        <p class="form-subtitle">Please enter your vehicle details below to complete registration</p>
        
<form action="VehicleRegistrationController" method="post" enctype="multipart/form-data">
            <input type="hidden" name="driverId" value="<%= request.getParameter("driverId") %>">

            <div class="form-row">
                <div class="form-group">
                    <label for="vehicleType">Vehicle Type:</label>
                    <input type="text" id="vehicleType" name="vehicleType" placeholder="e.g. Sedan, SUV" required>
                </div>
                <div class="form-group">
                    <label for="licenseNumber">Vehicle Number:</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" placeholder="e.g. wp ABC 123" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="vehicleColor">Vehicle Color:</label>
                    <input type="text" id="vehicleColor" name="vehicleColor" placeholder="e.g. Black, Silver" required>
                </div>
                <div class="form-group">
                    <label for="manufactureDate">Manufacture Year:</label>
                    <input type="date" id="manufactureDate" name="manufactureDate" required>
                    
                     <label for="vehicleImage">Upload Vehicle Image:</label>
    <input type="file" id="vehicleImage" name="vehicleImage" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="isAC">AC/Non AC:</label>
                    <select name="isAC" id="isAC">
                        <option value="AC">AC</option>
                        <option value="NonAC">Non-AC</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="passengerType">Passenger Type:</label>
                    <select id="passengerType" name="passengerType" required>
                        <option value="" disabled selected>Select passenger type</option>
                        <option value="Flex">Flex</option>
                        <option value="Mini">Mini</option>
                        <option value="Car">Car</option>
                        <option value="Van">Van</option>
                    </select>
                </div>
            </div>

            <div class="actions">
                <button type="button" class="back-button" onclick="history.back()">
                    <i class="ri-arrow-left-s-line"></i>Back
                </button>
                <button type="submit">Finish</button>
            </div>
        </form>
    </div>

    <script>
        
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            form.addEventListener('submit', function(event) {
                let isValid = true;
                const inputs = form.querySelectorAll('input[required], select[required]');
                
                inputs.forEach(input => {
                    if (!input.value.trim()) {
                        input.classList.add('invalid');
                        isValid = false;
                    } else {
                        input.classList.remove('invalid');
                    }
                });
                
                if (!isValid) {
                    event.preventDefault();
                    alert('Please fill in all required fields.');
                }
            });
        });
    </script>
</body>
</html>