package fhv.ws22.se.skyward;

import com.google.inject.Guice;
import com.google.inject.Injector;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class CustomServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Injector injector = Guice.createInjector(new AppConfig());
        sce.getServletContext().setAttribute("injector", injector);
        System.out.println("Context initialized");
    }
}
