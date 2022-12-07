package fhv.ws22.se.skyward.webview;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import fhv.ws22.se.skyward.domain.SessionService;
import fhv.ws22.se.skyward.domain.dtos.AbstractDto;
import fhv.ws22.se.skyward.domain.dtos.CustomerDto;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


//@WebServlet(name = "mainServlet", value = "/main-servlet")
@Singleton
public class MainServlet extends HttpServlet {
    @Inject
    private SessionService session;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<AbstractDto> customers = session.getAll(CustomerDto.class);

        for (AbstractDto customer : customers) {
            response.getWriter().println(customer);
        }
    }

    public void destroy() {
    }
}
