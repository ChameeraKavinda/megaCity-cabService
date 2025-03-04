package com.model;

public class Customer {
	 private int customerId;
	 private String name;
	 private String email;
	 private String password;
	 private String nicNumber;
	 private String phoneNumber;
	 private String address;

	 
	 public Customer(int customerId, String name,String email,String password,String nicNumber,String phoneNumber, String address) {
		 this.customerId=customerId;
		 this.name=name;
		 this.email=email;
		 this.password=password;
		 this.nicNumber=nicNumber;
		 this.phoneNumber=phoneNumber;
		 this.address=address;
		 
	 }


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNicNumber() {
		return nicNumber;
	}


	public void setNicNumber(String nicNumber) {
		this.nicNumber = nicNumber;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
}
