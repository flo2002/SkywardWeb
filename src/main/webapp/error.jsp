<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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

        <div class="title">Your Account could not be created due to an error!</div>
        <div class="smaller">We are so sorry, but maybe this log helps you find the error!</div>
        <div class="smaller">${sessionScope.error}</div>

    </div>
</div>
</body>
</html>

