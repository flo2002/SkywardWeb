<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="javascript.js"></script>
</head>
<body>

<ul class="navbar">
    <a><img class="logo" src="SkyWardIcon.png" alt="Icon" style=width:70px;height:70px;/></a>
    <li class="navbar"><a href="index.jsp">Home</a></li>
    <li class="navbar"><a class="active" href="Reservation.jsp">Reservation</a></li>
</ul>

<div class="image">
    <div class="content">

                <form id="booking-form" class="regist" name='registration' action="./controller" onSubmit="return formValidation();" method="get">
                    <h1>Reservation Form</h1>
                    <p>Please fill to create a reservation.</p>
                    <hr>

                    <div class="form-group">
                        <label for="firstname"><b>Firstname:</b></label><br>
                        <input type="text" name="firstname" id="firstname" required/>
                    </div>

                    <div class="form-group">
                        <label for="lastname"><b>Lastname:</b></label><br>
                        <input type="text" name="lastname" id="lastname" required/>
                    </div>

                    <div class="form-street">
                        <label for="street"><b>Street:</b></label><br>
                        <input type="text" name="street" id="street" style="width: 80%;" required/>
                    </div>

                    <div class="form-street">
                        <label for="housenumber"><b>Housenumber:</b></label><br>
                        <input type="text" name="housenumber" id="housenumber" style="width: 45%;" required/>
                    </div>

                    <div class="form-group">
                        <label for="zip"><b>Zip:</b></label><br>
                        <input type="text" name="zip" id="zip" required/>
                    </div>

                    <div class="form-group">
                        <label for="city"><b>City:</b></label><br>
                        <input type="text" name="city" id="city" required/>
                    </div>

                    <div class="form-group">
                        <label for="country"><b>Country:</b></label><br>
                        <input type="text" name="country" id="country" required/>
                    </div>

                    <div class="form-group">
                        <label for="check-in-date"><b>Check-in-date:</b></label><br>
                        <input type="date" name="check-in-date" id="check-in-date" min="1900-01-01" required/>
                    </div>

                    <div class="form-group">
                        <label for="check-out-date"><b>Check-out-date:</b></label><br>
                        <input type="date" name="check-out-date" id="check-out-date" required/>
                    </div>

                    <br>

                    <div class="form-group">
                        <select name="roomtype" id="roomtype" required>
                            <option value="Default">(Please select a country)</option>
                            <option value="single">Single</option>
                            <option value="double">Double</option>
                            <option value="triple">Triple</option>
                            <option value="twin">Twin</option>
                            <option value="queen">Queen</option>
                        </select>
                    </div>
                <br>

                    <button type="reset" class="registerbtn" type="submit" style="background-color: red">Delete</button>

                <button class="registerbtn" type="submit" action="./controller">Confirm</button>
                </form>
    </div>
</div>

</body>
</html>
