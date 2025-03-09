package com.model;

public class Booking {
	private int bookingId;
	private String bookingDate;
	private String pickupLocation;
	private String dropLocation;
	private Double distance;
	private Double price;
	private String bookingStatus;
	private int customerId;
	private int driverId;
	private int vehicleId;
	private Double tax;
	private Double discount;
	private Double totalPrice;


	
	public Booking(int bookingId,String bookingDate,String pickupLocation,String dropLocation,Double distance,Double price,String bookingStatus,int customerId,int driverId,int vehicleId,Double tax,Double discount,Double totalPrice) {
		this.bookingId=bookingId;
		this.bookingDate=bookingDate;
		this.pickupLocation=pickupLocation;
		this.dropLocation=dropLocation;
		this.distance=distance;
		this.price=price;
		this.bookingStatus=bookingStatus;
		this.customerId=customerId;
		this.driverId=driverId;
		this.vehicleId=vehicleId;
		this.tax=tax;
		this.discount=discount;
		this.totalPrice=totalPrice;
		
		
		
	}



	public int getBookingId() {
		return bookingId;
	}



	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}



	public String getBookingDate() {
		return bookingDate;
	}



	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}



	public String getPickupLocation() {
		return pickupLocation;
	}



	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}



	public String getDropLocation() {
		return dropLocation;
	}



	public void setDropLocation(String dropLocation) {
		this.dropLocation = dropLocation;
	}



	public Double getDistance() {
		return distance;
	}



	public void setDistance(Double distance) {
		this.distance = distance;
	}



	public Double getPrice() {
		return price;
	}



	public void setPrice(Double price) {
		this.price = price;
	}



	public String getBookingStatus() {
		return bookingStatus;
	}



	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}



	public int getCustomerId() {
		return customerId;
	}



	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}



	public int getDriverId() {
		return driverId;
	}



	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}



	public int getVehicleId() {
		return vehicleId;
	}



	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}



	public Double getTax() {
		return tax;
	}



	public void setTax(Double tax) {
		this.tax = tax;
	}



	public Double getDiscount() {
		return discount;
	}



	public void setDiscount(Double discount) {
		this.discount = discount;
	}



	public Double getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	

	
}
 