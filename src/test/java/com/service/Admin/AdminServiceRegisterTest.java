package com.service.Admin;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.AdminDOA;
import com.model.Admin;
import com.service.AdminService;


public class AdminServiceRegisterTest {
    private AdminDOA adminDOA;

    private AdminService adminService;

    @Before
    public void setUp() {
    	adminDOA = Mockito.mock(AdminDOA.class);
    	adminService = new AdminService();
    }
    

    @Test
    public void testRegisterAdmin_Success() {
        Admin admin = new Admin(0, "Gihan Bnadara", "gihanh@example.com", "password123", "4544589V", "Staff");

        boolean result = adminService.registerAdmin(admin);

        assertTrue("Admin should be registered successfully", result);
    }

    @Test
    public void testRegisterAdmin_Failure() {
       
        Admin admin = new Admin(0, "", "gihanh@example.com", "password123", "4544589V", "Staff");

    	 boolean result = adminService.registerAdmin(admin);

        assertFalse("Admin registration should fail", result);
    }

}
