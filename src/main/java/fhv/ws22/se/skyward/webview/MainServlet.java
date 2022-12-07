package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.SessionService;
import fhv.ws22.se.skyward.domain.dtos.AbstractDto;
import fhv.ws22.se.skyward.domain.dtos.CustomerDto;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "mainServlet", value = "/main-servlet")
public class MainServlet extends HttpServlet {
    private SessionService session;

    public void init() {
        session = (SessionService) getServletContext().getAttribute("session");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<AbstractDto> customers = session.getAll(CustomerDto.class);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        for (AbstractDto customer : customers) {
            response.getWriter().println(customer);
            response.getWriter().println("<br>");
        }
    }

    public void destroy() {
    }
}
