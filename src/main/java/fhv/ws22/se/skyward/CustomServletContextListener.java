package fhv.ws22.se.skyward;

import fhv.ws22.se.skyward.domain.SessionService;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.rmi.Naming;

public class CustomServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SessionService session = null;
        try {
            session = (SessionService) Naming.lookup("rmi://localhost/SkywardDomainSession");
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

        sce.getServletContext().setAttribute("session", session);
    }
}
