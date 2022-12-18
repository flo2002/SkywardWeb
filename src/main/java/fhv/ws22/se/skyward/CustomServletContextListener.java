package fhv.ws22.se.skyward;

import fhv.ws22.se.skyward.domain.service.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.rmi.Naming;

public class CustomServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SessionService session = null;
        try {
            session = (SessionService) Naming.lookup("rmi://localhost/SkywardDomainService");
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

        ServletContext context = sce.getServletContext();
        ServiceProviderService serviceProvider = session.getServiceProvider();
        context.setAttribute("domainService", serviceProvider.getService(DomainService.class));
        context.setAttribute("tmpDataService", serviceProvider.getService(TmpDataService.class));
        context.setAttribute("emailService", serviceProvider.getService(EmailService.class));
    }
}
