package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.SessionService;
import fhv.ws22.se.skyward.domain.dtos.AddressDto;
import fhv.ws22.se.skyward.domain.dtos.BookingDto;
import fhv.ws22.se.skyward.domain.dtos.CustomerDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    private SessionService session;

    public void init() {

        session = (SessionService) getServletContext().getAttribute("session");

        // Bind the SessionService to the RMI registry
        try {
            Registry registry = LocateRegistry.getRegistry();
            registry.rebind("session", session);
        } catch (RemoteException e) {
            // Handle the error
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();

        response.setContentType("text/html");

        String checkIn = request.getParameter("check-in-date");
        String checkOut = request.getParameter("check-out-date");
        String room = request.getParameter("room-type");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String street = request.getParameter("street");
        String number = request.getParameter("housenumber");
        String zip = request.getParameter("zip");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String email = request.getParameter("email");

        pw.println("<link rel=\"stylesheet\" href=\"stylesheet.css\" type=\"text/css\" media=\"all\">");
        pw.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
        pw.println("<div class=\"main\">");
        pw.println("<div class=\"container\">");
        pw.println("<table class=\"table\" border='1'>");
        pw.println(" <thead>\n" +
                "    <tr>\n" +
                "    </tr>\n" +
                "  </thead>");

        pw.println("<tr>");
        pw.println("<td>"+ checkIn + "</td>");
        pw.println("<td>"+ checkOut + "</td>");
        pw.println("<td>"+ room + "</td>");
        pw.println("<td>"+ firstname + "</td>");
        pw.println("<td>"+ lastname + "</td>");
        pw.println("<td>"+ street + "</td>");
        pw.println("<td>"+ number + "</td>");
        pw.println("<td>"+ zip + "</td>");
        pw.println("<td>"+ city + "</td>");
        pw.println("<td>"+ country + "</td>");
        pw.println("<td>"+ email + "</td>");
        pw.println("</tr>");

        BookingDto booking = new BookingDto();
        CustomerDto customer = new CustomerDto();
        AddressDto address = new AddressDto();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate checkInDate = LocalDate.parse(checkIn, formatter);
        LocalDateTime checkInDateTime = LocalDateTime.of(checkInDate, LocalTime.MIDNIGHT);
        booking.setCheckInDateTime(checkInDateTime);

        address.setStreet(street);
        address.setHouseNumber(Integer.valueOf(number));
        address.setZipCode(Integer.valueOf(zip));
        address.setCity(city);
        address.setCountry(country);

        customer.setFirstName(firstname);
        customer.setLastName(lastname);
        customer.setAddress(address);

        session.add(booking);
        session.add(customer);

        pw.println("</div>");
        pw.println("</div>");

    }
}