package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doa.DBConnectionFactory;

@WebServlet("/CabDetailsServlet")
public class CabDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String cabIdParam = request.getParameter("cabId");

        // Validate cabId parameter
        if (cabIdParam == null || cabIdParam.trim().isEmpty()) {
            request.setAttribute("error", "Invalid cab ID.");
            forwardToCabDetailsPage(request, response);
            return;
        }

        int cabId;
        try {
            cabId = Integer.parseInt(cabIdParam.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid cab ID format.");
            forwardToCabDetailsPage(request, response);
            return;
        }

        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cab WHERE cabId = ?")) {
            
            stmt.setInt(1, cabId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String carImagePath = request.getContextPath() + "/uploads/" + rs.getString("carImage");
                request.setAttribute("carImage", carImagePath);
                request.setAttribute("carModel", rs.getString("carModel"));
                request.setAttribute("isAC", rs.getBoolean("isAC") ? "AC" : "Non-AC");
                request.setAttribute("rate", rs.getDouble("rate"));
                request.setAttribute("cabId", cabId);  
                request.setAttribute("cabFound", true);
            } else {
                request.setAttribute("error", "No cab details found for ID: " + cabId);
                request.setAttribute("cabFound", false); 
            }
        } catch (Exception e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.setAttribute("cabFound", false); 
        }

        forwardToCabDetailsPage(request, response);
    }

    private void forwardToCabDetailsPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Cab/cabDetails.jsp");
        dispatcher.forward(request, response);
    }
}
