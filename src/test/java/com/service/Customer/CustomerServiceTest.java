package com.service.Customer;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.doa.CustomerDOA;
import com.model.Customer;
import com.service.CustomerService;

public class CustomerServiceTest {

    private CustomerDOA customerDOA;
    private CustomerService customerService;

    @Before
    public void setUp() {
        customerDOA = new CustomerDOA();
        customerService = new CustomerService();
    }

    @Test
    public void testRegisterCustomer_Success() {
        Customer customer = new Customer(0, "Gihan Bnadara", "gihanh@example.com", "password123", "4544589V", "0712347878", "No:78/4Main Kandy");

        boolean result = customerService.registerCustomer(customer);

        assertTrue("Customer should be registered successfully", result);
    }

    @Test
    public void testRegisterCustomer_Failure() {
       
        Customer customer = new Customer(0, "dd", "", "password456", "987654321V", "0723456789", "456 Side St");

        boolean result = customerService.registerCustomer(customer);

        assertFalse("Customer registration should fail", result);
    }
}
