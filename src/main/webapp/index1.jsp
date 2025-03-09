<%@ page import="java.sql.*" %>
<%@ page import="com.doa.DBConnectionFactory" %>

<html>
<style>
/* styles.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding: 20px;
}

.car-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 15px;
    width: 300px;
    text-align: center;
    transition: transform 0.3s;
}

.car-card:hover {
    transform: translateY(-5px);
}

.car-image {
    width: 100%;
    border-radius: 10px;
}

.driver-charges {
    color: #ff6600;
    font-weight: bold;
    margin-top: 10px;
}

h2 {
    margin: 10px 0;
    color: #333;
}

.rating {
    color: #ffcc00;
    font-size: 18px;
}

.car-details {
    display: flex;
    justify-content: space-around;
    margin: 10px 0;
    font-size: 14px;
    color: #555;
}

.min-charges {
    background: #e0f7fa;
    padding: 8px;
    border-radius: 5px;
    color: #00796b;
    font-size: 14px;
    margin: 10px 0;
}

.buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
}

.book-now, .call-now {
    flex: 1;
    margin: 5px;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    color: white;
    transition: background 0.3s;
}

.book-now {
    background: #ff6600;
}

.book-now:hover {
    background: #e65c00;
}

.call-now {
    background: #333;
}

.call-now:hover {
    background: #222;
}
</style>



<h1>hi</h1>
<a href="<%= request.getContextPath() %>/View/customerRegister.jsp">Register</a>
<a href="<%= request.getContextPath() %>/View/login.jsp">Login</a>
<br><br>
<a href="<%= request.getContextPath() %>/Admin/adminRegister.jsp">Admin Register</a>
<a href="<%= request.getContextPath() %>/Admin/adminLogin.jsp">Admin Login</a>

<br><br>
<a href="<%= request.getContextPath() %>/Driver/driverRegister.jsp">Driver Register</a>
<a href="<%= request.getContextPath() %>/Driver/driverLogin.jsp">Driver Login</a>

<br><br><br><br>
<a href="<%= request.getContextPath() %>/View/login.jsp">
    <button>Start</button>
</a>
<br><br>
 
    <div class="car-list">
        <%
            Connection conn = DBConnectionFactory.getConnection();
            String query = "SELECT * FROM cab";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
        %>
        <div class="car-card">
            <img src="<%= request.getContextPath() + "/" + rs.getString("carImage") %>" alt="Car Image" class="car-image">
            <p class="driver-charges"><%= rs.getString("subDescription") %></p>
            <h2><%= rs.getString("carModel") %></h2>
            <p class="rating"><%= rs.getDouble("rate") %></p>
            <div class="car-details">
                <span>&#10052; <%= rs.getBoolean("isAC") ? "AC" : "Non-AC" %></span>
                <span> <%= rs.getDouble("kmPerHour") %>/KM</span>
                <span>4+1</span>
            </div>
            <p class="min-charges">Minimum 130km charges need to pay.</p>
            <div class="buttons">
<a href="<%= request.getContextPath() %>/CabDetailsServlet?cabId=<%= rs.getInt("cabId") %>" class="book-now">Book Now</a>


                <button class="call-now">Call Now</button>
            </div>
        </div>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </div>



</html>