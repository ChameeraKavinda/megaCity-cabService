package com.service;



import com.doa.CabDAO;
import com.model.Cab;

public class CabService {
    private static CabService instance;
    private CabDAO cabDAO;

    public CabService() {
        this.cabDAO = new CabDAO();
    }

    public static CabService getInstance() {
        if (instance == null) {
            synchronized (CabService.class) {
                if (instance == null) {
                    instance = new CabService();
                }
            }
        }
        return instance;
    }

    public boolean registerCab(Cab cab) {
        boolean isRegistered = cabDAO.addCab(cab);
        if (!isRegistered) {
            System.err.println("Cab Registration Failed");
        }
        return isRegistered;
    }

    public Cab getCabByRegisterNumber(String registerNumber) {
        return cabDAO.getCabByRegisterNumber(registerNumber);
    }
    
    
}
