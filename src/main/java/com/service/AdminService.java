package com.service;

import com.doa.AdminDOA;
import com.model.Admin;
import com.model.Customer;

public class AdminService {
	private static AdminService instance;
	private AdminDOA adminDOA;
	
	
	public AdminService() {
		this.adminDOA= new AdminDOA();
	}
	
	public static AdminService getInstance()
	{
		if(instance==null) {
			synchronized (AdminService.class) {
				 if (instance == null) {
	                    instance = new AdminService();
	                }
				
			}
		}
		return instance;
	}
	
	// Method to register a admin
    public boolean registerAdmin(Admin admin) {
        boolean isRegistered = adminDOA.addAdmin(admin);
        if (!isRegistered) {
            System.err.println("Registration Failed");
        }
        return isRegistered;
    }
    

//    public Admin authenticateAdmin(String email, String password) {
//        return adminDOA.authenticateAdmin(email, password);
//    }
    
    // **Update Admin Details**
    public boolean updateAdmin(Admin admin) {
        return adminDOA.updateAdmin(admin);
    }

    // **Delete Customer**
    public boolean deleteAdmin(int adminId) {
        return adminDOA.deleteAdmin(adminId);
    }
}
