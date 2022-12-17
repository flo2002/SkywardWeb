package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.SessionService;
import fhv.ws22.se.skyward.domain.dtos.RoomDto;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import com.google.gson.Gson;

@WebServlet("/list-available-rooms")
public class ListAvailableRoomsController extends HttpServlet {
    private SessionService session;

    public void init() {
        session = (SessionService) getServletContext().getAttribute("session");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LocalDate checkIn = LocalDate.parse(request.getParameter("checkin"));
        LocalDate checkOut = LocalDate.parse(request.getParameter("checkout"));
        LocalDateTime checkInDateTime = LocalDateTime.of(checkIn, LocalTime.of(12, 0));
        LocalDateTime checkOutDateTime = LocalDateTime.of(checkOut, LocalTime.of(12, 0));

        List<RoomDto> availableRooms = session.getAvailableRooms(checkInDateTime, checkOutDateTime);
        String json = new Gson().toJson(availableRooms);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String selectedRoom = request.getParameter("rooms");
        System.out.println(selectedRoom);
    }
}
