<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.doa.DBConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.doa.CustomerDOA"%>
<%@page import="com.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" type="x-icon" href="Images/Yellowcar.png">


     
      <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">

  
      <link rel="stylesheet" href="CSS/style2.css">

      <title>Mega City Cab Service</title>
   </head>
   <body>
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
			
 			<li class="dropdown__item">
    			<%
        			Customer loginCustomer = (Customer) session.getAttribute("customer");
        			if (loginCustomer != null) {
    			%>
        		<div class="nav__link">
            		Booking Management <i class="ri-arrow-down-s-line dropdown__arrow"></i>
        		</div>
        			<ul class="dropdown__menu">
            			<li>
                			<a href="View/bookVehicle.jsp?customerId=<%= loginCustomer.getCustomerId() %>" class="dropdown__link">
                    		<i class="ri-bookmark-line"></i> Booking
                			</a>   
            			</li>
            			<li>
                			<a href="View/viewBookingHistory.jsp?customerId=<%= loginCustomer.getCustomerId() %>" class="dropdown__link">
                    		<i class="ri-chat-history-line"></i> Booking History
                			</a>
            			</li>
        			</ul>
    			<%
        			}
    			%>
			</li>

                  
                  
               <li><a href="#driver" class="nav__link">Careers</a></li>
                  

                  <li class="dropdown__item">
                     <div class="nav__link">
                        User <i class="ri-arrow-down-s-line dropdown__arrow"></i>
                     </div>

                     <ul class="dropdown__menu">
                     
                        <li>
                           <a href="View/customerRegister.jsp" class="dropdown__link">
                              <i class="ri-map-pin-user-line"></i> Register
                           </a>
                        </li>
                        
                        <li>
                              	<%
    								Customer loggedInCustomer = (Customer) session.getAttribute("customer");
    								if (loggedInCustomer != null) {
								%>
                           <a href="<%= request.getContextPath() %>/Admin/updateCustomer.jsp?customerId=<%= loggedInCustomer.getCustomerId() %>" class="dropdown__link">
                              <i class="ri-user-line"></i> Profiles
                           </a>  
                           <%
   			 					}
							%>                        
                        </li>

                        
                        <li>
                           <a href="View/logout.jsp" class="dropdown__link">
                              <i class="ri-message-3-line"></i> Logout
                           </a>
                        </li>
                     </ul>
                  </li>

                  <li><a href="#feedback" class="nav__link">Contact Us</a></li>
                   <li><a href="View/userGuideline.jsp" class="nav__link">Help</a></li>
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
        <h2>Reliable Rides, Anytime, Anywhere!</h2>
       <br> <p>Experience hassle-free, safe, and comfortable rides with Mega City Cab Service. Whether you're commuting to work, heading to the airport, or exploring the city, our professional drivers and well-maintained vehicles ensure a smooth journey. Book your ride now and travel with confidence!</p>
       
       <br><br><br><br>
		<%
   			 Customer registerCustomer = (Customer) session.getAttribute("customer");
    		if (registerCustomer != null) {
		%>
        	<a href="View/bookVehicle.jsp?customerId=<%= registerCustomer.getCustomerId() %>" class="cta-btn">Book Your Ride Now <i class="ri-arrow-right-double-line" style="font-size: 30px;"></i></a>
		<%
    	} else {
		%>
        	
        	<a href="View/customerRegister.jsp" class="cta-btn">Book Your Ride Now <i class="ri-arrow-right-double-line" style="font-size: 30px;"></i></a>
		<%
   		 }
		%>
    </div>
    <div class="taxi-image">
        <img src="Images/Yellowcar.png" alt="Taxi Image">
    </div>
</div>

     
    <h1 class="one-way-title">One Way Cabs</h1>


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
            <p class="min-charges"><%= rs.getString("description") %></p>
            <div class="buttons">
            <%
   			 Customer registeredCustomer = (Customer) session.getAttribute("customer");
    		if (registeredCustomer != null) {
				%>
        	<a href="View/bookVehicle.jsp?customerId=<%= registeredCustomer.getCustomerId() %>" class="book-now">Book Now </a>
				<%
    			} else {
				%>
        	
        			<a href="View/customerRegister.jsp" class="book-now">Book Now</a>
				<%
   				 }
				%>
			


			<button class="call-now" onclick="window.location.href='callTo:94705220990';">
    				Call Now
			</button>
            </div>
        </div>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        %>
    </div>





     <div class="count_container">
      <h2>Facts By The Numbers</h2>
      <section class="section_container banner_container">
          <div class="banner_content">
              <div class="banner_card">
                  <div class="icon"><i class="ri-car-fill" style="font-size: 50px;"></i></i></div>
                  <h4 id="count1">20+</h4>
                  <p>Count of Cars</p>
              </div>
              <div class="banner_card">
                  <div class="icon"><i class="ri-dashboard-2-line" style="font-size: 50px;"></i></div>
                  <h4 id="count2">200K+</h4>
                  <p>Total Kilometer</p>
              </div>
              <div class="banner_card">
                  <div class="icon"><i class="ri-user-line" style="font-size: 50px;"></i></div>
                  <h4 id="count3">10K+</h4>
                  <p>Happy Customers</p>
              </div>
          </div>
      </section>
  </div>
  <script>
  function animateCount(id, start, end, duration) {
	    let element = document.getElementById(id);
	    let range = end - start;
	    let startTime = null;

	    function animation(currentTime) {
	        if (startTime === null) startTime = currentTime;
	        let progress = currentTime - startTime;
	        let value = Math.min(start + Math.floor((progress / duration) * range), end);
	        element.innerHTML = value + 'K+';
	        if (progress < duration) {
	            requestAnimationFrame(animation);
	        } else {
	            element.innerHTML = end + 'K+';
	        }
	    }

	    requestAnimationFrame(animation);
	}

	window.onload = function() {
	    animateCount('count1', 0, 25, 12000);  
	    animateCount('count2', 0, 350, 13000); 
	    animateCount('count3', 0, 600, 14000); 
	};



</script>
  <section class="why-choose-us">
   <h2>Why Choose Us</h2>
   <p class="description">
       Mega City Cabs is a transportation service that prides itself on providing top-notch customer service 
       and safe, reliable transportation. Our drivers are professional and courteous, and our fleet is 
       well-maintained to ensure your comfort and safety. We offer a variety of services, including airport 
       transfers, corporate transportation, and special event transportation.
   </p>

   <div class="features-container">
       <div class="feature-box">
           <div class="choose-icon"><i class="ri-bookmark-line"></i></div>
           <h3>Easy & Fast Booking</h3>
           <p>We understand that your time is valuable and that's why we've made our booking process as easy and fast as possible.</p>
       </div>

       <div class="feature-box dark">
           <div class="choose-icon"><i class="ri-map-pin-line"></i></div>
           <h3>Many Pickup Locations</h3>
           <p>Enthusiastically magnetic initiatives with cross-platform sources. Dynamically target testing procedures.</p>
       </div>

       <div class="feature-box">
           <div class="choose-icon"><i class="ri-customer-service-2-line"></i></div>
           <h3>Customer Satisfaction</h3>
           <p>Globally user-centric method interactive. Seamlessly revolutionize unique portals with corporate collaboration.</p>
       </div>
   </div>
</section>


<section class="map1-container"style="display: f">
    <div class="text-content">
        <h2>We're Here For You</h2>
        <p>
            Mega City CAB Service is always here to accommodate all of your transportation needs at any prearranged time.
            We have a wide range of fleet vehicles to choose from, including sedans, SUVs, and luxury limousines.
            Whether you need a quick ride or a long-distance service, our team is happy to assist you.
            Contact us today to find out what offers we have available.
        </p>
    </div>
    
    <div class="map-container">
       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63320.43010905166!2d80.5844956728605!3d7.29454342664209!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae366266498acd3%3A0x411a3818a1e03c35!2sKandy!5e0!3m2!1sen!2slk!4v1739746303472!5m2!1sen!2slk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
</section>




<section class="driver-opportunities" id="driver">
    <div class="driver-content" >
        <h2>Join MegaCity Cab Service as a Driver</h2>
        <p>Be part of Sri Lanka's growing transportation network. Drive with us and enjoy competitive earnings while providing essential services to your community.</p>
        
        <ul class="benefits-list">
            <li>Earn up to Rs. 100,000+ monthly with flexible hours</li>
            <li>Comprehensive insurance coverage for peace of mind</li>
            <li>Weekly payments and performance bonuses</li>
            <li>Access to exclusive driver benefits and rewards</li>
            <li>24/7 support team to assist you</li>
        </ul>
        
        <a href="Driver/driverRegister.jsp" class="cta-btn">Apply Now <i class="ri-arrow-right-line"></i></a>
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
               <li><a href="callTo:94705220990 ">Hot Line:  07052209##</a></li>
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

<script src="https://unpkg.com/scrollreveal"></script>
<script> </script>
   </body>
</html>