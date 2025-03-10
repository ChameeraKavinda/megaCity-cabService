package com.model;

public class Driver {
    private int driverId;
    private String name;
    private String email;
    private String password;
    private String nic;
    private String phoneNumber;
    private String availability; 

    // Constructor
    public Driver(int driverId, String name, String email, String password,  String nic, String phoneNumber, String availability) {
        this.driverId = driverId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.nic = nic;
        this.phoneNumber = phoneNumber;
        this.availability = availability;
    }

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
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

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAvailability() {
		return availability;
	}


	public void setGender(String availability) {
		this.availability = availability;
	}

	
    
}
