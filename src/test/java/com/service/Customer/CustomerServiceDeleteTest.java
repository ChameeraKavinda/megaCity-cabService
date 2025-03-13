package com.service.Customer;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.CustomerDOA;
import com.service.CustomerService;

public class CustomerServiceDeleteTest {

    private CustomerDOA customerDOA;
    private CustomerService customerService;

    @Before
    public void setUp() {
        customerDOA = Mockito.mock(CustomerDOA.class);
        customerService = new CustomerService();
    }

    @Test
    public void testDeleteCustomer_Success() {
        int customerId = 89;
        
        Mockito.when(customerDOA.deleteCustomer(customerId)).thenReturn(true);

        boolean result = customerService.deleteCustomer(customerId);
        
        assertTrue("Customer should be deleted successfully", result);
    }

    @Test
    public void testDeleteCustomer_Failure() {
    	int customerId = 79;
        
        Mockito.when(customerDOA.deleteCustomer(customerId)).thenReturn(true);

        boolean result = customerService.deleteCustomer(customerId);
        
        assertTrue("Customer should be deleted Failed", result);
    }
}
