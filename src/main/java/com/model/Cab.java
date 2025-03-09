package com.model;

public class Cab {
    private int cabId;
    private String carImage;
    private String carModel;
    private String registerNumber;
    private String description;
    private boolean isAC;
    private double kmPerHour;
    private String subDescription;
    private double rate;

    public Cab(int cabId, String carImage, String carModel, String registerNumber, String description, boolean isAC, double kmPerHour,String subDescription,double rate) {
        this.cabId = cabId;
        this.carImage = carImage;
        this.carModel = carModel;
        this.registerNumber = registerNumber;
        this.description = description;
        this.isAC = isAC;
        this.kmPerHour = kmPerHour;
        this.subDescription=subDescription;
        this.rate=rate;
    }

	public int getCabId() {
		return cabId;
	}

	public void setCabId(int cabId) {
		this.cabId = cabId;
	}

	public String getCarImage() {
		return carImage;
	}

	public void setCarImage(String carImage) {
		this.carImage = carImage;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getRegisterNumber() {
		return registerNumber;
	}

	public void setRegisterNumber(String registerNumber) {
		this.registerNumber = registerNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isAC() {
		return isAC;
	}

	public void setAC(boolean isAC) {
		this.isAC = isAC;
	}

	public double getKmPerHour() {
		return kmPerHour;
	}

	public void setKmPerHour(double kmPerHour) {
		this.kmPerHour = kmPerHour;
	}

	public String getSubDescription() {
		return subDescription;
	}

	public void setSubDescription(String subDescription) {
		this.subDescription = subDescription;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

    
}
