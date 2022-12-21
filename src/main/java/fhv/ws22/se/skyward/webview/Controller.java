package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.dtos.AddressDto;
import fhv.ws22.se.skyward.domain.dtos.BookingDto;
import fhv.ws22.se.skyward.domain.dtos.CustomerDto;
import fhv.ws22.se.skyward.domain.dtos.RoomDto;
import fhv.ws22.se.skyward.domain.service.DomainService;
import fhv.ws22.se.skyward.domain.service.EmailService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = {"/controller"})
public class Controller extends HttpServlet {
    private DomainService domainService;
    private EmailService emailService;

    public void init() {
        domainService = (DomainService) getServletContext().getAttribute("domainService");
        emailService = (EmailService) getServletContext().getAttribute("emailService");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String checkIn = request.getParameter("checkin");
            String checkOut = request.getParameter("checkout");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String street = request.getParameter("street");
            String number = request.getParameter("housenumber");
            String zip = request.getParameter("zip");
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            String customerType = request.getParameter("customerType");
            String email = request.getParameter("email");
            String rooms = request.getParameter("roomDropDownList");


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

            Pattern p = Pattern.compile("[0-9]+");
            Matcher m = p.matcher(rooms);
            List<RoomDto> selectedRoomList = new ArrayList<>();
            List<RoomDto> allRooms = domainService.getAll(RoomDto.class);
            while (m.find()) {
                Integer roomNumber = Integer.parseInt(m.group());
                for (RoomDto room : allRooms) {
                    if (room.getRoomNumber().equals(roomNumber)) {
                        selectedRoomList.add(room);
                    }
                }
            }
            booking.setRooms(selectedRoomList);

            if (booking.getRooms().size() > 2) {
                request.getSession().setAttribute("error", "You can only book 2 rooms at a time");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }


            domainService.add(address);
            domainService.add(customer);
            domainService.add(booking);

            String[] checkInPart = checkIn.split("-");
            String[] checkOutPart = checkOut.split("-");
            String formatCheckIn = checkInPart[2] + "." + checkInPart[1] + "." + checkInPart[0];
            String formatCheckOut = checkOutPart[2] + "." + checkOutPart[1] + "." + checkOutPart[0];
            emailService.sendEmail(email, "Booking confirmation", "Dear " + firstname + " " + lastname + ",\n" +
                    "Thank you for your booking at Skyward Hotel.\n" +
                    "Your booking details:\n" +
                    "Check-in: " + formatCheckIn + "\n" +
                    "Check-out: " + formatCheckOut + "\n" +
                    "Room: " + rooms + "\n" +
                    "We are looking forward to welcoming you at Skyward Hotel.\n" +
                    "Best regards,\n" +
                    "Skyward Hotel\n\n");


            request.getSession().setAttribute("success", booking);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/success.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.getSession().setAttribute("error", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }
}