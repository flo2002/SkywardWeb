package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.SessionService;
import fhv.ws22.se.skyward.domain.dtos.AddressDto;
import fhv.ws22.se.skyward.domain.dtos.BookingDto;
import fhv.ws22.se.skyward.domain.dtos.CustomerDto;
import fhv.ws22.se.skyward.domain.dtos.RoomDto;
import jakarta.servlet.RequestDispatcher;
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
import java.util.ArrayList;
import java.util.List;

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

        String checkIn = request.getParameter("checkin");
        String checkOut = request.getParameter("checkout");
        String room = request.getParameter("room-type");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String street = request.getParameter("street");
        String number = request.getParameter("housenumber");
        String zip = request.getParameter("zip");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String customerType = request.getParameter("customerType");
        String email = request.getParameter("email");


        BookingDto booking = new BookingDto();
        CustomerDto customer = new CustomerDto();
        AddressDto address = new AddressDto();

        address.setStreet(street);
        address.setHouseNumber(Integer.valueOf(number));
        address.setZipCode(Integer.valueOf(zip));
        address.setCity(city);
        address.setCountry(country);

        customer.setFirstName(firstname);
        customer.setLastName(lastname);
        customer.setAddress(address);
        customer.setCustomerType(customerType);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate checkInDate = LocalDate.parse(checkIn, formatter);
        LocalDateTime checkInDateTime = LocalDateTime.of(checkInDate, LocalTime.MIDNIGHT);
        booking.setCheckInDateTime(checkInDateTime);
        LocalDate checkOutDate = LocalDate.parse(checkOut, formatter);
        LocalDateTime checkOutDateTime = LocalDateTime.of(checkOutDate, LocalTime.MIDNIGHT);
        booking.setCheckOutDateTime(checkOutDateTime);
        booking.setIsCheckedIn(false);
        List<CustomerDto> customers = new ArrayList<CustomerDto>();
        customers.add(customer);
        booking.setCustomers(customers);
        List<RoomDto> rooms = new ArrayList<RoomDto>();
        booking.setRooms(rooms);


        session.add(address);
        session.add(customer);
        session.add(booking);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request,response);
    }
}