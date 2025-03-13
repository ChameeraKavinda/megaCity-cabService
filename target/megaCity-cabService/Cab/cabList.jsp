<%@ page import="java.sql.*" %>
<%@ page import="com.doa.DBConnectionFactory" %>
<html>
<head>
    <title>Cab List</title>
</head>
<body>
    <h2>Cab List</h2>
    <table border="1">
        <tr>
            <th>Car Image</th>
            <th>Sub Description</th>
            <th>Car Model</th>
            <th>Register Number</th>
            <th>Description</th>
            <th>Rate</th>
            <th>A/C</th>
            <th>Km Per Hour</th>
        </tr>
        <%
            Connection conn = DBConnectionFactory.getConnection();
            String query = "SELECT * FROM cab";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><img src="<%= request.getContextPath() + "/" + rs.getString("carImage") %>" width="100" height="100"></td>
            <td><%= rs.getString("subDescription") %></td>
            <td><%= rs.getString("carModel") %></td>
            <td><%= rs.getString("registerNumber") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getDouble("rate") %></td>
            <td><%= rs.getBoolean("isAC") ? "Yes" : "No" %></td>
            <td><%= rs.getDouble("kmPerHour") %> km/h</td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </table>
</body>
</html>
