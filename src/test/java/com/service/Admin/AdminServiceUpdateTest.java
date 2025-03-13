package com.service.Admin;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

import com.doa.AdminDOA;
import com.model.Admin;
import com.service.AdminService;

public class AdminServiceUpdateTest {
	private AdminDOA adminDOA;
    private AdminService adminService;

    @Before
    public void setUp() {
    	adminDOA = Mockito.mock(AdminDOA.class);
    	adminService = new AdminService();
    }
    

    @Test
    public void testUpdateAdmin_Failure() {
        Admin admin = new Admin(87, "Gihan Bnadara", "gihanh@example.com", "password123", "4544589V", "Staff");
         
         Mockito.when(adminDOA.updateAdmin(admin)).thenReturn(true);

         boolean result = adminService.updateAdmin(admin);
         
         assertTrue("Admin details should be updated Unsuccessfully", result);
    }
    
    @Test
    public void testUpdateAdmin_Success() {
        Admin admin = new Admin(13, "Admin Check", "admincheck@example.com", "password123", "4544589V", "Staff");
        
        Mockito.when(adminDOA.updateAdmin(admin)).thenReturn(true);

        boolean result = adminService.updateAdmin(admin);
        
        assertTrue("Admin details should be updated successfully", result);
    }

    

}
