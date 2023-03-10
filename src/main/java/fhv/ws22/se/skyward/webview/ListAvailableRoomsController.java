package fhv.ws22.se.skyward.webview;

import fhv.ws22.se.skyward.domain.dtos.RoomDto;
import fhv.ws22.se.skyward.domain.service.DomainService;
import fhv.ws22.se.skyward.domain.service.SessionService;
import fhv.ws22.se.skyward.domain.service.TmpDataService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.gson.Gson;

@WebServlet("/list-available-rooms")
public class ListAvailableRoomsController extends HttpServlet {
    private DomainService domainService;
    private TmpDataService tmpDataService;

    public void init() {
        domainService = (DomainService) getServletContext().getAttribute("domainService");
        tmpDataService = (TmpDataService) getServletContext().getAttribute("tmpDataService");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LocalDate checkIn = LocalDate.parse(request.getParameter("checkin"));
        LocalDate checkOut = LocalDate.parse(request.getParameter("checkout"));
        LocalDateTime checkInDateTime = LocalDateTime.of(checkIn, LocalTime.of(12, 0));
        LocalDateTime checkOutDateTime = LocalDateTime.of(checkOut, LocalTime.of(12, 0));

        List<RoomDto> availableRooms = domainService.getAvailableRooms(checkInDateTime, checkOutDateTime);
        // add room prices to the roomType
        for (RoomDto room : availableRooms) {
            room.setRoomTypeName(room.getRoomTypeName());
            room.setRoomStateName(tmpDataService.getPrice(room.getRoomTypeName()).toString());
        }
        String json = new Gson().toJson(availableRooms);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
