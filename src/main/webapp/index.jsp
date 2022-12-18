<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <a href="index.jsp">Skyward</a>
        </div>
        <ul>
            <li class="navbar"><a class="active" href="index.jsp">Home</a></li>
            <li class="navbar"><a href="Reservation.jsp">Reservation</a></li>
        </ul>
    </div>
</nav>

<div class="img">
    <div class="center">
        <img id="image" src="rudolf.png" style="display:none; width: 500px; height: 500px;
        margin: 0 auto;">
        <div class="title">Welcome to Skyward</div>
        <div class="sub_title">Create your reservations for your dream holiday</div>
        <div class="btns">
            <button id="suprise" onclick="flyImage()">Surprise</button>
            <button onclick="window.location.href='Reservation.jsp';">Reservation</button>
        </div>
    </div>
</div>
</body>
</html>
