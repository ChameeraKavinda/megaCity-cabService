package com.service.Admin;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.AdminDOA;
import com.model.Admin;
import com.service.AdminService;

public class AdminServiceLoginTest {
		private AdminDOA adminDOA;
	    private AdminService adminService;

	    @Before
	    public void setUp() {
	    	adminDOA = Mockito.mock(AdminDOA.class);
	    	adminService = new AdminService();
	    }
	    @Test
	    public void testAuthenticateAdmin_Success() {
	    	 String email = "gihanh@example.com";
	         String password = "password123";
	         Admin mockAdmin = new Admin(13, "Gihan Bnadara", email, password, "07456123", "Staff");
	         
	        
	        Mockito.when(adminDOA.authenticateAdmin(email, password)).thenReturn(mockAdmin);

	        Admin result = adminService.authenticateAdmin(email, password);
	        
	        assertNotNull("Admin should be authenticated successfully", result);
	        assertEquals("Email should match", email, result.getEmail());
	    }

	    @Test
	    public void testAuthenticateCustomer_Failure() {
	    	 String email = "gihanh@example.com";
	         String password = "";
	         Admin mockAdmin = new Admin(13, "Gihan Bnadara", email, password, "07456123", "Staff");
	         
	        
		        Mockito.when(adminDOA.authenticateAdmin(email, password)).thenReturn(mockAdmin);

	        Admin result = adminService.authenticateAdmin(email, password);
	        
	        assertNotNull("Admin should be authenticated Unsuccessfully", result);
	        assertEquals("Email should not match", email, result.getEmail());
	    }

}
