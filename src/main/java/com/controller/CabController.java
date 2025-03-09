package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.Cab;
import com.service.CabService;

@WebServlet("/Cab/cabRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CabController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "uploads";
    private CabService cabService;

    public CabController() {
        super();
        this.cabService = CabService.getInstance();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        this.cabService = CabService.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String carModel = request.getParameter("carModel");
        String registerNumber = request.getParameter("registerNumber");
        String description = request.getParameter("description");
        boolean isAC = Boolean.parseBoolean(request.getParameter("isAC"));
        double kmPerHour = Double.parseDouble(request.getParameter("kmPerHour"));
        String subDescription=request.getParameter("subDescription");
        double rate = Double.parseDouble(request.getParameter("rate"));


        // Handle file upload
        Part filePart = request.getPart("carImage");
        String fileName = extractFileName(filePart);
        String savePath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir(); 
        }

        String filePath = savePath + File.separator + fileName;
        filePart.write(filePath); 

        // Save relative path in database
        String dbFilePath = UPLOAD_DIRECTORY + "/" + fileName;

        // Create Cab object
        Cab cab=new Cab(0, dbFilePath, carModel, registerNumber, description, isAC, kmPerHour, subDescription, rate);
        try {
            boolean isRegistered = cabService.registerCab(cab);
            if (isRegistered) {
                response.sendRedirect(request.getContextPath() + "/Cab/cabList.jsp");
            } else {
                response.getWriter().write("Cab Registration Failed");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }

        System.out.println("Cab Registration Process Completed");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.jpg";
    }
}
