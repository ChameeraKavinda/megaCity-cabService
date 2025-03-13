package com.model;

public class Vehicle {
    private int id;
    private int driverId;
    private String vehicleType;
    private String licenseNumber;
    private String vehicleColor;
    private String manufactureDate;
    private String isAC;
    private String passengerType;
    private String imagePath;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public String getVehicleColor() { return vehicleColor; }
    public void setVehicleColor(String vehicleColor) { this.vehicleColor = vehicleColor; }

    public String getManufactureDate() { return manufactureDate; }
    public void setManufactureDate(String manufactureDate) { this.manufactureDate = manufactureDate; }

    public String getIsAC() { return isAC; }
    public void setIsAC(String isAC) { this.isAC = isAC; }

    public String getPassengerType() { return passengerType; }
    public void setPassengerType(String passengerType) { this.passengerType = passengerType; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}
