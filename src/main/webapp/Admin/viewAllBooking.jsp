<%@page import="com.doa.BookingDAO"%>
<%@page import="com.model.Booking"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service - Booking Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: hsl(220, 24%, 12%);
            --primary-dark:  hsl(220, 24%, 15%);
            --primary-light: hsl(220, 20%, 18%);
            --secondary-color: #f3f4f6;
            --text-color: #333;
            --light-text: #64748b;
            --border-color: #e2e8f0;
            --sidebar-width: 260px;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --warning-color: #f59e0b;
            --transition-speed: 0.3s;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: #f8fafc;
            color: var(--text-color);
            display: flex;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
            line-height: 1.5;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: var(--sidebar-width);
            height: 100vh;
            background: linear-gradient(to bottom, var(--primary-color), var(--primary-dark));
            color: white;
            padding: 0;
            box-shadow: var(--shadow);
            z-index: 100;
            transition: transform var(--transition-speed) ease;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 25px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sidebar-header h2 {
            font-size: 1.4rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .menu-toggle {
            display: none;
            background: transparent;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 10px 0;
        }

        .sidebar ul li {
            padding: 0;
            margin: 4px 0;
        }

        .sidebar ul li a, .sidebar ul li div {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: rgba(255, 255, 255, 0.85);
            text-decoration: none;
            transition: all 0.2s ease;
            border-radius: 0 25px 25px 0;
            margin-right: 15px;
        }

        .sidebar ul li a:hover, .sidebar ul li div:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            cursor: pointer;
        }

        .sidebar ul li a i, .sidebar ul li div i {
            margin-right: 12px;
            font-size: 1.2rem;
        }

        .sidebar ul li a.active {
            background-color: white;
            color: var(--primary-color);
            font-weight: 600;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 0;
            transition: margin var(--transition-speed) ease;
            width: calc(100% - var(--sidebar-width));
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: white;
            box-shadow: var(--shadow-sm);
            position: sticky;
            top: 0;
            z-index: 99;
            flex-wrap: wrap;
            gap: 15px;
        }

        .header-left {
            display: flex;
            align-items: center;
        }

        .mobile-menu-toggle {
            display: none;
            background: transparent;
            border: none;
            color: var(--primary-color);
            font-size: 1.5rem;
            margin-right: 15px;
            cursor: pointer;
        }

        .header-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .header-search {
            display: flex;
            align-items: center;
            background-color: var(--secondary-color);
            border-radius: 50px;
            padding: 5px 15px;
            width: 300px;
            max-width: 100%;
            transition: all 0.2s ease;
        }

        .header-search:focus-within {
            box-shadow: 0 0 0 2px var(--primary-light);
        }

        .header-search i {
            color: var(--light-text);
            margin-right: 10px;
        }

        .header-search input {
            background: transparent;
            border: none;
            outline: none;
            padding: 10px 0;
            width: 100%;
            color: var(--text-color);
        }

        /* Content */
        .content-wrapper {
            padding: 20px 30px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            transition: box-shadow 0.2s ease;
        }

        .card:hover {
            box-shadow: var(--shadow);
        }

        .card-header {
            padding: 20px 30px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .card-header h3 {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .card-body {
            padding: 20px 30px;
            overflow-x: auto;
        }

        /* Button Styles */
        .action-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            white-space: nowrap;
            box-shadow: var(--shadow-sm);
        }

        .action-button:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow);
        }

        .action-button i {
            margin-right: 8px;
        }
        .action-button a{
        text-decoration: none;
        color: white;}

        /* Table Styles */
        .table-container {
            overflow-x: auto;
            width: 100%;
            scrollbar-width: thin;
            scrollbar-color: var(--primary-light) #f1f1f1;
        }

        .table-container::-webkit-scrollbar {
            height: 6px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: var(--primary-light);
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            min-width: 800px;
        }

        table th, table td {
            padding: 14px 20px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        table th {
            font-weight: 600;
            color: var(--light-text);
            background-color: #f9fafb;
            white-space: nowrap;
            position: sticky;
            top: 0;
            z-index: 1;
        }

        table tbody tr {
            transition: background-color 0.2s ease;
        }

        

        .action-cell {
            gap: 10px;
            justify-content: flex-end;
            white-space: nowrap;
        }

        /* Updated buttons for the table actions */
        .action-btn {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.85rem;
            font-weight: 500;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }

        .update-btn {
            background-color: var(--warning-color);
            color: white;
            margin-right: 5px;
        }

        .update-btn:hover {
            background-color: #d97706;
        }

        .delete-btn {
            background-color: var(--danger-color);
            color: white;
        }

        .delete-btn:hover {
            background-color: #dc2626;
        }

        /* Mobile Cards */
        .mobile-cards {
            display: none;
        }

        .mobile-card {
            display: none;
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: var(--shadow-sm);
            transition: box-shadow 0.2s ease;
        }

        .mobile-card:hover {
            box-shadow: var(--shadow);
        }

        .mobile-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 10px;
        }

        .mobile-card-title {
            font-weight: 600;
            color: var(--primary-color);
        }

        .mobile-card-row {
            display: flex;
            margin-bottom: 8px;
            flex-wrap: wrap;
        }

        .mobile-card-label {
            font-weight: 500;
            color: var(--light-text);
            width: 120px;
            flex-shrink: 0;
        }

        .mobile-card-value {
            flex: 1;
        }

        .mobile-card-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 15px;
            border-top: 1px solid var(--border-color);
            padding-top: 10px;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
            gap: 5px;
            flex-wrap: wrap;
        }

        .pagination-button {
            padding: 8px 15px;
            border: 1px solid var(--border-color);
            background-color: white;
            color: var(--text-color);
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.2s ease;
            font-weight: 500;
        }

        .pagination-button.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .pagination-button:hover:not(.active) {
            background-color: var(--secondary-color);
        }

        /* Badges */
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .badge-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }

        .badge-warning {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }

        .badge-danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }

        /* Overlay */
        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 99;
            backdrop-filter: blur(2px);
            opacity: 0;
            visibility: hidden;
            transition: opacity var(--transition-speed) ease, visibility var(--transition-speed) ease;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .mobile-menu-toggle {
                display: block;
            }

            body.sidebar-open .sidebar {
                transform: translateX(0);
            }

            body.sidebar-open .sidebar-overlay {
                opacity: 1;
                visibility: visible;
            }

            .header-search {
                width: 250px;
            }
        }

        @media (max-width: 768px) {
            .content-wrapper {
                padding: 15px;
            }

            .header {
                padding: 10px 15px;
            }

            .card-header, .card-body {
                padding: 15px;
            }

            .header-title {
                font-size: 1.1rem;
            }

            .header-search {
                width: 100%;
                order: 1;
                flex-basis: 100%;
            }

            .pagination {
                justify-content: center;
            }

            table th, table td {
                padding: 10px 15px;
            }
        }

        @media (max-width: 576px) {
            .table-container {
                display: none;
            }

            .mobile-cards {
                display: block;
            }

            .mobile-card {
                display: block;
            }

            .pagination-button:not(.active):not(:first-child):not(:last-child) {
                display: none;
            }

            .card-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .card-header .action-button {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Overlay -->
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2><i class="ri-car-fill" style="margin-right: 10px;font-size: 35px;"></i>City Mega Cab Servive</h2>
            <button class="menu-toggle" id="closeSidebar">
                <i class="ri-close-line"></i>
            </button>
        </div>
        <ul>
            
            <li>
                <a href="veiwAllAdmins.jsp" class="active">
                    <i class="ri-user-settings-line"></i>
                    Admin/Staff Management
                </a>
            </li>
            <li>
                <a href="veiwAllCustomers.jsp">
                    <i class="ri-user-3-line"></i>
                    Customer Management
                </a>
            </li>
            <li>
                <a href="viewAllDrivers.jsp">
                    <i class="ri-steering-2-line"></i>
                    Driver Management
                </a>
            </li>
             <li>
                	<a href="${pageContext.request.contextPath}/Cab/cabRegister.jsp">
                    <i class="ri-taxi-line"></i>
                    Add Vehicle Type
                </a>
            </li>
            <li>
                	<a href="${pageContext.request.contextPath}/Driver/AllVehicles.jsp">
                    <i class="ri-taxi-line"></i>
                    Vehicle Management
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="ri-calendar-check-line"></i>
                    Booking Management
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="ri-bill-line"></i>
                    Billing
                </a>
           </li>
          

            <li>
                <a href="#">
                    <i class="ri-logout-box-r-line"></i>
                    Logout
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <div class="header-left">
                <button class="mobile-menu-toggle" id="openSidebar">
                    <i class="ri-menu-line"></i>
                </button>
                <div class="header-title">Booking Management</div>
            </div>
            <div class="header-search">
                <i class="ri-search-line"></i>
                <input type="text" placeholder="Search staff members...">
            </div>
        </div>

        <div class="content-wrapper">
            <div class="card">
                <div class="card-header">
                    <h3>Booking Details</h3>
                    <button class="action-button">
                            <a href="<%= request.getContextPath() %>/Admin/adminAddBooking.jsp"><i class="ri-user-add-line"></i> <span>Add New Booking</span></a>
                        
                    </button>
                </div>
                <div class="card-body">
                    <!-- Table view (desktop) -->
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                					<th>Booking Date</th>
                					<th>Pickup Location</th>
               		 				<th>Drop Location</th>
                					<th>Distance (km)</th>
                					<th>Price (LKR)</th>
                					<th>Tax</th>
                					<th>Discount</th>
                					<th>Total Price</th>
                					<th>Status</th>
                					<th>Customer ID</th>
                					<th>Driver ID</th>                					
                					<th>Vehicle ID</th>
                					<th>Action</th>
                			
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Booking booking : bookingList) { %>
                                    <tr>
                                        <td><%= booking.getBookingId() %></td>
                                        <td><%= booking.getBookingDate() %></td>
                                        <td><%= booking.getPickupLocation() %></td>
                                        <td><%= booking.getDropLocation() %></td>
                                        <td><%= booking.getDistance() %></td>  
                                       	<td><%= booking.getPrice() %></td>  
                                       	<td><%= booking.getTax() %></td> 
                                       	<td><%= booking.getDiscount() %></td> 
                                       	<td><%= booking.getTotalPrice() %></td> 
                                       	<td><%= booking.getBookingStatus() %></td>                                                                                                                      
                                        <td><%= booking.getCustomerId() %></td>
                                        <td><%= booking.getDriverId() %></td>
                                        <td><%= booking.getVehicleId() %></td>
                                        
                                        
                                        <td class="action-cell">
                                            <form action="<%= request.getContextPath() %>/Booking/updateBooking.jsp" method="GET" style="display:inline;">
                                                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                                <button type="submit" class="action-btn update-btn">Update</button>
                                            </form>

                                            <form action="DeleteBooking" method="POST" style="display:inline;">
                                                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                                <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this data?');">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Mobile cards view -->
                    <div class="mobile-cards">
                        <% for (Booking booking : bookingList) { %>
                            <div class="mobile-card">
                                <div class="mobile-card-header">
                                    <div class="mobile-card-title"><%= booking.getBookingDate() %></div>
                                    
                                </div>
                                <div class="mobile-card-row">
                                    <div class="mobile-card-label">Booking ID:</div>
                                    <div class="mobile-card-value"><%= booking.getBookingId() %></div>
                                </div>
                                <div class="mobile-card-row">
                                    <div class="mobile-card-label">Pickup Location:</div>
                                    <div class="mobile-card-value"><%= booking.getPickupLocation() %></div>
                                </div>
                                <div class="mobile-card-row">
                                    <div class="mobile-card-label">Drop Location:</div>
                                    <div class="mobile-card-value"><%= booking.getDropLocation() %></div>
                                </div>
                                 <div class="mobile-card-row">
                                    <div class="mobile-card-label">Price (LKR):</div>
                                    <div class="mobile-card-value"><%= booking.getPrice() %></div>
                                </div>
                                 <div class="mobile-card-row">
                                    <div class="mobile-card-label">Status:</div>
                                    <div class="mobile-card-value"><%= booking.getBookingStatus() %></div>
                                </div>
                                <div class="mobile-card-row">
                                    <div class="mobile-card-label">CustomerId:</div>
                                    <div class="mobile-card-value"><%= booking.getCustomerId() %></div>
                                </div>
                                 <div class="mobile-card-row">
                                    <div class="mobile-card-label">Driver Id:</div>
                                    <div class="mobile-card-value"><%= booking.getDriverId() %></div>
                                </div>
                                 <div class="mobile-card-row">
                                    <div class="mobile-card-label">Vehicle Id:</div>
                                    <div class="mobile-card-value"><%= booking.getVehicleId() %></div>
                                </div>
                                <div class="mobile-card-actions">
                                     <!--  <form action="<%= request.getContextPath() %>/Booking/updateBooking.jsp" method="GET" style="display:inline;">
                                                <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                                <button type="submit" class="action-btn update-btn">Update</button>
                                            </form>-->

                                    <form action="DeleteAdmin" method="POST">
                                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                        <button type="submit" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this data?');">Delete</button>
                                    </form>
                                </div>
                            </div>
                        <% } %>
                    </div>

                    <div class="pagination">
                        <button class="pagination-button">
                            <i class="ri-arrow-left-s-line"></i>
                        </button>
                        <button class="pagination-button active">1</button>
                        <button class="pagination-button">2</button>
                        <button class="pagination-button ">3</button>
                        <button class="pagination-button">
                            <i class="ri-arrow-right-s-line"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Mobile sidebar toggle functionality
        document.addEventListener('DOMContentLoaded', function() {
            const openSidebarBtn = document.getElementById('openSidebar');
            const closeSidebarBtn = document.getElementById('closeSidebar');
            const sidebar = document.getElementById('sidebar');
            const overlay = document.getElementById('sidebarOverlay');
            
            // Open sidebar
            openSidebarBtn.addEventListener('click', function() {
                document.body.classList.add('sidebar-open');
            });
            
            // Close sidebar when clicking the close button or overlay
            function closeSidebar() {
                document.body.classList.remove('sidebar-open');
            }
            
            closeSidebarBtn.addEventListener('click', closeSidebar);
            overlay.addEventListener('click', closeSidebar);
            
            // Close sidebar when window is resized to desktop size
            window.addEventListener('resize', function() {
                if (window.innerWidth > 992) {
                    document.body.classList.remove('sidebar-open');
                }
            });
        });
    </script>
</body>
</html>