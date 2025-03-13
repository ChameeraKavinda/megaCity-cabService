package com.service.Admin;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.AdminDOA;
import com.service.AdminService;

public class AdminServiceDeleteTest {
	private AdminDOA adminDOA;
    private AdminService adminService;

    @Before
    public void setUp() {
    	adminDOA = Mockito.mock(AdminDOA.class);
    	adminService = new AdminService();
    }
 
    @Test
    public void testDeleteAdmin_Failure() {
    	int adminId = 85;
        
    	Mockito.when(adminDOA.deleteAdmin(adminId)).thenReturn(true);

        boolean result = adminService.deleteAdmin(adminId);
        
        assertTrue("Admin should be deleted Failed", result);
    }
}
