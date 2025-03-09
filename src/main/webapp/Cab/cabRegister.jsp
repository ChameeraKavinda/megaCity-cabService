<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cab Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Cab Registration</h2>
   
   <form action="cabRegister" method="post" enctype="multipart/form-data">
    Car Image: <input type="file" name="carImage" required><br>
    Car Model: <input type="text" name="carModel" required><br>
    Register Number: <input type="text" name="registerNumber" required><br>
    Description: <textarea name="description"></textarea><br>
    A/C: 
    <select name="isAC">
        <option value="true">Yes</option>
        <option value="false">No</option>
    </select><br>
    Km per Hour: <input type="number" step="0.1" name="kmPerHour" required><br>
    Sub Description: <textarea name="subDescription"></textarea><br>
    Rate: <input type="number" step="0.1" name="rate" required><br>
    
    
    <button type="submit">Register Cab</button>
    
</form>


</div>

</body>
</html>
