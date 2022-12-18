package fhv.ws22.se.skyward;

import fhv.ws22.se.skyward.domain.service.DomainService;
import fhv.ws22.se.skyward.domain.service.ServiceProviderService;
import fhv.ws22.se.skyward.domain.service.SessionService;
import fhv.ws22.se.skyward.domain.service.TmpDataService;
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

        ServiceProviderService serviceProvider = session.getServiceProvider();
        sce.getServletContext().setAttribute("domainService", serviceProvider.getService(DomainService.class));
        sce.getServletContext().setAttribute("tmpDataService", serviceProvider.getService(TmpDataService.class));
    }
}
