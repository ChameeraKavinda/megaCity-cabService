package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doa.DBConnectionFactory;
import com.model.Booking;
import com.service.BookingService;
import Utility.EmailService;

@WebServlet("/Booking/addBooking")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public BookingController() {
        super();
        this.bookingService = BookingService.getInstance();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        this.bookingService = BookingService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingDate = request.getParameter("bookingDate");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        double distance = Double.parseDouble(request.getParameter("distance"));
        String bookingStatus = request.getParameter("bookingStatus");
        double price = Double.parseDouble(request.getParameter("price"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int driverId = Integer.parseInt(request.getParameter("driverId"));
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        double tax = Double.parseDouble(request.getParameter("tax"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

        Booking booking = new Booking(0, bookingDate, pickupLocation, dropLocation, distance, price, bookingStatus, customerId, driverId, vehicleId, tax, discount, totalPrice);
        

        try {
            boolean isBooking = bookingService.addBooking(booking);
            if (isBooking) {
                String driverEmail = getDriverEmail(driverId);
                	getCustomerName(customerId);
                	getCustomerPhoneNumber( customerId);
                	

                if (driverEmail != null) {
                    String subject = "New Booking Alert";
                    String messageBody = "<div style='font-family: Arial, sans-serif; border: 1px solid #ddd; padding: 20px; width: 500px;'>"
                            + "<h2 style='text-align: center; color: #2c3e50;'>"
                            + "<i class='ri-taxi-fill' style='color: #e67e22;'></i> MegaCity Cab Service</h2>"
                            + "<hr style='border: 1px solid #ddd;'>"
                            + "<h3 style='color: #e67e22;'><i class='ri-file-list-3-line'></i> Booking Invoice</h3>"
                            + "<p><strong>Dear Driver,</strong></p>"
                            + "<p>You have received a new booking. Please find the details below:</p>"

                            + "<table style='width: 100%; border-collapse: collapse;'>"
                            + "<tr style='border-bottom: 1px solid #ddd; padding: 8px;'>"
                            + "    <td style='padding: 8px; width: 50%;'>"
                            + "        <strong><i class='ri-user-2-fill'></i> Customer Name: </strong><br> "
                            + "        <span style='margin-left: 10px;'>" + getCustomerName(customerId) + "</span>"
                            + "    </td>"
                            + "    <td style='padding: 8px; width: 50%;'>"
                            + "        <strong><i class='ri-phone-fill'></i> Customer Phone No: </strong><br> "
                            + "        <a href='callto:" + getCustomerPhoneNumber(customerId) + "' style='text-decoration: none; color: blue; margin-left: 10px;'>"
                            +              getCustomerPhoneNumber(customerId)
                            + "        </a>"
                            + "    </td>"
                            + "</tr>"


                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-map-pin-line'></i> Pickup Location:</strong></td><td style='padding: 8px;'>" + pickupLocation + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-map-pin-fill'></i> Drop Location:</strong></td><td style='padding: 8px;'>" + dropLocation + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-calendar-event-line'></i> Date & Time:</strong></td><td style='padding: 8px;'>" + bookingDate + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-cash-line'></i> Fare Estimate:</strong></td><td style='padding: 8px;'>LKR " + price + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-cash-line'></i> Tax:</strong></td><td style='padding: 8px;'>LKR " + tax + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-cash-line'></i> Discount:</strong></td><td style='padding: 8px;'>LKR " + discount + "</td></tr>"
                            + "  <tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-cash-line'></i> Total Fare:</strong></td><td style='padding: 8px;'>LKR " + totalPrice + "</td></tr>"



                            + "</table>"

                            + "<p><i class='ri-links-line'></i> <a href='https://megacitycab.com/dashboard' style='color: #2980b9;'>Check your dashboard</a> for more details.</p>"
                            + "<hr style='border: 1px solid #ddd;'>"
                            + "<p><i class='ri-steering-2-fill'></i> <strong>Safe Driving!</strong></p>"
                            + "<p>Best Regards,<br><strong>MegaCity Cab Service</strong></p>"
                            + "<p><i class='ri-phone-fill'></i> Contact:<a href='callto:0753998444'> 07052209##</p>"
                            + "<p><i class='ri-mail-line'></i> <a href='mailto:chameeratest@gmail.com'>megacitycabservice@gmail.com</a></p>"
                            + "</div>";

                    EmailService.sendEmail(driverEmail, subject, messageBody);
                }
                
                String customerEmail = getCustomerEmail(customerId);
                String customerName =getCustomerName(customerId);
                String driverName =getDriverrName(driverId);
                getDriverrPhoneNumber( driverId);

                if (customerEmail != null) {
                    String subject = "New Booking Alert";
                    String messageBody = "<div style='font-family: Arial, sans-serif; border: 1px solid #ddd; padding: 20px; width: 500px;'>"
                            + "<h2 style='text-align: center; color: #2c3e50;'>"
                            + "<i class='ri-taxi-fill' style='color: #e67e22;'></i> MegaCity Cab Service</h2>"
                            + "<hr style='border: 1px solid #ddd;'>"
                            + "<h3 style='color: #e67e22;'><i class='ri-file-list-3-line'></i> Booking Invoice</h3>"
                            + "<p><strong>Dear " + customerName + ",</strong></p>"
                            + "<p>Thank you for choosing MegaCity Cab Service! Your booking has been confirmed.</p>"

                            + "<table style='width: 100%; border-collapse: collapse;'>"
                            + "<tr style='border-bottom: 1px solid #ddd; padding: 8px;'>"
                            + "    <td style='padding: 8px; width: 50%;'>"
                            + "        <strong><i class='ri-user-2-fill'></i> Driver Name: </strong><br> "
                            + "        <span style='margin-left: 10px;'>" + driverName + "</span>"
                            + "    </td>"
                            + "    <td style='padding: 8px; width: 50%;'>"
                            + "        <strong><i class='ri-phone-fill'></i> Driver Phone No: </strong><br> "
                            + "        <a href='callto:" + getDriverrPhoneNumber( driverId) + "' style='text-decoration: none; color: blue; margin-left: 10px;'>"
                            +              getDriverrPhoneNumber( driverId)
                            + "        </a>"
                            + "    </td>"
                            + "</tr>"

                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-map-pin-line'></i> Pickup Location:</strong></td><td style='padding: 8px;'>" + pickupLocation + "</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-map-pin-fill'></i> Drop Location:</strong></td><td style='padding: 8px;'>" + dropLocation + "</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-calendar-event-line'></i> Date & Time:</strong></td><td style='padding: 8px;'>" + bookingDate + "</td></tr>"
                            + "</table>"

                            + "<h3 style='color: #27ae60;'><i class='ri-cash-line'></i> Payment Details</h3>"
                            + "<table style='width: 100%; border-collapse: collapse;'>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-road-map-line'></i> Distance:</strong></td><td style='padding: 8px;'>" + distance + " km</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-money-dollar-circle-line'></i> Base Fare:</strong></td><td style='padding: 8px;'>LKR " + price + "</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-money-dollar-circle-line'></i> Discount:</strong></td><td style='padding: 8px;'>LKR " + discount + "</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 1px solid #ddd;'><strong><i class='ri-money-dollar-circle-line'></i> Tax:</strong></td><td style='padding: 8px;'>LKR " + tax + "</td></tr>"
                            + "<tr><td style='padding: 8px; border-bottom: 2px solid #000;'><strong><i class='ri-taxi-line'></i> Total Fare:</strong></td><td style='padding: 8px;'><strong>LKR " + totalPrice + "</strong></td></tr>"
                            + "</table>"

                            + "<p><i class='ri-links-line'></i> <a href='https://megacitycab.com/account' style='color: #2980b9;'>View Booking Details</a></p>"
                            + "<hr style='border: 1px solid #ddd;'>"
                            + "<p><i class='ri-steering-2-fill'></i> <strong>Safe Travels!</strong></p>"
                            + "<p>Best Regards,<br><strong>MegaCity Cab Service</strong></p>"
                            + "<p><i class='ri-phone-fill'></i> Contact: <a href='callto:0753998444'>07052209##</p>"
                            + "<p><i class='ri-mail-line'></i> <a href='mailto:chameeratest@gmail.com'>megacitycabservice@gmail.com</a></p>"
                            + "</div>";

                    
                    EmailService.sendEmail(customerEmail, subject, messageBody);
                }
                response.getWriter().write("<script>"
                	    + "if (confirm('Successful Booking! Check your Email')) {"
                	    + "   window.location.href='" + request.getContextPath() + "/intro.jsp';"
                	    + "}"
                	    + "</script>");
            } else {
                response.getWriter().write("Booking Added Failed");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    // Fetch the driver's email from the database
    private String getDriverEmail(int driverId) {
        String email = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT email FROM driver WHERE driverId = ?")) {
            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
    
    
    private String getCustomerEmail(int customerId) {
        String email = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT email FROM customer WHERE customerId = ?")) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
    private String getCustomerName(int customerId) {
        String name = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT name FROM customer WHERE customerId = ?")) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	name = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }
    
    private String getCustomerPhoneNumber(int customerId) {
        String phoneNumber = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT phoneNumber FROM customer WHERE customerId = ?")) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	phoneNumber = rs.getString("phoneNumber");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return phoneNumber;
    }
    
    
    private String getDriverrName(int driverId) {
        String name = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT name FROM driver WHERE driverId = ?")) {
            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	name = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }
    
    private String getDriverrPhoneNumber(int driverId) {
        String phoneNumber = null;
        try (Connection connection = DBConnectionFactory.getConnection();
             PreparedStatement stmt = connection.prepareStatement("SELECT phoneNumber FROM driver WHERE driverId = ?")) {
            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	phoneNumber = rs.getString("phoneNumber");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return phoneNumber;
    }
}
