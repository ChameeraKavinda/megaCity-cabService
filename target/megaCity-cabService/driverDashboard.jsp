<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.doa.DBConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" type="x-icon" href="Images/Yellowcar.png">


      <!-- =============== REMIXICONS =============== -->
      <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">

      <!--=============== CSS ===============-->
      <link rel="stylesheet" href="CSS/style1.css">

      <title>Mega City Cab Service</title>
   </head>
   <body>
      <!--=============== HEADER ===============-->
<%
    // Get driverId from request
    String driverIdStr = request.getParameter("driverId");
    int driverId = -1;
    Driver driver = null;

    if (driverIdStr != null && !driverIdStr.isEmpty()) {
        try {
            driverId = Integer.parseInt(driverIdStr);
        } catch (NumberFormatException e) {
            driverId = -1;  // Handle invalid input gracefully
        }
    }

    // Fetch driver details from the database if driverId is valid
    if (driverId > 0) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                String query = "SELECT * FROM driver WHERE driverId = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, driverId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    driver = new Driver(
                        rs.getInt("driverId"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("nic"),
                        rs.getString("phoneNumber"),
                        rs.getString("gender")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log error for debugging
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
%>

    <!--=============== HEADER ===============-->
       <header class="header">
         <nav class="nav container">
            <div class="nav__data">
               <a href="#" class="nav__logo">
                  <i class="ri-car-fill" style="margin-right: 10px;font-size: 35px;"></i>City Mega Cab Servive
               </a>
               
               <div class="nav__toggle" id="nav-toggle">
                  <i class="ri-menu-3-line nav__burger"></i>
                  
                  <i class="ri-close-line nav__close"></i>
               </div>
            </div>

            <!--=============== NAV MENU ===============-->
            <div class="nav__menu" id="nav-menu">
               <ul class="nav__list">
                  <li><a href="#" class="nav__link">Home</a></li>

                  <li><a href="View/customerRegister.jsp" class="nav__link">View Booking</a></li>

                  <!--=============== DROPDOWN 1 ===============-->
                  <li class="dropdown__item">
                     <div class="nav__link">
                        Cabs <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                        <li>
                           <a href="Driver/vehicleDetails.jsp?driverId=<%= driverId %>" class="dropdown__link">
                              <i class="ri-pie-chart-line"></i> Manage Cars
                           </a>                          
                        </li>

                        <li>
                           <a href="Driver/driverRegister.jsp" class="dropdown__link">
                              <i class="ri-arrow-up-down-line"></i> Manage Drivers
                           </a>
                        </li>

                       
                     </ul>
                  </li>
                  
                  <li class="dropdown__item">
                     <div class="nav__link">
                        View Billing <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                       
                    

                         <li class="dropdown__subitem">
                           <div class="dropdown__link">
                              <i class="ri-bar-chart-line"></i> Reports <i class="ri-add-line dropdown__add"></i>
                           </div>

                           <ul class="dropdown__submenu">
                              <li>
                                 <a href="#" class="dropdown__sublink">
                                    <i class="ri-file-list-line"></i> Documents
                                 </a>
                              </li>
      
                              <li>
                                 <a href="#" class="dropdown__sublink">
                                    <i class="ri-cash-line"></i> Payments
                                 </a>
                              </li>
      
                              <li>
                                 <a href="#" class="dropdown__sublink">
                                    <i class="ri-refund-2-line"></i> Refunds
                                 </a>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </li>
                  

                  <!--=============== DROPDOWN 2 ===============-->
                  <li class="dropdown__item">
                     <div class="nav__link">
                        Driver <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                        <li>
                           <a href="Admin/updateDriver.jsp?driverId=<%= driverId %>" class="dropdown__link">
                              <i class="ri-user-line"></i> Profiles
                           </a>                          
                        </li>

                        <li>
                           <a href="Driver/driverRegister.jsp" class="dropdown__link">
                              <i class="ri-lock-line"></i> Register
                           </a>
                        </li>

                        <li>
                           <a href="Driver/driverLogout.jsp" class="dropdown__link">
                              <i class="ri-message-3-line"></i> Logout
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li><a href="#" class="nav__link">Contact Us</a></li>
                  <li><a href="Driver/driverLogout.jsp" class="nav__link">Logout</a></li>
                  
               </ul>
            </div>
         </nav>
      </header>


      <nav>
       
       
         <div class="menu-btn">&#9776;</div>
     </nav>
     <script>const showMenu = (toggleId, navId) =>{
    	   const toggle = document.getElementById(toggleId),
           nav = document.getElementById(navId)

     toggle.addEventListener('click', () =>{
         nav.classList.toggle('show-menu')

         toggle.classList.toggle('show-icon')
     })
  }

  showMenu('nav-toggle','nav-menu')



  const menuBtn = document.querySelector('.nav__toggle');
  const navLinks = document.querySelector('.nav-links');

  menuBtn.addEventListener('click', () => {
      navLinks.style.display = navLinks.style.display === 'flex' ? 'none' : 'flex';
  });
</script>
     

<div class="hero">
    <div class="overlay"></div>
    <div class="info-container">
        <h2>Hello, <br> <%= (driver != null) ? driver.getName() : "Driver not found" %>!</h2>
        <p>Experience hassle-free, safe, and comfortable rides with Mega City Cab Service...</p>
        <a href="View/customerRegister.jsp" class="cta-btn">Book Your Ride Now</a>
    </div>
    
    
</div>



<%
    if (driverId > 0) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                // Query to fetch booking details for this driver
                String query = "SELECT * FROM booking WHERE driverId = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, driverId);
                rs = stmt.executeQuery();
%>

<!-- Booking Table -->
<div class="container">
    <h2>Your Bookings</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Booking Date</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th>Distance (km)</th>
                <th>Price ($)</th>
                <th>Status</th>
                <th>Customer ID</th>
                <th>Vehicle ID</th>
              	<th>Tax Fee</th>
              	<th>Discount Fee</th>
              	<th>Total Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Loop through the results and display booking details
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("bookingId") %></td>
                <td><%= rs.getString("bookingDate") %></td>
                <td><%= rs.getString("pickupLocation") %></td>
                <td><%= rs.getString("dropLocation") %></td>
                <td><%= rs.getDouble("distance") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getString("bookingStatus") %></td>
                <td><%= rs.getInt("customerId") %></td>
                <td><%= rs.getInt("vehicleId") %></td>
                <td><%= rs.getInt("tax") %></td>
                <td><%= rs.getInt("discount") %></td>
                <td><%= rs.getInt("totalPrice") %></td>
                
                                        <td class="action-cell">
                                            <form action="<%= request.getContextPath() %>/Booking/updateBooking.jsp" method="GET" style="display:inline;">
                                                <input type="hidden" name="bookingId" value="<%=rs.getInt("bookingId") %>">
                                                <button type="submit" class="action-btn update-btn">Update</button>
                                            </form>

                                        </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
            }
        } catch (Exception e) {
            e.printStackTrace(); // Debugging
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    } else {
%>
    <p>No valid driver ID provided. Cannot fetch bookings.</p>
<%
    }
%>
<footer class="footer" id="contact">
   <div class="section_container footer_container">
       <div class="footer_col">
           <div class="logo" style="text-align: center;">
            <i class="ri-taxi-line" style="font-size: 50px;"></i>           </div>
            <p class="section_description">
               Experience seamless travel with MegaCity Cab Service in Colombo, Sri Lanka. 
               Enjoy reliable rides, professional drivers, and affordable fares. 
               Book now for a hassle-free journey!
           </p>
           

       </div>
       <div class="footer_col">
         <h4>Quick Links</h4>
         <ul class="footer_links">
             <li><a href="about.html">About Us</a></li>
             <li><a href="services.html">Our Services</a></li>
             <li><a href="booking.html">Book a Ride</a></li>
             <li><a href="fares.html">Fares & Packages</a></li>
             <li><a href="reviews.html">Customer Reviews</a></li>
             <li><a href="contact.html">Contact Us</a></li>
         </ul>
     </div>
     
     <div class="footer_col">
         <h4>Our Services</h4>
         <ul class="footer_links">
             <li><a href="#">24/7 Cab Service</a></li>
             <li><a href="#">Airport Transfers</a></li>
             <li><a href="#">Luxury Car Rentals</a></li>
             <li><a href="#">Corporate Travel</a></li>
             <li><a href="#">Outstation Trips</a></li>
         </ul>
     </div>
     


       
       <div class="footer_col">

           <div class="contact-form" id="feedback"> 
               
               

             <h4>Contact Us</h4>   
           <ul class="footer_links">
               <li><a href="mailto:megacitycabservice@gmail.com">Email: megacitycabservice@gmail.com</a></li>
           </ul>
           <br>
           <ul class="footer_links">
               <li><a href="https://wa.me/94705220990 ">Hot Line:  07052209##</a></li>
           </ul>
           <div class="footer_socials">
            <i class="ri-whatsapp-line whatsapp" ></i>
            <i class="ri-facebook-circle-line facebook"></i>
            <i class="ri-youtube-line youtube" ></i>
               <!-- <a href="#"><img src="Pic/youtubeLogo.png" alt="youtube"></a>
               <a href="#"><img src="Pic/tiktokLogo.png" alt="tiktok"></a> -->
           </div>

           


       </div>
   </div>
  
</footer>
<div class="footer_bar">
   Copyright &copy;2025; Designed by <span class="designer">Chameera Kavinda &copy; Developer</span>.All rights reserved.<br>
   <a href="https://www.facebook.com/profile.php?id=61557494135003&mibextid=LQQJ4d"><i class="ri-facebook-circle-fill" style="font-size: 24px;color: wheat;"></i></a>
      
   
</div>

<script src="https://unpkg.com/scrollreveal"></script><!-- scrollreveal option js code -->
      <!--=============== MAIN JS ===============-->
<script> </script>
   </body>
</html>