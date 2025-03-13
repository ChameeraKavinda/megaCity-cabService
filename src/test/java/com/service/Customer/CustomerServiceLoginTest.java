package com.service.Customer;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import com.doa.CustomerDOA;
import com.model.Customer;
import com.service.CustomerService;

public class CustomerServiceLoginTest {

    private CustomerDOA customerDOA;
    private CustomerService customerService;

    @Before
    public void setUp() {
        customerDOA = Mockito.mock(CustomerDOA.class);
        customerService = new CustomerService();
    }

    @Test
    public void testAuthenticateCustomer_Success() {
    	 String email = "chameerakavinda513@gmail.com";
         String password = "chameera123";
         Customer mockCustomer = new Customer(38, "Chameera Kavinda", email, password, "200213402705", "0782345678", "No:33/2, Pilawala Sout,h Pilawala");
         
        
        Mockito.when(customerDOA.authenticateCustomer(email, password)).thenReturn(mockCustomer);

        Customer result = customerService.authenticateCustomer(email, password);
        
        assertNotNull("Customer should be authenticated successfully", result);
        assertEquals("Email should match", email, result.getEmail());
    }

    @Test
    public void testAuthenticateCustomer_Failure() {
    	 String email = "chameerakavinda513@gmail.com";
         String password = "";
         Customer mockCustomer = new Customer(38, "Chameera Kavinda", email, password, "200213402705", "0782345678", "No:33/2, Pilawala Sout,h Pilawala");
         
        
        Mockito.when(customerDOA.authenticateCustomer(email, password)).thenReturn(mockCustomer);

        Customer result = customerService.authenticateCustomer(email, password);
        
        assertNotNull("Customer should be authenticated Unsuccessfully", result);
        assertEquals("Email should not match", email, result.getEmail());
    }
}
