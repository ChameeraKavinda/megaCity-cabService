import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.controller.CustomerController;
import com.model.Customer;
import com.service.CustomerService;

public class CustomerControllerTest {
    
    @InjectMocks
    private CustomerController customerController;

    @Mock
    private CustomerService customerService;
    
    @Mock
    private HttpServletRequest request;
    
    @Mock
    private HttpServletResponse response;
    
    @Mock
    private RequestDispatcher dispatcher;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
    }
    
    @Test
    public void testDoPost_SuccessfulRegistration() throws Exception {
        when(request.getParameter("name")).thenReturn("Saman Banada");
        when(request.getParameter("email")).thenReturn("samann@example.com");
        when(request.getParameter("password")).thenReturn("d123");
        when(request.getParameter("nicNumber")).thenReturn("123456789V");
        when(request.getParameter("phoneNumber")).thenReturn("0771234567");
        when(request.getParameter("address")).thenReturn("123 Street, Colombo");
        when(customerService.registerCustomer(any(Customer.class))).thenReturn(true);
        
        doNothing().when(response).sendRedirect(anyString());
        
        customerController.doPost(request, response);
        
        verify(response).sendRedirect(request.getContextPath() + "/View/login.jsp");
    }
    
    @Test
    public void testDoPost_RegistrationFailure() throws Exception {
        when(request.getParameter("name")).thenReturn("Saman Banada");
        when(request.getParameter("email")).thenReturn("Saman@example.com");
        when(request.getParameter("password")).thenReturn("123");
        when(request.getParameter("nicNumber")).thenReturn("123456789V");
        when(request.getParameter("phoneNumber")).thenReturn("0771234567");
        when(request.getParameter("address")).thenReturn("123 Street, Colomco");
        when(customerService.registerCustomer(any(Customer.class))).thenReturn(false);
        
        // Set up a response writer to capture the output
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);
        
        // Call doPost and verify response handling
        customerController.doPost(request, response);
        
        writer.flush();
        
        // Check that the error message is correctly sent to the response
        assertTrue(stringWriter.toString().contains("Registration Failed"));
        
        // Also verify that no redirect happens
        verify(response, times(0)).sendRedirect(anyString());
    }
    
    @Test
    public void testDoPost_ExceptionHandling() throws Exception {
        when(request.getParameter("name")).thenReturn("Samane");
        when(request.getParameter("email")).thenReturn("saman@example.com");
        when(request.getParameter("password")).thenReturn("123");
        when(request.getParameter("nicNumber")).thenReturn("123456789V");
        when(request.getParameter("phoneNumber")).thenReturn("0771234567");
        when(request.getParameter("address")).thenReturn("123 Street, Colombo");
        
        // Throw a RuntimeException when registerCustomer is called
        when(customerService.registerCustomer(any(Customer.class))).thenThrow(new RuntimeException("Database Error"));
        
        // Set up a response writer to capture the output
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);
        
        // Call doPost and capture the response
        customerController.doPost(request, response);
        
        writer.flush();
        
        // Check that the error message is correctly sent to the response
        assertTrue(stringWriter.toString().contains("Error: Database Error"));
        
        // Verify no redirect happens on exception
        verify(response, times(0)).sendRedirect(anyString());
    }
}
