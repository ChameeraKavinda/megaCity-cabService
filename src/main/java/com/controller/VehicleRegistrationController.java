package com.controller;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.doa.VehicleDAO;
import com.model.Vehicle;


@WebServlet("/Driver/VehicleRegistrationController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class VehicleRegistrationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String vehicleType = request.getParameter("vehicleType");
            String licenseNumber = request.getParameter("licenseNumber");
            String vehicleColor = request.getParameter("vehicleColor");
            String manufactureDate = request.getParameter("manufactureDate");
            String isAC = request.getParameter("isAC");
            String passengerType = request.getParameter("passengerType");

            // Handle file upload
            Part filePart = request.getPart("vehicleImage"); // Get the uploaded file
            String fileName = System.currentTimeMillis() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();  
            String uploadDir = getServletContext().getRealPath("/") + "Vehicleuploads";  
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs(); 
            }

            String filePath = uploadDir + File.separator + fileName;  
            filePart.write(filePath);  

            Vehicle vehicle = new Vehicle();
            vehicle.setDriverId(driverId);
            vehicle.setVehicleType(vehicleType);
            vehicle.setLicenseNumber(licenseNumber);
            vehicle.setVehicleColor(vehicleColor);
            vehicle.setManufactureDate(manufactureDate);
            vehicle.setIsAC(isAC);
            vehicle.setPassengerType(passengerType);
            vehicle.setImagePath("Vehicleuploads/" + fileName);  

            boolean isAdded = new VehicleDAO().addVehicle(vehicle);

            if (isAdded) {
            	response.sendRedirect(request.getContextPath() + "/driverDashboard.jsp?driverId=" + driverId);
            } else {
                response.getWriter().write("Failed to register vehicle.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
