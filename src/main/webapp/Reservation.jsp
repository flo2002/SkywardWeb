<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<ul class="navbar">
    <a><img class="logo" src="SkyWardIcon.png" alt="Icon" style=width:70px;height:70px;/></a>
    <li class="navbar"><a href="index.jsp">Home</a></li>
    <li class="navbar"><a class="active" href="Reservation.jsp">Reservation</a></li>
</ul>

<div class="image">
    <div class="content">

                <form class="regist" name='registration' action="./controller" method="get">
                    <h1>Reservation Form</h1>
                    <p>Please fill to create a reservation.</p>
                    <hr>

                    <div class="form-group">
                        <label for="firstname"><b>Firstname:</b></label><br>
                        <input type="text" name="firstname" id="firstname"/>
                    </div>

                    <div class="form-group">
                        <label for="lastname"><b>Lastname:</b></label><br>
                        <input type="text" name="lastname" id="lastname"/>
                    </div>

                    <div class="form-street">
                        <label for="street"><b>Street:</b></label><br>
                        <input type="text" name="street" id="street" style="width: 80%;"/>
                    </div>

                    <div class="form-street">
                        <label for="housenumber"><b>Housenumber:</b></label><br>
                        <input type="text" name="housenumber" id="housenumber" style="width: 45%;"/>
                    </div>

                    <div class="form-group">
                        <label for="zip"><b>Zip:</b></label><br>
                        <input type="text" name="zip" id="zip"/>
                    </div>

                    <div class="form-group">
                        <label for="city"><b>City:</b></label><br>
                        <input type="text" name="city" id="city"/>
                    </div>

                    <div class="form-group">
                        <label for="country"><b>Country:</b></label><br>
                        <input type="text" name="country" id="country"/>
                    </div>

                    <div class="form-group">
                        <label for="check-in-date"><b>Check-in-date:</b></label><br>
                        <input type="date" name="check-in-date" id="check-in-date"/>
                    </div>

                    <div class="form-group">
                        <label for="check-out-date"><b>Check-out-date:</b></label><br>
                        <input type="date" name="check-out-date" id="check-out-date"/>
                    </div>

                    <br>

                    <div class="form-group">
                        <select name="roomtype" id="roomtype">
                            <option value="Default">(Please select a country)</option>
                            <option value="single">Single</option>
                            <option value="double">Double</option>
                            <option value="triple">Triple</option>
                            <option value="twin">Twin</option>
                            <option value="queen">Queen</option>
                        </select>
                    </div>
                <br>

                <button class="registerbtn" type="submit" action="./controller">Confirm</button>
        </form>
    </div>
</div>

</body>
</html>
