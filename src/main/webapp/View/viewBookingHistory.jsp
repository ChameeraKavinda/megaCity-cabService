<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.doa.DBConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    
    <link rel="stylesheet" href="style2.css">

<style>
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .section-header {
        margin-bottom: 25px;
        border-bottom: 2px solid #f0f0f0;
        padding-bottom: 10px;
    }
    
    .section-header h2 {
        font-size: 24px;
        color: #333;
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 0;
    }
    
    .booking-wrapper {
        overflow-x: auto;
        cursor: grab;
        padding: 10px 0;
        margin-bottom: 30px;
        scrollbar-width: thin;
    }
    
    /* Custom scrollbar */
    .booking-wrapper::-webkit-scrollbar {
        height: 6px;
    }
    
    .booking-wrapper::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 10px;
    }
    
    .booking-wrapper::-webkit-scrollbar-thumb {
        background: #c1c1c1;
        border-radius: 10px;
    }
    
    .booking-cards {
        display: flex;
        gap: 20px;
    }
    
    .booking-card {
        width: 320px;
        min-width: 320px;
        height: 550px; /* Fixed height for alignment */
        background: #fff;
        border-radius: 12px;
        padding: 0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        display: inline-block;
        transition: transform 0.2s, box-shadow 0.2s;
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }
    
    .booking-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
    }
    
    .booking-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        background: #f8f9fa;
        border-bottom: 1px solid #e9ecef;
    }
    
    .booking-id {
        font-weight: bold;
        font-size: 16px;
        display: flex;
        align-items: center;
        gap: 6px;
    }
    
    .booking-status {
        padding: 4px 10px;
        border-radius: 20px;
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 4px;
    }
    
    
    .booking-details {
        padding: 15px;
        display: flex;
        flex-direction: column;
        flex: 1;
    }
    
    .detail-item {
        display: flex;
        gap: 10px;
        margin-bottom: 10px;
        color: #495057;
    }
    
    .detail-item i {
        font-size: 18px;
        color: #6c757d;
        min-width: 20px;
        text-align: center;
        margin-top: 2px;
    }
    
    .detail-content {
        flex: 1;
    }
    
    .text-truncate {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 250px;
    }
    
    .location-details {
        margin: 15px 0;
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 8px;
    }
    
    .location-label, .info-label {
        font-size: 12px;
        color: #6c757d;
        margin-bottom: 2px;
    }
    
    .location-text, .info-text {
        font-size: 14px;
    }
    
    .direction-line {
        padding-left: 20px;
        margin: 5px 0;
        color: #6c757d;
    }
    
    .price-section {
        margin-top: auto;
        background-color: #f8f9fa;
        border-radius: 8px;
        margin-top: 15px;
    }
    
    .price-details {
        padding: 12px;
    }
    
    .price-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 6px;
        font-size: 14px;
    }
    
    .price-label {
        color: #6c757d;
    }
    
    .total-price {
        display: flex;
        justify-content: space-between;
        font-weight: bold;
        color: #212529;
        font-size: 16px;
        border-top: 1px dashed #dee2e6;
        padding: 12px;
    }
    
    .driver-details {
        margin-top: 15px;
        padding: 12px;
        background-color: #f8f9fa;
        border-radius: 8px;
    }
    
    .driver-info {
        display: flex;
        gap: 10px;
        margin-bottom: 8px;
    }
    
    .driver-info i {
        font-size: 18px;
        color: #6c757d;
        min-width: 20px;
        text-align: center;
        margin-top: 2px;
    }
    
    @media (max-width: 768px) {
        .booking-cards {
            flex-direction: column;
            gap: 15px;
        }
        
        .booking-card {
            width: 100%;
            height: auto;
            min-height: 500px;
        }
    }
</style>
    <title>Mega City Cab Service</title>
</head>
   <body>
      <header class="header">
         <nav class="nav container">
            <div class="nav__data">
            
              <a href="#" onclick="history.back()" class="nav__logo">
    			<i class="ri-arrow-left-s-line" style="margin-right: 20px;font-size: 35px;color: white;"></i>
    			<i class="ri-car-fill" style="margin-right: 10px;font-size: 35px;"></i>City Mega Cab Service
			</a>

               
               <div class="nav__toggle" id="nav-toggle">
                  <i class="ri-menu-3-line nav__burger" style="color: white;"></i>
                  
                  <i class="ri-close-line nav__close"></i>
               </div>
            </div>

            <div class="nav__menu" id="nav-menu">
               <ul class="nav__list">
                  <li><a href="#" class="nav__link">Home</a></li>

                  <li><a href="View/customerRegister.jsp" class="nav__link">Booking</a></li>

                  <li class="dropdown__item">
                     <div class="nav__link">
                        Cabs & Drivers <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                        <li>
                           <a href="View/login.jsp" class="dropdown__link">
                              <i class="ri-pie-chart-line"></i> Manage Cars
                           </a>                          
                        </li>

                        <li>
                           <a href="Driver/driverRegister.jsp" class="dropdown__link">
                              <i class="ri-arrow-up-down-line"></i> Driver Register
                           </a>
                        </li>

                      
                     </ul>
                  </li>
                  
                  <li><a href="#" class="nav__link">Billing</a></li>

                  

                  <li><a href="#" class="nav__link">Contact Us</a></li>
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
     
 
<%
    String customerIdStr = request.getParameter("customerId");
    int customerId = -1;
    Customer customer = null;
    
    if (customerIdStr != null && !customerIdStr.isEmpty()) {
        try {
            customerId = Integer.parseInt(customerIdStr);
        } catch (NumberFormatException e) {
            customerId = -1;
        }
    }
    
    if (customerId > 0) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet resultSet = null;
        
        try {
            conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                String query = "SELECT * FROM customer WHERE customerId = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, customerId);
                resultSet = stmt.executeQuery();

                if (resultSet.next()) {
                    customer = new Customer(
                        resultSet.getInt("customerId"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("nicNumber"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("address")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
%>

<%
    if (customerId > 0) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet resultSet = null;

        try {
            conn = DBConnectionFactory.getConnection();
            if (conn != null) {
                String query = "SELECT * FROM booking WHERE customerId = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, customerId);
                resultSet = stmt.executeQuery();
%>

<div class="container" id="viewBooking">
    <div class="section-header">
        <h2><i class="ri-calendar-check-line"></i> Your Bookings</h2>
    </div>
    
    <div class="booking-wrapper">
        <div class="booking-cards" id="bookingCards">
            <% while (resultSet.next()) {
                int driverId = resultSet.getInt("driverId");
                int vehicleId = resultSet.getInt("vehicleId");
                String driverName = "Unknown";
                String driverPhone = "Unknown";
                String vehicleType = "Unknown";
                String bookingStatus = resultSet.getString("bookingStatus");
                String statusIcon = "";
                String statusClass = "";
                
                // Determine status icon and class
                if (bookingStatus.equalsIgnoreCase("completed")) {
                    statusIcon = "ri-checkbox-circle-line";
                    statusClass = "status-completed";
                } else if (bookingStatus.equalsIgnoreCase("pending")) {
                    statusIcon = "ri-time-line";
                    statusClass = "status-pending";
                } else if (bookingStatus.equalsIgnoreCase("cancelled")) {
                    statusIcon = "ri-close-circle-line";
                    statusClass = "status-cancelled";
                } else if (bookingStatus.equalsIgnoreCase("in progress")) {
                    statusIcon = "ri-road-map-line";
                    statusClass = "status-inprogress";
                }

                PreparedStatement driverStmt = conn.prepareStatement("SELECT name, phoneNumber FROM driver WHERE driverId = ?");
                driverStmt.setInt(1, driverId);
                ResultSet driverRs = driverStmt.executeQuery();
                if (driverRs.next()) {
                    driverName = driverRs.getString("name");
                    driverPhone = driverRs.getString("phoneNumber");
                }
                driverRs.close();
                driverStmt.close();

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
                    <div class="booking-id">
                        <i class="ri-ticket-line"></i> #<%= resultSet.getInt("bookingId") %>
                    </div>
                    <div class="booking-status <%= statusClass %>">
                        <i class="<%= statusIcon %>"></i> <%= bookingStatus %>
                    </div>
                </div>
                
                <div class="booking-details">
                    <div class="detail-item">
                        <i class="ri-calendar-event-line"></i>
                        <div class="detail-content">
                            <%= resultSet.getString("bookingDate") %>
                        </div>
                    </div>
                    
                    <div class="location-details">
                        <div class="detail-item">
                            <i class="ri-map-pin-line"></i>
                            <div class="detail-content">
                                <div class="location-label">From:</div>
                                <div class="location-text text-truncate" title="<%= resultSet.getString("pickupLocation") %>">
                                    <%= resultSet.getString("pickupLocation") %>
                                </div>
                            </div>
                        </div>
                        <div class="direction-line">
                            <i class="ri-arrow-down-line"></i>
                        </div>
                        <div class="detail-item">
                            <i class="ri-map-pin-2-line"></i>
                            <div class="detail-content">
                                <div class="location-label">To:</div>
                                <div class="location-text text-truncate" title="<%= resultSet.getString("dropLocation") %>">
                                    <%= resultSet.getString("dropLocation") %>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="detail-item">
                        <i class="ri-route-line"></i>
                        <div class="detail-content">
                            <%= resultSet.getDouble("distance") %> km
                        </div>
                    </div>
                    
                    <div class="price-section">
                        <div class="price-details">
                            <div class="price-item">
                                <span class="price-label">Base:</span>
                                <span class="price-value"><%= resultSet.getDouble("price") %> LKR</span>
                            </div>
                            <div class="price-item">
                                <span class="price-label">Tax:</span>
                                <span class="price-value"><%= resultSet.getInt("tax") %> LKR</span>
                            </div>
                            <div class="price-item">
                                <span class="price-label">Discount:</span>
                                <span class="price-value">-<%= resultSet.getInt("discount") %> LKR</span>
                            </div>
                        </div>
                        <div class="total-price">
                            <span class="total-label"><i class="ri-bill-line"></i> Total:</span>
                            <span class="total-value"><%= resultSet.getInt("totalPrice") %> LKR</span>
                        </div>
                    </div>
                    
                    <div class="driver-details">
                        <div class="driver-info">
                            <i class="ri-user-line"></i>
                            <div class="detail-content">
                                <div class="info-label">Driver:</div>
                                <div class="info-text text-truncate" title="<%= driverName %>"><%= driverName %></div>
                            </div>
                        </div>
                        <div class="driver-info">
                            <i class="ri-phone-line"></i>
                            <div class="detail-content">
                                <div class="info-text"><%= driverPhone %></div>
                            </div>
                        </div>
                        <div class="driver-info">
                            <i class="ri-car-line"></i>
                            <div class="detail-content">
                                <div class="info-text text-truncate" title="<%= vehicleType %>"><%= vehicleType %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>



<script>
    const bookingWrapper = document.querySelector(".booking-wrapper");
    const bookingCards = document.getElementById("bookingCards");
    let isDragging = false;
    let startX, scrollLeft;

    bookingWrapper.addEventListener("mousedown", (e) => {
        isDragging = true;
        startX = e.pageX - bookingWrapper.offsetLeft;
        scrollLeft = bookingWrapper.scrollLeft;
        bookingWrapper.style.cursor = "grabbing";
    });

    bookingWrapper.addEventListener("mouseleave", () => {
        isDragging = false;
        bookingWrapper.style.cursor = "grab";
    });

    bookingWrapper.addEventListener("mouseup", () => {
        isDragging = false;
        bookingWrapper.style.cursor = "grab";
    });

    bookingWrapper.addEventListener("mousemove", (e) => {
        if (!isDragging) return;
        e.preventDefault();
        const x = e.pageX - bookingWrapper.offsetLeft;
        const walk = (x - startX) * 2;
        bookingWrapper.scrollLeft = scrollLeft - walk;
    });

    // Add touch support for mobile
    bookingWrapper.addEventListener("touchstart", (e) => {
        startX = e.touches[0].pageX - bookingWrapper.offsetLeft;
        scrollLeft = bookingWrapper.scrollLeft;
    });

    bookingWrapper.addEventListener("touchmove", (e) => {
        if (e.touches.length !== 1) return;
        const x = e.touches[0].pageX - bookingWrapper.offsetLeft;
        const walk = (x - startX) * 2;
        bookingWrapper.scrollLeft = scrollLeft - walk;
        e.preventDefault(); // Prevent page scrolling while dragging
    });
</script>

    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    } else {
%>
    <p>No valid customer ID provided. Cannot fetch bookings.</p>
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