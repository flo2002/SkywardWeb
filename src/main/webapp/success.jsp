<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="web.css">
    <script src="surprise.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
</head>

<body>

<nav>
    <div class="menu">
        <div class="logo">
            <a href="#">Skyward</a>
        </div>
        <ul>
            <li class="navbar"><a class="active" href="index.jsp">Home</a></li>
            <li class="navbar"><a href="Reservation.jsp">Reservation</a></li>
        </ul>
    </div>
</nav>

<div class="img">
    <div class="center">

        <div class="title">Your Account has been created!</div>
        <div class="smaller">Your CheckIn Date is: ${sessionScope.success.checkInDateTime}</div>
        <div class="smaller">Your CheckOut Date is: ${sessionScope.success.checkOutDateTime}</div>
        <div class="smaller">Your Name is: ${sessionScope.success.customers[0].firstName} ${sessionScope.success.customers[0].lastName}</div>
        <div class="smaller">Your Rooms are:
            <c:forEach items="${sessionScope.success.rooms}" var="room">
                <p>${room.roomTypeName} ${room.roomNumber}</p>
            </c:forEach>
        </div>

    </div>
</div>
</body>
</html>

