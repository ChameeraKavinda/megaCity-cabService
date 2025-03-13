package com.service.Customer;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.CustomerDOA;
import com.model.Customer;
import com.service.CustomerService;

public class CustomerServiceUpdateTest {

    private CustomerDOA customerDOA;
    private CustomerService customerService;

    @Before
    public void setUp() {
        customerDOA = Mockito.mock(CustomerDOA.class);
        customerService = new CustomerService();
    }

   

    @Test
    public void testUpdateCustomer_Failure() {
    	 Customer customer = new Customer(99, "Gurawii Bnadara", "gdh@example.com", "password123", "4544589V", "0712347878", "No:78/4Main Kandy");
         
         Mockito.when(customerDOA.updateCustomer(customer)).thenReturn(true);

         boolean result = customerService.updateCustomer(customer);
         
         assertTrue("Customer details should be updated successfully", result);
    }
    
    @Test
    public void testUpdateCustomer_Success() {
        Customer customer = new Customer(87, "Gurawii Bnadara", "gdh@example.com", "password123", "4544589V", "0712347878", "No:78/4Main Kandy");
        
        Mockito.when(customerDOA.updateCustomer(customer)).thenReturn(true);

        boolean result = customerService.updateCustomer(customer);
        
        assertTrue("Customer details should be updated successfully", result);
    }
}
