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


      <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">

      <link rel="stylesheet" href="CSS/driver.css">
      <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap');
    
    .container h2{
    color: red;
    font-size: 35px;}
    #viewBooking {
        font-family: 'Roboto', sans-serif;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .booking-title {
        display: flex;
        align-items: center;
        font-size: 1.5rem;
        font-weight: 500;
        color: #333;
        margin-bottom: 20px;
    }
    
    .booking-title i {
        margin-right: 10px;
        color: hsl(220, 24%, 15%);
    }
    
    .card-container {
        display: flex;
        overflow-x: auto;
        scroll-snap-type: x mandatory;
        gap: 15px;
        padding: 5px 0;
        scrollbar-width: thin;
        scrollbar-color: #ddd #f5f5f5;
    }
    
    .card-container::-webkit-scrollbar {
        height: 5px;
    }
    
    .card-container::-webkit-scrollbar-thumb {
        background-color: #ddd;
        border-radius: 5px;
    }
    
    .card-container::-webkit-scrollbar-track {
        background: #f5f5f5;
    }
    
    .booking-card {
        flex: 0 0 auto;
        width: 300px;
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06);
        scroll-snap-align: start;
        overflow: hidden;
        transition: all 0.2s ease;
    }
    
    .booking-card:hover {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 2px 4px rgba(0, 0, 0, 0.06);
    }
    
    .booking-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 15px;
        border-bottom: 1px solid #f0f0f0;
        background-color: #f9f9f9;
    }
    
    .booking-date {
        display: flex;
        align-items: center;
        font-size: 13px;
        color: #555;
    }
    
    .booking-date i {
        margin-right: 5px;
        color: hsl(220, 24%, 15%);
    }
    
   .booking-status {
    font-size: 15px;
    font-weight: 500;
    color: white;
    background-color: green;
    border-radius: 50px; 
    padding: 5px 15px; 
    display: inline-block; 
}

    
    .booking-details {
        padding: 12px 15px;
      
        min-height: 240px;
    }
    
    
    .detail-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        min-height: 30px;
    }
    
    .detail-item:last-child {
        margin-bottom: 0;
    }
    
    .detail-item i {
        flex-shrink: 0;
        width: 20px;
        height: 20px;
        margin-right: 10px;
        color: hsl(220, 24%, 15%);
        font-size: 16px;
    }
    
    .location-icon {
        color: #EF4444 !important;
    }
    
    .detail-content {
        flex: 1;
        overflow: hidden; /* Ensures content doesn't overflow */
    }
    
    .detail-label {
        display: block;
        font-size: 12px;
        color: #6B7280;
        margin-bottom: 2px;
    }
    
    .detail-value {
        font-size: 13px;
        color: #111827;
        line-height: 1.4;
    }
    
    /* Truncate long text with ellipsis */
    .truncate-text {
        display: block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    /* Show full text on hover */
    .truncate-text:hover {
        white-space: normal;
        overflow: visible;
        position: relative;
        z-index: 1;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        padding: 2px 4px;
        border-radius: 2px;
    }
    
    .booking-price {
        padding: 12px 15px;
        border-top: 1px dashed #e5e7eb;
        background-color: #f9fafb;
    }
    
    .price-row {
        display: flex;
        justify-content: space-between;
        font-size: 13px;
        color: #4B5563;
        margin-bottom: 6px;
    }
    
    .price-value {
        font-weight: 500;
        text-align: right;
    }
    
    .price-divider {
        margin: 8px 0;
        border: 0;
        border-top: 1px dashed #e5e7eb;
    }
    
    .price-row.total {
        font-weight: 600;
        color: #111827;
        font-size: 14px;
        margin-bottom: 0;
    }
    
   .booking-actions {
    display: flex;          
    justify-content: center; 
    align-items: center;     
    gap: 10px;
    padding: 12px 15px;
    border-top: 1px solid #f0f0f0;
    width: 100%;            
}

    
    .update-btn, .print-btn {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 10px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }
    
    .update-btn {
        background-color: hsl(220, 24%, 15%);
        color: white;
    }
    
    .update-btn:hover {
        background-color: #3C5BB8;
    }
    
    .print-btn {
        background-color: #f5f5f5;
        color: #666;
    }
    
    .print-btn:hover {
        background-color: #e0e0e0;
    }
    
    .update-btn i, .print-btn i {
        margin-right: 5px;
    }
    
    .empty-state {
        text-align: center;
        padding: 40px 0;
    }
    
    .empty-state i {
        font-size: 50px;
        color: #D1D5DB;
        margin-bottom: 15px;
    }
    
    .empty-state h3 {
        font-size: 16px;
        color: #4B5563;
        margin-bottom: 8px;
    }
    
    .empty-state p {
        font-size: 14px;
        color: #6B7280;
    }
    
    @media (max-width: 640px) {
        .card-container {
            flex-direction: column;
            align-items: stretch;
        }
        
        .booking-card {
            width: 100%;
            margin-bottom: 15px;
        }
    }
</style>
      

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

            <div class="nav__menu" id="nav-menu">
               <ul class="nav__list">
                  <li><a href="#" class="nav__link">Home</a></li>

                  <li><a href="Driver/viewRideHistory.jsp?driverId=<%= driverId %>" class="nav__link"> Ride History</a></li>

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
                  

                  <li class="dropdown__item">
                     <div class="nav__link">
                        Driver <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                        <li>
                           <a href="Driver/updateProfile.jsp?driverId=<%= driverId %>" class="dropdown__link">
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

                  <li><a href="Driver/driverLogout.jsp" class="nav__link">Logout</a></li>
                 	<li><a href="Driver/userGuideline.jsp" class="nav__link">Help</a></li>
                  
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
		<%
   		 Driver loggedDriver = (Driver) session.getAttribute("driver");
			%>
		<h2>Hello, <%= (loggedDriver != null) ? loggedDriver.getName() : "Driver" %></h2>
        <br><br><br>
        <p>Experience hassle-free, safe, and comfortable rides with Mega City Cab Service...</p>
        <br><br><br><br>
        <a href="#viewBooking" class="cta-btn">View Your New Ride<i class="ri-arrow-right-double-line" style="font-size: 30px;"></i></a>
    </div>
    
    
</div >
<div id="viewBooking"></div>
<br><br>

<%
    if (driverId > 0) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                // Query to fetch booking details for this driver
				String query = "SELECT * FROM booking WHERE driverId = ? AND bookingStatus = 'booked' ORDER BY bookingDate DESC";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, driverId);
                rs = stmt.executeQuery();
%>

<div class="container" >
    <h2 class="booking-title"><i class="ri-calendar-check-line"></i> Your New Bookings</h2>
    <div class="card-container" id="cardContainer">
        <%
            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                int vehicleId = rs.getInt("vehicleId");
                
                String customerName = "Unknown";
                String customerPhone = "Unknown";
                String vehicleType = "Unknown";
                String bookingStatus = rs.getString("bookingStatus");
                
                PreparedStatement customerStmt = conn.prepareStatement("SELECT name, phoneNumber FROM customer WHERE customerId = ?");
                customerStmt.setInt(1, customerId);
                ResultSet customerRs = customerStmt.executeQuery();
                if (customerRs.next()) {
                    customerName = customerRs.getString("name");
                    customerPhone = customerRs.getString("phoneNumber");
                }
                customerRs.close();
                customerStmt.close();
                
                PreparedStatement vehicleStmt = conn.prepareStatement("SELECT vehicle_type FROM vehicle WHERE id = ?");
                vehicleStmt.setInt(1, vehicleId);
                ResultSet vehicleRs = vehicleStmt.executeQuery();
                if (vehicleRs.next()) {
                    vehicleType = vehicleRs.getString("vehicle_type");
                }
                vehicleRs.close();
                vehicleStmt.close();
        %>
        <div class="booking-card">
            <div class="booking-header">
                <div class="booking-date">
                    <i class="ri-calendar-line"></i> <%= rs.getString("bookingDate") %>
                </div>
                <div class="booking-status">
                    <%= bookingStatus %>
                </div>
            </div>
            
            <div class="booking-details">
             <div class="detail-item">
                   <i class="ri-price-tag-3-line"></i>
                    <div class="detail-content">
                        <span class="detail-label">Booking Id:</span>
                        <span class="detail-value truncate-text"><%= rs.getString("bookingId") %></span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-map-pin-line location-icon"></i>
                    <div class="detail-content">
                        <span class="detail-label">Pickup</span>
                        <span class="detail-value truncate-text"><%= rs.getString("pickupLocation") %></span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-pin-distance-line location-icon"></i>
                    <div class="detail-content">
                        <span class="detail-label">Drop</span>
                        <span class="detail-value truncate-text"><%= rs.getString("dropLocation") %></span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-route-line"></i>
                    <div class="detail-content">
                        <span class="detail-label">Distance</span>
                        <span class="detail-value"><%= rs.getDouble("distance") %> km</span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-car-line"></i>
                    <div class="detail-content">
                        <span class="detail-label">Vehicle</span>
                        <span class="detail-value"><%= vehicleType %></span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-user-3-line"></i>
                    <div class="detail-content">
                        <span class="detail-label">Customer</span>
                        <span class="detail-value truncate-text"><%= customerName %></span>
                    </div>
                </div>
                
                <div class="detail-item">
                    <i class="ri-phone-line"></i>
                    <div class="detail-content">
                        <span class="detail-label">Phone</span>
                        <span class="detail-value"><%= customerPhone %></span>
                    </div>
                </div>
            </div>
            
            <div class="booking-price">
                <div class="price-row">
                    <span>Base Price</span>
                    <span class="price-value">LKR <%= rs.getDouble("price") %></span>
                </div>
                <div class="price-row">
                    <span>Tax Fee</span>
                    <span class="price-value">LKR <%= rs.getInt("tax") %></span>
                </div>
                <div class="price-row">
                    <span>Discount</span>
                    <span class="price-value">-LKR <%= rs.getInt("discount") %></span>
                </div>
                <hr class="price-divider">
                <div class="price-row total">
                    <span>Total</span>
                    <span class="price-value">LKR <%= rs.getInt("totalPrice") %></span>
                </div>
            </div>
            
            <div class="booking-actions">
                <form action="<%= request.getContextPath() %>/Booking/updateBooking.jsp" method="GET" style="display:inline;">
                  		  <input type="hidden" name="bookingId" value="<%= rs.getInt("bookingId") %>">
                    		<button type="submit" class="action-btn update-btn">Start Ride</button>
                			</form>
                
            </div>
             
        </div>
        
        <% } %>
      
    </div>
    
    <div class="empty-state" id="emptyState" style="display: none;">
        <i class="ri-calendar-todo-line"></i>
        <h3>No Bookings Found</h3>
        <p>You don't have any bookings yet. Create a new booking to get started.</p>
    </div>
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

<script>
    // Add smooth scrolling to card container
    const cardContainer = document.getElementById('cardContainer');
    let isDown = false;
    let startX;
    let scrollLeft;

    cardContainer.addEventListener('mousedown', (e) => {
        isDown = true;
        cardContainer.style.cursor = 'grabbing';
        startX = e.pageX - cardContainer.offsetLeft;
        scrollLeft = cardContainer.scrollLeft;
    });
    
    cardContainer.addEventListener('mouseleave', () => {
        isDown = false;
        cardContainer.style.cursor = 'grab';
    });
    
    cardContainer.addEventListener('mouseup', () => {
        isDown = false;
        cardContainer.style.cursor = 'grab';
    });
    
    cardContainer.addEventListener('mousemove', (e) => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - cardContainer.offsetLeft;
        const walk = (x - startX) * 2;
        cardContainer.scrollLeft = scrollLeft - walk;
    });
    
    window.addEventListener('DOMContentLoaded', () => {
        const cards = cardContainer.querySelectorAll('.booking-card');
        const emptyState = document.getElementById('emptyState');
        
        if (cards.length === 0) {
            cardContainer.style.display = 'none';
            emptyState.style.display = 'block';
        }
    });
    
    // Print booking details function
    function printBookingDetails(bookingId) {
        // Print functionality
        window.open('<%= request.getContextPath() %>/
</script>

<div style="display: flex; justify-content: flex-end; padding: 10px; margin-right: 12%;">
 <a href="Driver/viewRideHistory.jsp?driverId=<%= driverId %>" 
   style="font-size: 20px; display: inline-block; text-align: center; color: black; text-decoration: none;"
   onmouseover="this.style.color='blue';" 
   onmouseout="this.style.color='black';">
   See all
</a>


</div>



<section class="driver-opportunities">
    <div class="driver-content">
        <h2>Benefits of Registering as a Driver</h2>
        <p>Be part of Sri Lanka's growing transportation network. Drive with us and enjoy competitive earnings while providing essential services to your community.</p>
        
        <ul class="benefits-list">
            <li>Earn up to Rs. 100,000+ monthly with flexible hours</li>
            <li>Comprehensive insurance coverage for peace of mind</li>
            <li>Weekly payments and performance bonuses</li>
            <li>Access to exclusive driver benefits and rewards</li>
            <li>24/7 support team to assist you</li>
        </ul>
        
       
    </div>
    
    <div class="driver-image">
        <img src="Images/driverback.webp" alt="Join our driver team">
    </div>
</section>




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