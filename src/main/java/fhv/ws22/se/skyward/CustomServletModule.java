package fhv.ws22.se.skyward;

import com.google.inject.servlet.ServletModule;
import fhv.ws22.se.skyward.webview.MainServlet;

public class CustomServletModule extends ServletModule {
    @Override
    protected void configureServlets() {
        bind(MainServlet.class);
        serve("/main-servlet").with(MainServlet.class);
        //serve("/main-servlet").with(MainServlet.class);
    }
}
