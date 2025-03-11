package com.service;

import com.doa.CustomerDOA;
import com.model.Customer;

public class CustomerService {
    private static CustomerService instance;
    private CustomerDOA customerDOA;

    public CustomerService() {
        this.customerDOA = new CustomerDOA();
    }

    public static CustomerService getInstance() {
        if (instance == null) {
            synchronized (CustomerService.class) {
                if (instance == null) {
                    instance = new CustomerService();
                }
            }
        }
        return instance;
    }

    public boolean registerCustomer(Customer customer) {
        boolean isRegistered = customerDOA.addCustomer(customer);
        if (!isRegistered) {
            System.err.println("Registration Failed");
        }
        return isRegistered;
    }
    

    public Customer authenticateCustomer(String email, String password) {
        return customerDOA.authenticateCustomer(email, password);
    }
    

    public boolean updateCustomer(Customer customer) {
        return customerDOA.updateCustomer(customer);
    }

    public boolean deleteCustomer(int customerId) {
        return customerDOA.deleteCustomer(customerId);
    }

   

}
